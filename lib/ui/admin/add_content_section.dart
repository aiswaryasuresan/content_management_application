import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_management_app/auth_service/database.dart';
import 'package:content_management_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddContentSection extends StatelessWidget {
  final DocumentSnapshot<Object?>? documentSnapshot;
  final VoidCallback onSubmit;
  AddContentSection({super.key, this.documentSnapshot, required this.onSubmit});

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (documentSnapshot != null) {
      titleController.text = documentSnapshot!["title"];
      descriptionController.text = documentSnapshot!["description"];
      imageUrlController.text = documentSnapshot!["image_url"];
    }

    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Content',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Title',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(border: InputBorder.none),
              controller: titleController,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Description',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 5,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(border: InputBorder.none),
              controller: descriptionController,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Image URL',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(border: InputBorder.none),
              controller: imageUrlController,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              onPressed: () {
                Map<String, dynamic> data = {
                  "title": titleController.text,
                  "description": descriptionController.text,
                  "image_url": imageUrlController.text,
                };
                if (documentSnapshot == null) {
                  String id = randomAlphaNumeric(10);
                  data['id'] = id;
                  DatabaseHelper().addContent(data, id).then((value) {
                    Message.showToast(message: 'Content has been added');
                  });
                } else {
                  String id = documentSnapshot!.id;
                  data['id'] = id;
                  DatabaseHelper().updateContent(data, id).then((value) {
                    Message.showToast(message: 'Content has been updated');
                  });
                }
                titleController.clear();
                descriptionController.clear();
                imageUrlController.clear();
                FocusScope.of(context).unfocus();
                onSubmit.call();
              },
              child: Text(
                documentSnapshot == null ? 'Add Content' : 'Update',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

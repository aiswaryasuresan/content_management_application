import 'package:content_management_app/auth_service/database.dart';
import 'package:content_management_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddContentSection extends StatefulWidget {
  const AddContentSection({super.key});

  @override
  State<AddContentSection> createState() => _AddContentSectionState();
}

class _AddContentSectionState extends State<AddContentSection> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                String id = randomAlphaNumeric(10);
                Map<String, dynamic> data = {
                  "id": id,
                  "title": titleController.text,
                  "description": descriptionController.text,
                  "image_url": imageUrlController.text,
                };
                DatabaseHelper().addContent(data, id).then((value) {
                  Message.showToast(message: 'Content has been added');
                });
                titleController.clear();
                descriptionController.clear();
                imageUrlController.clear();
                FocusScope.of(context).unfocus();
              },
              child: Text(
                'Add Content',
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

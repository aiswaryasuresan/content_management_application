import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_management_app/auth_service/database.dart';
import 'package:content_management_app/utils/toast.dart';
import 'package:flutter/material.dart';

typedef OnUpdateClick = void Function(DocumentSnapshot<Object?> doc);

class AdminViewContentSection extends StatefulWidget {
  final OnUpdateClick onUpdate;
  const AdminViewContentSection({super.key, required this.onUpdate});

  @override
  State<AdminViewContentSection> createState() => _AdminViewContentSectionState();
}

class _AdminViewContentSectionState extends State<AdminViewContentSection> {
  Stream? contentStream;

  dynamic getInfoInit() async {
    contentStream = await DatabaseHelper().displayContent();
    setState(() {});
  }

  @override
  void initState() {
    getInfoInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 15),
          child: Text(
            'View Content',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        StreamBuilder(
          stream: contentStream,
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data.docs[index];
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                          left: 20,
                          right: 20,
                        ),
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.black,
                          color: const Color.fromARGB(255, 219, 223, 248),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: Image(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.25,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "${documentSnapshot['image_url']}",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "${documentSnapshot['title']}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                        255,
                                        3,
                                        13,
                                        67,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${documentSnapshot['description']}",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                        255,
                                        80,
                                        80,
                                        81,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      OutlinedButton.icon(
                                        label: Text(
                                          'Edit',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              33,
                                              169,
                                              3,
                                            ),
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.edit,
                                          color: const Color.fromARGB(
                                            255,
                                            22,
                                            89,
                                            1,
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                            width: 3,
                                            color: Colors.green,
                                          ),
                                        ),
                                        onPressed: () {
                                          widget.onUpdate(documentSnapshot);
                                        },
                                      ),
                                      SizedBox(width: 15),
                                      OutlinedButton.icon(
                                        label: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              188,
                                              4,
                                              4,
                                            ),
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.delete,
                                          color: const Color.fromARGB(
                                            255,
                                            171,
                                            3,
                                            3,
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                            width: 3,
                                            color: Colors.red,
                                          ),
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Delete content'),
                                                content: Text(
                                                  'Are you sure you want to delete this content?',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      DatabaseHelper()
                                                          .deleteBook(
                                                            documentSnapshot.id,
                                                          );
                                                      Message.showToast(
                                                        message:
                                                            "Content Deleted",
                                                      );
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                    child: Text("YES"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                    child: Text("NO"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container();
          },
        ),
      ],
    );
  }
}

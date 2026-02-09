import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_management_app/auth_service/auth_service.dart';
import 'package:content_management_app/ui/admin/add_content_section.dart';
import 'package:content_management_app/ui/admin/admin_view_content_section.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  DocumentSnapshot<Object?>? documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Content Management Application',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Log out'),
                    content: Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton( 
                        onPressed: () async {
                          await AuthService.logOut();
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: Text("YES"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("NO"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddContentSection(
              documentSnapshot: documentSnapshot,
              onSubmit: () {
                setState(() {
                  documentSnapshot = null;
                });
              },
            ),
            AdminViewContentSection(
              onUpdate: (v) {
                setState(() {
                  documentSnapshot = v;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

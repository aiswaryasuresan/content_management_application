import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  Future addContent(Map<String, dynamic> contentDetails,String id) async {
    return await FirebaseFirestore.instance
        .collection('contents')
        .add(contentDetails);
  }

  // Future updateBookDetails(
  //   Map<String, dynamic> updateDetails,
  //   String id,
  // ) async {
  //   return await FirebaseFirestore.instance
  //       .collection('books')
  //       .doc(id)
  //       .update(updateDetails);
  // }

  // Future deleteBook(String id) async {
  //   return await FirebaseFirestore.instance
  //       .collection('books')
  //       .doc(id)
  //       .delete();
  // }

  Future<Stream<QuerySnapshot>> displayContent() async {
    return FirebaseFirestore.instance.collection('contents').snapshots();
  }
}

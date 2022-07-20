import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String name;
  String email;
  String contact;
  String image;
  String id;

  UserProfile({this.name, this.email, this.image, this.contact, this.id});
  UserProfile.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.data()['name'] ?? "";
    email = snapshot.data()['email'] ?? "";
    contact = snapshot.data()['contact'] ?? "";
    image = snapshot.data()['image'] ?? "";
    id = snapshot.id;
  }
}

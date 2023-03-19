import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String fname;
  final String lname;
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String phn;
  final List followers;
  final List following;

  const User(
      {
        required this.fname,
        required this.lname,
        required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.phn,
      required this.followers,
      required this.following});

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "username": username,
        "uid": uid,
        "email": email,
        "phn": phn,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        fname : snapshot["fname"],
        lname : snapshot["lname"],
        username : snapshot["username"],
        uid : snapshot["uid"],
        email : snapshot["email"],
        phn : snapshot["phn"],
        photoUrl : snapshot["photoUrl"],
        followers : snapshot["followers"],
        following : snapshot["following"],
    );
  }
}

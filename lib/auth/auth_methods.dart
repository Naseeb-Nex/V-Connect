import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vconnect/models/user.dart' as model;
import 'package:vconnect/auth/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //signup user
  Future<String> signUpUser({
    required String fname,
    required String lname,
    required String username,
    required String email,
    required String password,
    required String phn,
    required Uint8List file,
  }) async {
    String res = " Some error Occured";
    try {

      print("Starting");
      print(email);
      print(password);
      print(fname);
      print(lname);
      print(phn);
      print(username);
      
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          fname.isNotEmpty ||
          lname.isNotEmpty ||
          phn.isNotEmpty ||
          username.isNotEmpty ) {
        //reg user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //add user
        model.User _user = model.User(
          fname: fname,
          lname: lname,
          username: username,
          uid: cred.user!.uid,
          email: email,
          phn: phn,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(
              _user.toJson(),
            );

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } /*on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        res = 'user-not-found';
      } else if (err.code == 'wrong-password') {
        res = 'Password should be at least 6 characters';
      }
    }*/
    catch (err) {
      res = err.toString();
    }
    return res;
  }

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

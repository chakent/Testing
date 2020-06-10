import 'package:try_flutter/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInEmailPassword(String email, String password);

  Future<String> signUpEmailPassword(User user);

  Future<void> signOut();

  Future<String> currentUser();

  Future<FirebaseUser> infoUser();
}

class Auth implements BaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    String userId = user != null ? user.uid : 'no_login';
    return userId;
  }

  @override
  Future<FirebaseUser> infoUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    String userId = user != null ? user.uid : 'could not retrieve user';
    print('recovering user + $userId');
    return user;
  }

  @override
  Future<String> signInEmailPassword(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password))
        .user;
    return user.uid;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<String> signUpEmailPassword(User userModel) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.name, password: userModel.password))
        .user;

    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = userModel.name;
    userUpdateInfo.photoUrl = userModel.photo;
    await user.updateProfile(userUpdateInfo);
    await user
        .sendEmailVerification()
        .catchError((onError) => print('Verification email error: $onError'));

    await Firestore.instance
        .collection('users')
        .document('${user.uid}')
        .setData({
      'name': userModel.name,
      'phone': userModel.phone,
      'email': userModel.email,
      'city': userModel.city,
      'address': userModel.address
    })
        .catchError((onError) => print('Error register $onError'));
        return user.uid;
    }
}

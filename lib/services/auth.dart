import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

   signIn(String email,String password)async{
    var user=await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }
  signOut()async{
    return await _auth.signOut();
  }

    createPerson(String name,String email,String password)async{
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await _firestore.collection('person').doc(user.user!.uid).set({'userName':name,'email':email});
    return user.user;
  }

}
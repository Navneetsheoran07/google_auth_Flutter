

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/profilepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  

  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void>signInWithGoogle() async{
    // Create an instance of the Firebase Authb and Google sign in
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn  googleSignIn=GoogleSignIn();

  //Authentication Flow

    final GoogleSignInAccount? googleuser = await googleSignIn.signIn();

    //Obtain aiuth Details

    final GoogleSignInAuthentication googleAuth= await googleuser!.authentication;
    // create credentials

final AuthCredential credential = GoogleAuthProvider.credential(
  accessToken: googleAuth.accessToken,
  idToken: googleAuth.idToken
);

//Sign in the user
  final UserCredential userCredential= await auth.signInWithCredential(credential);


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Sign in"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:GestureDetector(
            onTap: ()  async{
            await   signInWithGoogle();
            // if(mounted){
            // Navigator.push(context,MaterialPageRoute(builder: (_)=> ProfilePage));
            // }

            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Continue with Google",style: TextStyle(
                    fontSize: 27,
                  ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
        
        

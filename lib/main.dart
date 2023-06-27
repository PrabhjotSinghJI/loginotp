import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final numberController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       home: Scaffold(
         body: Center(
           child: SizedBox(
             width: 250,
             child: TextFormField(
               controller: numberController,
               keyboardType: TextInputType.number,
               onTap: () async {

login(String number);
               },
               decoration: const InputDecoration(
                 hintText: 'Login Otp',

               ),
             ),
           ),
         ),
       ),
    );

  }
  Future<void> login(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: co,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}


import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final numberController = TextEditingController();

  @override

  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 250,
                child: TextFormField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Login Otp',
                  ),
                ),
              ),
              CupertinoButton(child: const Text("Login"), onPressed:(){

              })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("sucess");        // await _signInWithAutoVerify(credential);
      },
      timeout: const Duration(seconds: 60),
      verificationFailed: (FirebaseAuthException e) async {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      },
      codeSent: (verificationId, resendToken) async {
      },
      codeAutoRetrievalTimeout: (verificationId) {

      },
    );
  }



  // Future<void> _signInManual() async {
  //   final phoneAuth = PhoneAuthProvider.credential(
  //       verificationId: _verificationCode, smsCode: otpController.text);
  //   try {
  //
  //     await FirebaseAuth.instance.signInWithCredential(phoneAuth);
  //
  //   } on FirebaseAuthException catch (e) {
  //
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         duration: const Duration(seconds: 5), content: Text(e.message.toString())));
  //   }
  // }
}
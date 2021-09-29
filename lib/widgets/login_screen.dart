import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utilities.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email, password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      constraints:
          BoxConstraints.expand(width: size.width, height: size.height / 3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: "Email Address", border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  email = value.trim();
                });
              },
            ),
            const SizedBox(height: 20,),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  fillColor: Color(0x52EFEFED)),
              onChanged: (value) {
                setState(() {
                  password = value.trim();
                });
              },
            ),
            const SizedBox(height: 20,),
            RawMaterialButton(
              fillColor: Colors.green,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              onPressed: () {
                auth
                    .signInWithEmailAndPassword(
                        email: email, password: password)
                    .then((user) => {
                          showAwesomeDailog(
                              context,
                              DialogType.SUCCES,
                              AnimType.BOTTOMSLIDE,
                              'Success',
                              'You are now logged in',
                              () {})
                        })
                    .catchError((error) {
                  showAwesomeDailog(
                      context,
                      DialogType.ERROR,
                      AnimType.BOTTOMSLIDE,
                      'Error signing up',
                      '$error'.substring(31),
                      () {});
                });
              },
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

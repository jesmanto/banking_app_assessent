import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utilities.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email, password;
  final auth = FirebaseAuth.instance;
  late User user;

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
                  fillColor: Colors.white),
              onChanged: (value) {
                setState(() {
                  password = value.trim();
                });
              },
            ),
            const SizedBox(height: 20,),
            RawMaterialButton(
              fillColor: Colors.red,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              onPressed: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: email, password: password)
                    .then((user) => {
                          showAwesomeDailog(
                              context,
                              DialogType.SUCCES,
                              AnimType.BOTTOMSLIDE,
                              'Congratulations!',
                              'You have successfully registered',
                              () {})
                        })
                    .catchError((error) {
                  showAwesomeDailog(
                      context,
                      DialogType.ERROR,
                      AnimType.BOTTOMSLIDE,
                      'Error signing up',
                      '$error'.substring(37),
                      () {});
                });
              },
              child: const Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

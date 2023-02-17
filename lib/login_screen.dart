import 'package:blocproject/bloc_page/bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_page/bloc_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.pink),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      'Please Login Here...',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Form(
                                key: key,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.pink))),
                                      child: TextFormField(
                                        controller: emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Email must not be empty";
                                          }
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Enter your Email',
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.pink))),
                                      child: TextFormField(
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Password must not be empty";
                                          }
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Enter your Password',
                                            border: InputBorder.none),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  BlocProvider.of<BlocPage>(context).add(RegisterEvent());
                                },
                                child: Text('Create new account')),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 50,
                              decoration: BoxDecoration(color: Colors.pink,
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                              child: OutlinedButton(
                                  onPressed: () {
                                    if (key.currentState!.validate()) {}
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      );
    
  }
}

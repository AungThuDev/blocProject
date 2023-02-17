import 'package:blocproject/auth/auth.dart';
import 'package:blocproject/bloc_page/bloc_event.dart';
import 'package:blocproject/bloc_page/bloc_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.pink),
      child: Column(
        children: [
          SizedBox(
            height: 40,
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
                    'Register',
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
                    'Please Here...',
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
                                                width: 1, color: Colors.pink))),
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
                                                width: 1, color: Colors.pink))),
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
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1, color: Colors.pink))),
                                    child: TextFormField(
                                      controller: nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Name field must not be empty";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Enter your name',
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
                                BlocProvider.of<BlocPage>(context)
                                    .add(LoginEvent());
                              },
                              child: Text('Please Login')),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.pink,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: OutlinedButton(
                                onPressed: () async {
                                  if (key.currentState!.validate())  {
                                  Map<String,dynamic> status = await Auth().register(emailController.text,passwordController.text);
                                  if(status['status']){
                                    BlocProvider.of<BlocPage>(context).add(HomeEvent());
                                  }
                                  }
                                },
                                child: Text(
                                  'Register',
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

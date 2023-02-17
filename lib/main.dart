import 'package:blocproject/bloc_page/bloc_event.dart';
import 'package:blocproject/bloc_page/bloc_page.dart';
import 'package:blocproject/bloc_page/bloc_state.dart';
import 'package:blocproject/home_screen.dart';
import 'package:blocproject/login_screen.dart';
import 'package:blocproject/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<BlocPage>(create: ((BuildContext context) => BlocPage())),
    ], child: Home())
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.pink),
      title: 'BlocProject',
      home: 
        MyHome(),
      
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BlocPage>(context).add(LoginEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    body:
    BlocBuilder<BlocPage,BlocState>(builder:(BuildContext context,state){
        if(state is LoginState){
          return LoginScreen();
        }else if(state is RegisterState)
        {
          return RegisterScreen();
        }
        else if(state is HomeState){
          return HomeScreen();
        }
        else{
          return HomeScreen();
        }
      }));
  }
}
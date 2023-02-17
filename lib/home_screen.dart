import 'package:blocproject/bloc_page/bloc_event.dart';
import 'package:blocproject/bloc_page/bloc_page.dart';
import 'package:blocproject/bloc_page/bloc_state.dart';
import 'package:blocproject/posts/edit_post.dart';
import 'package:blocproject/posts/new_post.dart';
import 'package:blocproject/posts/post_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BlocPage>(context).add(NewPostEvent());
  }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(title: Text('HomeScreen'),
      ),
      drawer: Drawer(
        
        child: 
        ListView(
          children: [
            
            UserAccountsDrawerHeader(accountName: Text(""), accountEmail: Text('aungthuhtut@gmail.com')),
            
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('New Post',style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: (){
                BlocProvider.of<BlocPage>(context).add(NewPostEvent());
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Post List',style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                BlocProvider.of<BlocPage>(context).add(PostListEvent());
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.logout),
              onTap: (){
                Auth().logout();
                BlocProvider.of<BlocPage>(context).add(LoginEvent());
              },
              title: Text('Logout',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
      body: BlocBuilder<BlocPage,BlocState>(builder: (BuildContext context,state){
        if(state is NewPostState)
        {
          return NewPost();
        }else if(state is PostListState)
        {
          return PostList();
        }
        else{
          return PostList();
        }
        
      }),);
  }
}
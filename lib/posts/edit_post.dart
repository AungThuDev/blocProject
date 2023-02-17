import 'package:blocproject/posts/post_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blocproject/auth/auth.dart';
import 'package:blocproject/bloc_page/bloc_event.dart';
import 'package:blocproject/bloc_page/bloc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPost extends StatefulWidget {



  // EditPost({super.key});
  String id;
  EditPost(this.id, {super.key});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late TextEditingController EditPostController;
  late TextEditingController EditDescriptionController;
    final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
    appBar: AppBar(title: Text("Home Screen"),),  
    body:
    FutureBuilder(
      future: Auth().getPost(widget.id),
      builder: (context,AsyncSnapshot<DocumentSnapshot> snapshots){
      if (!snapshots.hasData) return Container();
      Map<String,dynamic> post = snapshots.data!.data() as Map<String,dynamic>;
      EditPostController = TextEditingController(text: post['title']);
      EditDescriptionController = TextEditingController(text: post['description']);
      return Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            SizedBox(height: 80,),
            Center(
              child: Text('Edit Post',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),
            ),
            SizedBox(height: 20,),
            Center(
              //child: Text('Add New Post',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 20,),
    
            Expanded(
              child: 
              Container(
                decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
                child: Padding(padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20.0,),
                          Form(
                            key: key,
                            child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.blue))),
                                child: 
                                
                                  TextFormField(
                                    controller: EditPostController,
                                    validator: (value) {
                                      if(value == null || value.isEmpty){
                                        return "Post title must not be empty";
                                      }
                                    } ,
                                    decoration: InputDecoration(hintText: 'Edit Post',
                                    border: InputBorder.none),
                                  ),
                                
                              ),
                              SizedBox(height: 20.0,),
                              Container(
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.blue))),
                                child: 
                                TextFormField(
                                    validator: (value) {
                                      if(value == null || value.isEmpty){
                                        return "Description must not be empty";
                                      }
                                    } ,
                                    controller: EditDescriptionController,
                                    decoration: InputDecoration(hintText: 'Edit Description',
                                    border: InputBorder.none),
                                  ),
                                
                              ),
                              SizedBox(height: 40,),
                              Container(
                                decoration: BoxDecoration(color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                                child: OutlinedButton(onPressed: (){
                                  if(key.currentState!.validate()){
                                    // Auth().cretaePost(newPostController.text, descriptionController.text);
                                    // newPostController.text=" ";
                                    // descriptionController.text=" ";
                                    // BlocProvider.of<BlocPage>(context).add(PostListEvent());
                                    Auth().updatePost(EditPostController.text, EditDescriptionController.text, widget.id);
                                    Navigator.pop(context);
                                  }
                                }, child: Text('Save Post',style: TextStyle(color: Colors.white,fontSize: 17),)),
                              )
                            ],
                          ))
                        ],
                      ),
                    )],
                  )
                ),),
                ),
              ),
          ],
        ),
    );
      })
    
    
    
    );
  }
}
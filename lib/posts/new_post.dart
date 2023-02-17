import 'package:blocproject/auth/auth.dart';
import 'package:blocproject/bloc_page/bloc_event.dart';
import 'package:blocproject/bloc_page/bloc_page.dart';
import 'package:blocproject/posts/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    TextEditingController newPostController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final key = GlobalKey<FormState>();
    return 
    
     Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            SizedBox(height: 80,),
            Center(
              child: Text('New Post',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text('Add New Post',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 20,),
    
            Expanded(
              child: Container(
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
                                child: TextFormField(
                                  controller: newPostController,
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return "Post title must not be empty";
                                    }
                                  } ,
                                  decoration: InputDecoration(hintText: 'Enter New Post',
                                  border: InputBorder.none),
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Container(
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.blue))),
                                child: TextFormField(
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return "Description must not be empty";
                                    }
                                  } ,
                                  controller: descriptionController,
                                  decoration: InputDecoration(hintText: 'Enter Description',
                                  border: InputBorder.none),
                                ),
                              ),
                              SizedBox(height: 40,),
                              Container(
                                decoration: BoxDecoration(color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                                child: OutlinedButton(onPressed: (){
                                  if(key.currentState!.validate()){
                                    Auth().cretaePost(newPostController.text, descriptionController.text);
                                    newPostController.text=" ";
                                    descriptionController.text=" ";
                                    BlocProvider.of<BlocPage>(context).add(PostListEvent());
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>PostList()));
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
  }
}
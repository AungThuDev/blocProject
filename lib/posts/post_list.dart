import 'package:blocproject/auth/auth.dart';
import 'package:blocproject/posts/edit_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_page/bloc_event.dart';
import '../bloc_page/bloc_page.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: Auth().getPosts(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (!snapshots.hasData) return Container();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${snapshots.data!.docs[index]['title']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPost(snapshots.data!.docs[index].id)));
                          }, icon: Icon(Icons.edit,color: Colors.black45,)),
                          IconButton(onPressed: (){
                            Auth().deletePost(snapshots.data!.docs[index].id);
                          }, icon: Icon(Icons.delete,color: Colors.black45,)),
                        ],
                      )
                    ],),
                ),
              );
            },
          );
        },
      ),
    );
  }
}




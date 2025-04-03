

import 'package:dio_callingapi/postModelClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class InfoOfPost extends StatefulWidget {
  int index;
  InfoOfPost(this.index,{super.key});

  @override
  State<InfoOfPost> createState() => _InfoOfPostState();
}

class _InfoOfPostState extends State<InfoOfPost> {
  List<PostModelClass> temp=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<mainPage.postModelClass.length;i++){
      if(mainPage.postModelClass[i].userId==widget.index){
        temp.add(mainPage.postModelClass[i]);
      }
    }
    print("Temp=${temp[1].userId}");

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Information of Displaying Post',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1
            ),
            itemCount: temp.length,
            itemBuilder: (context, index) {
              return Card(
                color: Color.fromRGBO(103, 157, 219, 53),
                margin: EdgeInsets.all(20),
                elevation: 20,
                child: Row(
                  children: [
                    Container(
                      height: 300,
                      width: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20),
                      child: Text('${temp[index].id}',style: TextStyle(fontSize: 20,color: Colors.white),),
                      color: Color.fromRGBO(3, 74, 62,90),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 200,
                          margin: EdgeInsets.only(left: 40,top: 60),
                          padding: EdgeInsets.all(10),
                          child: Text('${temp[index].title}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                          color: Color.fromRGBO(3, 74, 62,90),
                        ),
                        Container(
                          width: 250,
                          margin: EdgeInsets.only(left: 40,top: 20),
                          child: Text('${temp[index].body}',style: TextStyle(color: Colors.white,fontSize: 15),),
                          padding: EdgeInsets.all(10),
                          color: Color.fromRGBO(3, 74, 62,90),
                        )
                      ],
                    )
                  ],
                ),
              );
            },),
        ),
      ),
    );
  }
}


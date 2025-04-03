
import 'package:flutter/material.dart';

import 'infoOfPost.dart';
import 'main.dart';

class DisplayPost extends StatefulWidget {
  DisplayPost({super.key});

  @override
  State<DisplayPost> createState() => _DisplayPostState();
}

class _DisplayPostState extends State<DisplayPost> {
  int allDataLength=0;
  int item=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allDataLength=mainPage.postModelClass.length;
    item=(mainPage.postModelClass[allDataLength-1].userId)!.toInt();
    print("allDataLength=$item");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Users',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: item,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return InfoOfPost(index+1);
                    },));
                  });
                },
                child: Container(
                  height: 65,
                  child: Card(
                    child: Container(
                        alignment: Alignment.center,
                        child: Text('Userid = ${index+1}',style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,)
                    ),
                    color: Colors.white,
                    elevation: 20,
                  ),
                ),
              );
            },),
        ),
      ),
    );
  }
}

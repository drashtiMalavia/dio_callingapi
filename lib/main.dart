

import 'package:dio/dio.dart';
import 'package:dio_callingapi/postModelClass.dart';
import 'package:flutter/material.dart';

import 'displayPost.dart';

void main() {
  runApp(MaterialApp(home: mainPage(),));
}

class mainPage extends StatefulWidget {
  static List<PostModelClass> postModelClass=[];
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  bool cancel=false;
  // String token='';
  CancelToken cancelToken=CancelToken();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Dio API'),
            ),
            body: FutureBuilder(
              future: CallApiPost(),
              builder: (context, snapshot) {
                try{
                  if(snapshot.hasData){
                    return Center(
                      child: Container(
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DisplayPost();
                          },));
                          setState(() {

                          });
                        }, child: Text('Dispay post API data')),
                      ),
                    );
                  }
                  else{
                    return Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cancel?
                        Container(
                          margin: EdgeInsets.only(left: 150),
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {
                                CallApiPost();
                                cancel=false;
                                cancelToken=CancelToken();
                                setState(() {

                                });
                              },
                              child: Text('Request is canceled\nPlease Click here to request again\nclick here',style: TextStyle(color: Colors.red,fontSize: 20),)
                          ),
                        ):Container(
                            margin: EdgeInsets.only(left: 150),
                            child: CircularProgressIndicator()
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 150),
                          child: ElevatedButton(onPressed: () {
                            cancel=CancelRequest();
                            setState(() {});
                          }, child: Text('Cancel Request')),
                        ),
                      ],
                    );
                  }
                }
                catch(error){
                  return Center(child: CircularProgressIndicator());
                }
                return CircularProgressIndicator();
              },)
        )
    );
  }

  CallApiPost() async {
    Dio dio=Dio();
    dio.interceptors.add(MyIntercepter());
    var Responce=await dio.get('https://jsonplaceholder.typicode.com/posts',cancelToken: cancelToken);
    print('2');
    return mainPage.postModelClass;
    //print('Responce of post api=${Responce.data}');
    // List list=Responce.data;
    // List<PostModelClass> postModelClass=list.map((e) => PostModelClass.fromJson(e),).toList();
    // print('post=${postModelClass[0].body}');
  }

  bool CancelRequest() {
    cancelToken.cancel('Api is cancel by user');
    return true;
  }
}

class MyIntercepter extends Interceptor{
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['contentType']='application/json';//header mate
    await Future.delayed(Duration(seconds: 3));
    print('4');
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if(err.response!.statusCode!>=400 && err.response!.statusCode!<=500)
    {
      print("Please provide proper API url");
    }
    // print("Error=${err.message}");
    // print('2');
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("Response=${response.data}");
    List list=response.data;
    mainPage.postModelClass=list.map((e) => PostModelClass.fromJson(e),).toList();
    print('3');
    print('post=${mainPage.postModelClass[0].body}');
    handler.next(response);
  }

}

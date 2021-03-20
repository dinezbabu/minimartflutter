import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theminimart/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.teal,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        ),
      ),
      child: _isLoading ? Center(child: CircularProgressIndicator()):  ListView(
        children: <Widget>[
          headerSection(),
          textSection(),
          buttonSection(),
        ],
      ),
    );
  }

  Container headerSection(){
     return Container(
       padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
       child: Text("The Mini Mart",style:TextStyle(color: Colors.white)),
     );
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passswordController = new TextEditingController();

  Container textSection(){
     return Container(
       padding: EdgeInsets.symmetric(horizontal: 20.0),
       margin: EdgeInsets.only(top: 30.0),
       child: Column(
         children: <Widget>[
           txtEmail("Email", Icons.email),
           SizedBox(height: 30.0,),
           txtPassword("Password",Icons.lock),
         ],
       ),
     );
  }

  TextFormField txtEmail(String title,IconData icon){
    return  TextFormField(
      controller: emailController,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),
    );
  }

  TextFormField txtPassword(String title,IconData icon){
    return  TextFormField(
      controller: passswordController,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(icon)
      ),
    );
  }

  signIn(String email,String password) async{
    Map data ={
      'email' :  email,
      'password': password
    };
    var jsonData=null;
    // SharedPreferences sharedpreferences= await SharedPreferences.getInstance();
    //       var response = await http.post("url",body,data);
    //       if(response.statusCode==200){
    //         jsonData = json.decode(response.body);
    //         setState(() {
    //           _isLoading =false;
    //           sharedpreferences.setString("token",jsonData['token']);
    //           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=>MyHomePage()), (Route<dynamic> route) => false);
    //         });
    //       }
    //       else{
    //         print(response.body);
    //       }
  }

  Container buttonSection(){
     return Container(
       width: MediaQuery.of(context).size.width,
       height: 40.0,
       margin: EdgeInsets.only(top: 30.0),
       padding: EdgeInsets.symmetric(horizontal: 20.0),
       child: RaisedButton(
         onPressed: (){
           setState(() {
_isLoading=true;
           });
           signIn(emailController.text,passswordController.text);
         },
         color: Colors.purple,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(5.0)
         ),
         child: Text("Sign In",style: TextStyle(color: Colors.white70)),
       )
     );
  }

}

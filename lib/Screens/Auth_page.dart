import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/Screens/Home.dart';

class Auth_Page extends StatelessWidget {
  const Auth_Page({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    Future<UserCredential>  signwithgoogle() async{  
      final GoogleSignInAccount? guser=await GoogleSignIn().signIn();
                  final GoogleSignInAuthentication _gauth=await guser!.authentication;

                  final cred=GoogleAuthProvider.credential(
                    accessToken: _gauth.accessToken,
                    idToken: _gauth.idToken
                  );
                  UserCredential u=await FirebaseAuth.instance.signInWithCredential(cred);
                   SharedPreferences _prefs = await SharedPreferences.getInstance();   
                   _prefs.setBool("loggedin", true);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                  return u;
  
    }


    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                  height: h * 0.35,
                  child: Center(
                    child: Text(
                      "#DiscoverBharat",
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
      
       Container(
              height: h*0.70,
               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/parth-vyas-J4Ui2ch3oRU-unsplash.jpg"),
                  fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                          "Welcome,\nContinue to start your journey in India.",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
            
            
                     TextField(          
                            decoration: InputDecoration(
                              hintText: 'Enter Your Email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                        ),


                         Center(
                      child: Container(
                        
                        width: w,
                        child: ElevatedButton(
                          style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 5,vertical: 20)),),
                          onPressed: () {
                            
                            print('Button pressed!');
                          },
                          child: Text('Send link on Email',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold), ),
                        ),
                      ),
                    ),



                     Row(
                      children: [
                        Expanded(
                            child: Divider(
                          indent: 10,
                          thickness: 2,
                        )),
                        Text(
                          " or continue ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Expanded(
                            child: Divider(
                          endIndent: 10,
                          thickness: 2,
                        ))
                      ],
                    ),


                    GestureDetector(
                      onTap: ()=>signwithgoogle(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            
              
          ],
        ),
      ),
    );
  }
}
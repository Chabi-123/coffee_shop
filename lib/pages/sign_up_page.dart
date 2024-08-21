import 'package:coffee_shop/constant/constant_file.dart';
import 'package:coffee_shop/data/sign_up-data.dart';
import 'package:coffee_shop/model/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
TextEditingController _name = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
bool isObs = false;

final _formKey = GlobalKey<FormState>();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(

          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.15,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      top: -70,
                      right:-60 ,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Positioned(
                      right:330 ,
                      top: -45,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(width: 30,color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),

                    ),
                    Positioned(
                      right:250 ,
                      top: -90,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 23,),
                  Text('Sign Up',style: myStyle(30,Colors.black,FontWeight.w900),),
                ],
              ),
              Gap(30),
              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        label: Text("Name",style: myStyle(18),),
                        hintText: "Name",
                        // hintStyle: TextStyle(color: Colors.purple)
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please enter email";
                        }
                        // if(value.toString() != user[0].email){
                        //   return "email does not match";
                        // }
                      },
                    ),
                    Gap(30),
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        label: Text("Email",style: myStyle(18),),
                        hintText: "Email",
                        // hintStyle: TextStyle(color: Colors.purple)
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please enter email";
                        }
                        if(value.toString() != user[0].email){
                          return "email does not match";
                        }
                      },
                    ),
                    Gap(30),
                    TextFormField(
                      controller: _password,
                      obscureText: isObs,
                      decoration: InputDecoration(
                        label: Text("Password",style: myStyle(18),),
                        hintText: "Enter your password",
                        // hintStyle: TextStyle(color: Colors.purple)
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        suffix: IconButton(
                          onPressed: (){
                            // isObs = !isObs;
                            setState(() {

                            });
                          },
                          icon: Icon(Icons.visibility),
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please enter password";
                        }
                        if(value.length < 8){
                          return "Password must be at least 8 digits/char";
                        }
                        if(value.toString() != user[0].password){
                          return "password does not match";
                        }
                      },
                    ),
                    Gap(30),
                    // Container(
                    //   height: 55,
                    //   width: 150,
                    //   decoration: BoxDecoration(
                    //       color: Colors.deepOrange,
                    //       borderRadius: BorderRadius.circular(50)
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text('SIGN UP',style: myStyle(15,Colors.white,FontWeight.bold),),
                    //     ],
                    //   ),
                    // ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.deepOrange,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          user.add(
                            signUpmodel(
                              name: _name.text.toString(),
                              email: _email.text.toString(),
                              password: _password.text.toString(),

                            ),
                          );

                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (builder) => ()),
                          // );
                        }
                      },
                      child: Text(
                        "Sign Up!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Gap(10),
                    Text('Already have an acc? Sign-Up',style: myStyle( 18),),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Gap(20),
                        Container(
                          height: 1,
                          width: 100,
                          color: Colors.black,
                        ),
                        Gap(20),
                        Text('Sign In',style: myStyle(18,Colors.black,FontWeight.bold),),
                        Gap(20),
                        Container(
                          height: 1,
                          width: 100,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          color: Colors.white,
                          child: Container(
                            height: 55,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.facebook_outlined,color: Colors.blue,),
                                Gap(10),
                                Text('FACEBOOK',style: myStyle(15,),),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          child: Container(
                            height: 55,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.g_mobiledata_rounded,color: Colors.red,),
                                Gap(10),
                                Text('GOOGLE'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );

  }
}

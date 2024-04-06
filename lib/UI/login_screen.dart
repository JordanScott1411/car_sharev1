import 'package:car_sharev1/UI/main_page.dart';
import 'package:car_sharev1/UI/register_screen.dart';
import 'package:car_sharev1/UI/omboarding_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:car_sharev1/UI/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    bool darkTheme = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Column(
                children: [
                  Image.asset('assets/images/Logo.png'),
                  SizedBox(height: 20,),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  )
                ]
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(100)
                        ],
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: darkTheme ? Colors.black45 : Colors.grey.shade200,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                )
                            ),
                            prefixIcon: Icon(Icons.person, color: darkTheme ? Colors.amber.shade400 : Colors.grey,)
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text){
                          if(text == null || text.isEmpty){
                            return "Email can't be empty";
                          }
                          if(EmailValidator.validate(text) == true){
                            return null;
                          }
                          if(text.length < 2){
                            return 'please enter a valid Email';
                          }
                          if(text.length > 99){
                            return 'Email can\'t be more than 99';
                          }
                        },
                        onChanged: (text) => setState(() {
                          emailTextEditingController.text = text;
                        }),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                        decoration: InputDecoration(
                            hintText: 'password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: darkTheme ? Colors.black45 : Colors.grey.shade200,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                )
                            ),
                            prefixIcon: Icon(Icons.person, color: darkTheme ? Colors.amber.shade400 : Colors.grey,),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                color: darkTheme ? Colors.amber.shade400 : Colors.grey,
                              ),
                              onPressed: (){
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            )

                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text){
                          if(text == null || text.isEmpty){
                            return "password can't be empty";
                          }
                          if(EmailValidator.validate(text) == true){
                            return null;
                          }
                          if(text.length < 8){
                            return 'please enter a valid password';
                          }
                          if(text.length > 45){
                            return 'password can\'t be more than 45';
                          }
                          return null;
                        },
                        onChanged: (text) => setState(() {
                          passwordTextEditingController.text = text;
                        }),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: darkTheme ? Colors.white : Colors.blue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)
                            ),
                            minimumSize: Size(double.infinity, 50)
                        ),
                        onPressed: () {
                          FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTextEditingController.text, password: passwordTextEditingController.text).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                          }).catchError((errorMessage) {
                            Fluttertoast.showToast(msg: "error occured: \n $errorMessage");
                          });


                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      GestureDetector(
                        onTap: (){},
                        child: Text(
                          'forgot password',
                          style: TextStyle(
                            color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => RegisterScreen())
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 15,
                            color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                          ),
                        ),
                      )

                    ],
                  ),
                )
              ],
            )
          ],

        ),
      ),
    );
  }
}
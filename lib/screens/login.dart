import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vconnect/screens/registration_page.dart';

import '../components/theme_helper.dart';
import 'widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Key _formKey = GlobalKey<FormState>();
  double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hey,',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                      const Text(
                        'Login Now',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'User Name', 'Enter your user name'),
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                  ),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter your password'),
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                  ),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                  },
                                  child: const Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Montserrat"),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      'Sign In'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ),
                                  onPressed: () {
                                    //After successful login we will redirect to profile page. Let's create profile page now
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Don\'t have an account? ",
                                      style:
                                          TextStyle(fontFamily: "Montserrat")),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Montserrat",
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

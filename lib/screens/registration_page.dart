import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vconnect/auth/auth_methods.dart';
import 'package:vconnect/constants/constants.dart';
import 'package:vconnect/screens/homescreen.dart';
import 'package:vconnect/screens/loginscreen.dart';
import 'package:vconnect/screens/widgets/header_widget.dart';
import 'package:vconnect/utils/imagepicker.dart';

import '../components/theme_helper.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  // Form Key
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  // Username validation
  bool valid_username = false;

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phnController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _phnController.dispose();
    _passwordController.dispose();
  }

  void selectImage() async {
    print("Working");
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      fname: _firstnameController.text,
      lname: _lastnameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      phn: _phnController.text,
      file: _image!,
    );

    if (res == "success") {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
      setState(() {
        _isLoading = false;
      });

      //
    } else {
      setState(() {
        _isLoading = false;
      });
      // ignore: use_build_context_synchronously
      showSnackBar(res, context);
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // TODO : image picker
                        GestureDetector(
                          onTap: () => selectImage(),
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: _image != null
                                    ? CircleAvatar(
                                        radius: 64,
                                        backgroundImage: MemoryImage(_image!),
                                      )
                                    : Icon(
                                        Icons.person,
                                        color: Colors.grey.shade300,
                                        size: 80.0,
                                      ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: _image != null
                                    ? const Icon(
                                        Icons.add_circle,
                                        color: trans,
                                      )
                                    : Icon(
                                        Icons.add_circle,
                                        color: Colors.grey.shade700,
                                        size: 25.0,
                                      ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _firstnameController,
                          onSaved: (value) {
                            _firstnameController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: ThemeHelper().textInputDecoration(
                              'First Name', 'Enter your first name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please enter the First Name");
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _lastnameController,
                          onSaved: (value) {
                            _lastnameController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: ThemeHelper().textInputDecoration(
                              'Last Name', 'Enter your last name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please enter the Last Name");
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _usernameController,
                          onSaved: (value) {
                            _usernameController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: ThemeHelper().textInputDecoration(
                              'Username', 'Enter your Username'),
                          onChanged: (value) => usernameValidator(value),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please enter a Username");
                            } else if (valid_username) {
                              return ("Username is not valid");
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _emailController,
                          onSaved: (value) {
                            _emailController.text = value!;
                          },
                          decoration: ThemeHelper().textInputDecoration(
                              "E-mail address", "Enter your email"),
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _phnController,
                          onSaved: (value) {
                            _phnController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: ThemeHelper().textInputDecoration(
                              "Mobile Number", "Enter your mobile number"),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Phone Number feild can't be empty");
                            } else if (value.length != 10) {
                              return ("invalid Phone Number");
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _passwordController,
                          onSaved: (value) {
                            _passwordController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          decoration: ThemeHelper().textInputDecoration(
                              "Password*", "Enter your password"),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    const Text(
                                      "I accept all terms and conditions.",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Theme.of(context).errorColor,
                                        fontSize: 12,
                                        fontFamily: "Montserrat"),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: white,
                                      ),
                                    )
                                  : Text(
                                      "Register".toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: "Montserrat"),
                                    ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                signUpUser();
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: const Text(
                          "Have an account?",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: navigateToLogin,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text(
                            " Log in.",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              color: primarycolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> userExists(String username) async => (await fb
          .collection("users")
          .where("username", isEqualTo: username)
          .get())
      .docs
      .isNotEmpty;

  usernameValidator(String value) async {
    // if (userExists == false) {
    //   // Username is already used
    //   setState(() {
    //     valid_username = false;
    //   });
    // } else {
    //   // Username is available
    //   setState(() {
    //     valid_username = true;
    //   });
    // }
  }
}

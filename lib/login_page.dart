import 'package:flutter/material.dart';
import 'package:health/profile_page.dart';
import 'package:health/registration.dart';
import 'package:health/widget/custom_button.dart';
import 'package:health/widget/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // initialize the boolean value for operate the the obscureText

  bool _isVisible = true;

  //create the instance of text edit Controller

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pasword = TextEditingController();

  //remove the garbage collection of text edit controller

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _pasword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: double.infinity,
              
              child: Image.asset(
                "asset/login.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,vertical: 20
                 ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                        child: Column(children: [
                      CustomTextfield(
                        isHasPrefixIcon: true,
                        control: _email,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Email",
                        isHasSuffixIcon: false,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xff156778),
                          size: 20,
                        ),
                      ),
                    ])),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextfield(
                      isHasPrefixIcon: true,
                      control: _pasword,
                      obscureText: _isVisible,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Password",
                      isHasSuffixIcon: true,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xff156778),
                        size: 20,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          child: Icon(
                            _isVisible == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff156778),
                            size: 20,
                          )),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Color(0xff156778),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 100),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profilepage(),
                            ));
                      },
                      child: const CustomButton(
                          widget: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          color: Color(0xff156778)),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Color(0xffD1D5DB),
                          thickness: 2,
                          height: 3,
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "or",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff50555C)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Divider(
                          color: Color(0xffD1D5DB),
                          thickness: 2,
                          height: 3,
                        )),
                      ],
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "asset/google.png",
                              fit: BoxFit.cover,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Sign In with Google",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Registration(),
                                ));
                          },
                          child: const Text(
                            "Join Now",
                            style: TextStyle(
                              color: Color(0xff156778),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

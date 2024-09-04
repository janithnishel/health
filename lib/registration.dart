import 'package:flutter/material.dart';
import 'package:health/login_page.dart';
import 'package:health/widget/custom_button.dart';
import 'package:health/widget/custom_textfield.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  // initialize the boolean value for operate the the obscureText

  bool _isVisiblePassword = true;
  bool _isVisibleConfirmPassword = true;

  //create the instance of text edit Controller

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pasword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  //remove the garbage collection of text edit controller

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _pasword.dispose();
    _confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: double.infinity,
              child: Image.asset(
                "asset/registration.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "Create an account",
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
                    CustomTextfield(
                      isHasPrefixIcon: true,
                      control: _name,
                      keyboardType: TextInputType.name,
                      hintText: "Name",
                      isHasSuffixIcon: false,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0xff156778),
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextfield(
                      isHasPrefixIcon: true,
                      control: _pasword,
                      obscureText: _isVisiblePassword,
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
                            _isVisiblePassword = !_isVisiblePassword;
                          });
                        },
                        child: Icon(
                          _isVisiblePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20,
                          color: const Color(0xff156778),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextfield(
                      isHasPrefixIcon: true,
                      control: _confirmPassword,
                      obscureText: _isVisibleConfirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Confirm Password",
                      isHasSuffixIcon: true,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: const Color(0xff156778),
                        size: 20,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVisibleConfirmPassword =
                                !_isVisibleConfirmPassword;
                          });
                        },
                        child: Icon(
                          _isVisibleConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20,
                          color: const Color(0xff156778),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    const CustomButton(
                      widget: Center(
                        child: Text(
                          "Join Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      color: Color(0xff156778),
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
                              "Join with Google",
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
                          "Already have an account?",
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
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign In",
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

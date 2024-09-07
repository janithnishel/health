import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:health/profile_page.dart';  // Ensure this is your correct profile page import
import 'package:health/widget/custom_button.dart';
import 'package:health/widget/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Initialize the FirebaseAuth instance and GoogleSignIn
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isVisible = true;

  // Create text controllers
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  // Dispose controllers
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // Sign in with Google
Future<void> _handleGoogleSignIn() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // User cancelled the sign-in
      return;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Get user details from Google
    final String email = googleUser.email;
    final String name = googleUser.displayName ?? '';
    final String profilePicture = googleUser.photoUrl ?? '';

    // Send the user's email and additional details to FastAPI backend
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/auth/google_login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "name": name,
        "profile_picture": profilePicture
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('User ID: ${responseData['user_id']}');  // Handle user_id
      print('Access Token: ${responseData['access_token']}');  // Handle access_token

      // Navigate to profile page with user data and token
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profilepage(
            userId: responseData['user_id'].toString(),  // Converting user_id to string if needed
            email: email,
            name: name,
            token: responseData['access_token'],  // Pass the token here
          ),
        ),
      );
    } else {
      print('Failed to log in with Google: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${response.body}')),
      );
    }
  } catch (e) {
    print('Error signing in with Google: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error signing in: $e')),
    );
  }
}
  // Existing Email and Password sign-in logic (not connected to backend)
  void _loginWithEmailPassword() {
    final email = _email.text;
    final password = _password.text;

    if (email.isEmpty || password.isEmpty) {
      // Show error message or validation
      return;
    }

    // TODO: Add backend integration for email/password login
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Profilepage(userId: '', email: '', name: '', token: '',),
      ),
    );
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
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: 20),
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
                    const SizedBox(height: 50),
                    Form(
                      child: Column(
                        children: [
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
                          const SizedBox(height: 15),
                          CustomTextfield(
                            isHasPrefixIcon: true,
                            control: _password,
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
                                  _isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0xff156778),
                                  size: 20,
                                )),
                          ),
                        ],
                      ),
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
                      onTap: _loginWithEmailPassword,
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
                        color: Color(0xff156778),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xffD1D5DB),
                            thickness: 2,
                            height: 3,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "or",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff50555C)),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Divider(
                            color: Color(0xffD1D5DB),
                            thickness: 2,
                            height: 3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: _handleGoogleSignIn,
                      child: CustomButton(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "asset/google.png",
                              fit: BoxFit.cover,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 10),
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
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),
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
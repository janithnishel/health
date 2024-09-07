import 'package:flutter/material.dart';
import 'package:health/widget/custom_button.dart';
import 'package:health/widget/custom_textfield.dart';

class Profilepage extends StatefulWidget {
  final String userId;  // Add userId as a parameter
  final String email;    // Add email as a parameter
  final String name;     // Add name as a parameter

  const Profilepage({
    super.key,
    required this.userId,   // Mark as required
    required this.email,    // Mark as required
    required this.name,     // Mark as required
  });

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 50),

            // Display user information passed from the login page
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "asset/profile.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,  // Display the passed name
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.email,  // Display the passed email
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // Text fields for profile information
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.5,
              ),
              child: Column(children: [
                CustomTextfield(
                  hintText: "Height",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.none,
                  control: control,
                  isHasPrefixIcon: false,
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  hintText: "Weight",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.none,
                  control: control,
                  isHasPrefixIcon: false,
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  hintText: "Blood type",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.none,
                  control: control,
                  isHasPrefixIcon: false,
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  hintText: "Allergies",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.none,
                  control: control,
                  isHasPrefixIcon: false,
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  hintText: "Medical condition",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.none,
                  control: control,
                  isHasPrefixIcon: false,
                ),
              ]),
            ),
            const SizedBox(height: 50),

            // Sample Table for displaying data
            Table(
              columnWidths: const <int, TableColumnWidth>{},
              children: const [
                TableRow(children: [
                  Text(
                    "Customer",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Text(
                    "Height",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Text(
                    "Weight",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Text(
                    "Blood type",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Text(
                    "Allergies",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Text(
                    "Medical condition",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
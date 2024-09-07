import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:health/widget/custom_button.dart';
import 'package:health/widget/custom_textfield.dart';

class Profilepage extends StatefulWidget {
  final String userId; // User ID
  final String email; // Email
  final String name; // Name
  final String token; // Token for making authorized requests

  const Profilepage({
    super.key,
    required this.userId,
    required this.email,
    required this.name,
    required this.token, // Pass the token
  });

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();
  final TextEditingController _medicalConditionController = TextEditingController();

  bool _isLoading = false;

  // API call to save health data
  Future<void> _saveHealthData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/health_data/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${widget.token}", // Ensure valid token is passed
        },
        body: jsonEncode({
          "height": double.parse(_heightController.text),
          "weight": double.parse(_weightController.text),
          "blood_type": _bloodTypeController.text,
          "allergies": _allergiesController.text.isEmpty
              ? []
              : _allergiesController.text.split(','),
          "medical_conditions": _medicalConditionController.text.isEmpty
              ? []
              : _medicalConditionController.text.split(','),
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Health data saved successfully')),
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unauthorized: Invalid token')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save health data: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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

            // Display user information
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
                        widget.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.email,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // Input fields
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.5,
              ),
              child: Column(children: [
                CustomTextfield(
                  hintText: "Height",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.number,
                  control: _heightController,
                  isHasPrefixIcon: false,
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  hintText: "Weight",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.number,
                  control: _weightController,
                  isHasPrefixIcon: false,
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  hintText: "Blood type",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.text,
                  control: _bloodTypeController,
                  isHasPrefixIcon: false,
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  hintText: "Allergies (comma separated)",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.text,
                  control: _allergiesController,
                  isHasPrefixIcon: false,
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  hintText: "Medical conditions (comma separated)",
                  isHasSuffixIcon: false,
                  keyboardType: TextInputType.text,
                  control: _medicalConditionController,
                  isHasPrefixIcon: false,
                ),
              ]),
            ),
            const SizedBox(height: 50),

            // Save Button
            _isLoading
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: _saveHealthData,
                    child: const CustomButton(
                      widget: Center(
                        child: Text(
                          "Save Health Data",
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
          ],
        ),
      ),
    );
  }
}
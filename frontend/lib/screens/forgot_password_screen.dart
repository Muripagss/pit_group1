import 'package:flutter/material.dart';
import 'login_screen.dart'; // Adjust the path if needed

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypePasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _updatePassword() {
    if (_formKey.currentState!.validate()) {
      // TODO: Add API call to update password here

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated successfully!')),
      );

      // Navigate back to login screen after short delay
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context); // back to login
      });
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateRetypePassword(String? value) {
    if (value != _newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg2.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  // Back arrow only, no background
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.green),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 120,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Update Password',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildPasswordField('Current Password', _currentPasswordController),
                              const SizedBox(height: 20),
                              _buildPasswordField('New Password', _newPasswordController),
                              const SizedBox(height: 20),
                              _buildPasswordField('Retype New Password', _retypePasswordController),
                              const SizedBox(height: 40),
                              ElevatedButton(
                                onPressed: _updatePassword,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFDCF8C6),
                                  foregroundColor: Colors.green[900],
                                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'UPDATE PASSWORD',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField(String hintText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      validator: (value) {
        if (hintText == 'Retype New Password') {
          return _validateRetypePassword(value);
        }
        return _validatePassword(value);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFDCF8C6),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF336633)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

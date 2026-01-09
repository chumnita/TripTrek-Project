import 'package:flutter/material.dart';
import 'package:triptrek/screens/s1-auth/otp.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  FocusNode _firstNameFocusNode = FocusNode();
  FocusNode _lastNameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.08,
              child: Stack(
                children: [
                  Positioned(
                    top: 16,
                    left: 12,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.arrow_back,
                          color: const Color(0xFF52BD94),
                          size: isTablet ? 28 : screenWidth * 0.06,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 24 : screenWidth * 0.05,
                  vertical: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Title Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create new',
                          style: TextStyle(
                            fontSize: isTablet ? 56 : screenWidth * 0.09,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF52BD94),
                            height: 1.1,
                          ),
                        ),
                        Text(
                          'account',
                          style: TextStyle(
                            fontSize: isTablet ? 56 : screenWidth * 0.09,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF52BD94),
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                    // Subtitle
                    Text(
                      'What\'s your name',
                      style: TextStyle(
                        fontSize: isTablet ? 16 : screenWidth * 0.035,
                        color: Colors.black,
                      ),
                    ),
                    // First Name Field
                    TextFormField(
                      controller: _firstNameController,
                      focusNode: _firstNameFocusNode,
                      style: TextStyle(
                        fontSize: isTablet ? 16 : screenWidth * 0.035,
                      ),
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(
                          color:
                              _firstNameFocusNode.hasFocus
                                  ? Color(0xFF52BD94)
                                  : Colors.grey[600],
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF52BD94),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: isTablet ? 16 : screenHeight * 0.015,
                        ),
                      ),
                      onTap: () => setState(() {}),
                    ),
                    // Last Name Field
                    TextFormField(
                      controller: _lastNameController,
                      focusNode: _lastNameFocusNode,
                      style: TextStyle(
                        fontSize: isTablet ? 16 : screenWidth * 0.035,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                          color:
                              _lastNameFocusNode.hasFocus
                                  ? Color(0xFF52BD94)
                                  : Colors.grey[600],
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF52BD94),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: isTablet ? 16 : screenHeight * 0.015,
                        ),
                      ),
                      onTap: () => setState(() {}),
                    ),
                    // Email Section
                    Text(
                      'Input an email address',
                      style: TextStyle(
                        fontSize: isTablet ? 16 : screenWidth * 0.035,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      style: TextStyle(
                        fontSize: isTablet ? 16 : screenWidth * 0.035,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color:
                              _emailFocusNode.hasFocus
                                  ? Color(0xFF52BD94)
                                  : Colors.grey[600],
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF52BD94),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: isTablet ? 16 : screenHeight * 0.015,
                        ),
                      ),
                      onTap: () => setState(() {}),
                    ),
                    // Password Section
                    Text(
                      'Create a password',
                      style: TextStyle(
                        fontSize: isTablet ? 16 : screenWidth * 0.035,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: !_isPasswordVisible,
                      style: TextStyle(
                        fontSize: isTablet ? 16 : screenWidth * 0.035,
                      ),
                      decoration: InputDecoration(
                        labelText: 'New password',
                        labelStyle: TextStyle(
                          color:
                              _passwordFocusNode.hasFocus
                                  ? Color(0xFF52BD94)
                                  : Colors.grey[600],
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey[600],
                            size: isTablet ? 20 : screenWidth * 0.045,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF52BD94),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: isTablet ? 16 : screenHeight * 0.015,
                        ),
                      ),
                      onTap: () => setState(() {}),
                    ),
                    // Password Requirements
                    Text(
                      'Your password must include at least one symbol and be 8 or more characters long',
                      style: TextStyle(
                        fontSize: isTablet ? 12 : screenWidth * 0.025,
                        color: Colors.grey[600],
                        height: 1.3,
                      ),
                    ),
                    // OTP Button
                    SizedBox(
                      width: double.infinity,
                      height: isTablet ? 52 : screenHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => const OTPVerificationScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF52BD94),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'OTP verification',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 18 : screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    // Already have account
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account?  ",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: isTablet ? 14 : screenWidth * 0.03,
                            ),
                            children: [
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                  color: const Color(0xFF52BD94),
                                  fontWeight: FontWeight.w500,
                                  fontSize: isTablet ? 14 : screenWidth * 0.03,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

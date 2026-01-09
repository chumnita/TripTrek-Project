import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();
  bool _isNewPasswordVisible = false;
  bool _isVerifyPasswordVisible = false;
  bool _isEmailVerified = false;
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _newPasswordFocusNode = FocusNode();
  FocusNode _verifyPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _newPasswordController.dispose();
    _verifyPasswordController.dispose();
    _emailFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _verifyPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            // Header with back button
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
                  horizontal: isTablet ? 24 : 20,
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
                          'Forget your',
                          style: TextStyle(
                            fontSize: isTablet ? 56 : screenWidth * 0.09,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF52BD94),
                            height: 1.1,
                          ),
                        ),
                        Text(
                          'password',
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
                      'Please fill your Gmail',
                      style: TextStyle(
                        fontSize: isTablet ? 16 : screenWidth * 0.035,
                        color: Colors.black,
                      ),
                    ),
                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      style: TextStyle(fontSize: isTablet ? 16 : screenWidth * 0.035),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: _emailFocusNode.hasFocus
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
                    // Verification row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Clicked here to verify',
                          style: TextStyle(
                            fontSize: isTablet ? 14 : screenWidth * 0.03,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isEmailVerified = true;
                            });
                          },
                          child: Text(
                            'Verify',
                            style: TextStyle(
                              fontSize: isTablet ? 14 : screenWidth * 0.03,
                              color: const Color(0xFF52BD94),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // New Password Section
                    Text(
                      'Input new password',
                      style: TextStyle(
                        fontSize: isTablet ? 16 : screenWidth * 0.035,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // New Password Field
                    TextFormField(
                      controller: _newPasswordController,
                      focusNode: _newPasswordFocusNode,
                      obscureText: !_isNewPasswordVisible,
                      style: TextStyle(fontSize: isTablet ? 16 : screenWidth * 0.035),
                      decoration: InputDecoration(
                        labelText: 'New password',
                        labelStyle: TextStyle(
                          color: _newPasswordFocusNode.hasFocus
                                  ? Color(0xFF52BD94)
                                  : Colors.grey[600],
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isNewPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey[600],
                                size: isTablet ? 20 : screenWidth * 0.045,
                            ),
                            onPressed: () {
                              setState(() {
                                _isNewPasswordVisible = !_isNewPasswordVisible;
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
                      // Verify Password Field
                      TextFormField(
                        controller: _verifyPasswordController,
                        focusNode: _verifyPasswordFocusNode,
                        obscureText: !_isVerifyPasswordVisible,
                        style: TextStyle(fontSize: isTablet ? 16 : screenWidth * 0.035),
                        decoration: InputDecoration(
                          labelText: 'Verify password',
                          labelStyle: TextStyle(
                            color: _verifyPasswordFocusNode.hasFocus
                                    ? Color(0xFF52BD94)
                                    : Colors.grey[600],
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isVerifyPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey[600],
                                  size: isTablet ? 20 : 16,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isVerifyPasswordVisible = !_isVerifyPasswordVisible;
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
                        // Password requirements
                        Text(
                          'Your password must include at least one symbol and be 8 or more characters long',
                          style: TextStyle(
                            fontSize: isTablet ? 12 : screenWidth * 0.025,
                            color: Colors.grey[600],
                            height: 1.3,
                          ),
                        ),
                        // Log In Button
                        SizedBox(
                          width: double.infinity,
                          height: isTablet ? 52 : screenHeight * 0.06,
                          child: ElevatedButton(
                            onPressed: () {
                              _handlePasswordReset();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF52BD94),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isTablet ? 18 : screenWidth * 0.04,
                                fontWeight: FontWeight.w600,
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

  void _handlePasswordReset() {
    if (_emailController.text.isEmpty) {
      _showSnackBar('Please enter your email');
      return;
    }
    if (!_isEmailVerified) {
      _showSnackBar('Please verify your email first');
      return;
    }
    if (_newPasswordController.text.isEmpty) {
      _showSnackBar('Please enter a new password');
      return;
    }
    if (_verifyPasswordController.text.isEmpty) {
      _showSnackBar('Please verify your password');
      return;
    }
    if (_newPasswordController.text != _verifyPasswordController.text) {
      _showSnackBar('Passwords do not match');
      return;
    }
    if (_newPasswordController.text.length < 8) {
      _showSnackBar('Password must be at least 8 characters long');
      return;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(_newPasswordController.text)) {
      _showSnackBar('Password must contain at least one symbol');
      return;
    }
    _showSnackBar('Password reset successful!');
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF52BD94),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class NavigationExample {
  static void navigateToForgotPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
    );
  }
}
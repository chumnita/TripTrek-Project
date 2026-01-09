import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:triptrek/screens/s1-auth/froget_password.dart';
import 'package:triptrek/screens/s1-auth/sign_up.dart';
import 'package:triptrek/screens/welcome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Header Image Section - now rectangular
            Container(
              height: screenHeight * 0.25 + statusBarHeight,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: statusBarHeight / 2),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF4CAF50),
                        child: const Center(
                          child: Icon(
                            Icons.landscape,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(color: Colors.black.withOpacity(0.2)),
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
                    // Welcome Text
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Welcome!',
                            style: TextStyle(
                              fontSize: isTablet ? 28 : screenWidth * 0.055,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: isTablet ? 56 : screenWidth * 0.09,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF52BD94),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'Please fill your information',
                            style: TextStyle(
                              fontSize: isTablet ? 16 : screenWidth * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ],
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
                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: !_isPasswordVisible,
                      style: TextStyle(fontSize: isTablet ? 16 : screenWidth * 0.035),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: _passwordFocusNode.hasFocus
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
                    // Remember me and Forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Transform.scale(
                              scale: isTablet ? 1.1 : 1.0,
                              child: Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                activeColor: const Color(0xFF52BD94),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: isTablet ? 14 : screenWidth * 0.03,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: isTablet ? 14 : screenWidth * 0.03,
                              color: const Color(0xFF52BD94),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Create account text
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account yet?  ",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: isTablet ? 14 : screenWidth * 0.03,
                          ),
                          children: [
                            TextSpan(
                              text: 'Create account',
                              style: TextStyle(
                                color: const Color(0xFF52BD94),
                                fontWeight: FontWeight.w500,
                                fontSize: isTablet ? 14 : screenWidth * 0.03,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CreateAccountScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: isTablet ? 52 : screenHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomeScreen(),
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
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 18 : screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    // Social Media Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(
                          FontAwesomeIcons.instagram,
                          isTablet,
                          () {},
                        ),
                        SizedBox(width: isTablet ? 24 : screenWidth * 0.05),
                        _buildSocialIcon(
                          FontAwesomeIcons.google,
                          isTablet,
                          () {},
                        ),
                        SizedBox(width: isTablet ? 24 : screenWidth * 0.05),
                        _buildSocialIcon(
                          FontAwesomeIcons.twitter,
                          isTablet,
                          () {},
                        ),
                      ],
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

  Widget _buildSocialIcon(IconData icon, bool isTablet, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isTablet ? 48 : MediaQuery.of(context).size.width * 0.1,
        height: isTablet ? 48 : MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Icon(icon, size: isTablet ? 24 : MediaQuery.of(context).size.width * 0.05, color: Colors.grey[700]),
      ),
    );
  }
}
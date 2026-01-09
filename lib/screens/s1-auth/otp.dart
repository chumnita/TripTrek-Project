import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:triptrek/screens/welcome.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  Timer? _timer;
  int _seconds = 156; // 2:36 in seconds

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _onChanged(String value, int index) {
    if (value.length == 1) {
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  bool _isOTPComplete() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
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
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight - MediaQuery.of(context).padding.top,
            ),
            child: Column(
              children: [
                // Header with back button (matched with CreateAccountScreen)
                Container(
                  height: 60,
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
                              size: isTablet ? 28 : 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 24 : 20,
                    vertical: 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Text (matched with CreateAccountScreen)
                      SizedBox(height: isTablet ? 40 : 32),
                      Text(
                        'OTP verification',
                        style: TextStyle(
                          fontSize: isTablet ? 56 : 36,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF52BD94),
                          height: 1.1,
                        ),
                      ),

                      SizedBox(height: isTablet ? 32 : 34),

                      // Subtitle (matched with CreateAccountScreen)
                      Text(
                        'Input the OTP',
                        style: TextStyle(
                          fontSize: isTablet ? 16 : 14,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: isTablet ? 32 : 24),

                      // OTP Input Fields
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return Container(
                            width: isTablet ? 60 : 50,
                            height: isTablet ? 60 : 50,
                            child: TextFormField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: isTablet ? 24 : 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
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
                                contentPadding: EdgeInsets.zero,
                              ),
                              onChanged: (value) => _onChanged(value, index),
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: isTablet ? 32 : 24),

                      // Timer and Resend Code
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Send code reload in',
                            style: TextStyle(
                              fontSize: isTablet ? 14 : 12,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            _formatTime(_seconds),
                            style: TextStyle(
                              fontSize: isTablet ? 14 : 12,
                              color: const Color(0xFF52BD94),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: isTablet ? 80 : 100),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        height: isTablet ? 52 : 48,
                        child: ElevatedButton(
                          onPressed:
                              _isOTPComplete()
                                  ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const WelcomeScreen(),
                                      ),
                                    );
                                    String otp =
                                        _controllers.map((c) => c.text).join();
                                    print('OTP entered: $otp');
                                    // Navigate to next screen or verify OTP
                                  }
                                  : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _isOTPComplete()
                                    ? const Color(0xFF52BD94)
                                    : Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color:
                                  _isOTPComplete()
                                      ? Colors.white
                                      : Colors.grey[600],
                              fontSize: isTablet ? 18 : 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: isTablet ? 32 : 24),

                      // Resend Code Option
                      if (_seconds == 0)
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _seconds = 156;
                              });
                              _startTimer();
                              // Handle resend OTP logic here
                            },
                            child: Text(
                              'Resend Code',
                              style: TextStyle(
                                color: const Color(0xFF52BD94),
                                fontSize: isTablet ? 14 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                      SizedBox(height: isTablet ? 32 : 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

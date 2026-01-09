import 'package:flutter/material.dart';
import 'dart:async';

import 'package:triptrek/screens/s1-auth/login.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  // Data array for onboarding screens
  final List<Map<String, String>> _onboardingData = [
    {
      'bgImage': 'assets/images/start-1.jpg',
      'title': 'Let\'s explore\nCambodia',
      'description':
          'It\'s might looks like a small country but the scenery and destination are riching across the country',
      'iconImage': 'assets/images/TRIPTREK.png',
    },
    {
      'bgImage': 'assets/images/start-2.jpg',
      'title': 'Visit tourist \nattractions',
      'description':
          'Explore magnificent temples and historical sites that tell the story of Cambodia\'s rich heritage',
      'iconImage': 'assets/images/TRIPTREK.png',
    },
    {
      'bgImage': 'assets/images/start-3.jpg',
      'title': 'Get ready and \nstarted now',
      'description':
          'Immerse yourself in authentic Cambodian culture, food, and traditions that will create lasting memories',
      'iconImage': 'assets/images/TRIPTREK.png',
    },
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );

    _startAutoSlide();
  }

  void _startAutoSlide() {
    _animationController.forward();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < _onboardingData.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.05; // 5% of screen width

    return Scaffold(
      body: Stack(
        children: [
          // Background Image with PageView
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              _animationController.reset();
              _animationController.forward();
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_onboardingData[index]['bgImage']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Content Overlay
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Flexible spacer to push content to bottom
                  const Spacer(flex: 3),

                  // Content section with logo, title, and description
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo
                        Image.asset(
                          _onboardingData[_currentIndex]['iconImage']!,
                          height: 40,
                          color: Colors.white,
                          alignment: Alignment.centerLeft,
                        ),

                        const SizedBox(height: 16),

                        // Title
                        Text(
                          _onboardingData[_currentIndex]['title']!,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Description
                        Expanded(
                          child: Text(
                            _onboardingData[_currentIndex]['description']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Combined Progress and Button Section
                  Column(
                    children: [
                      // Progress Indicators
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: screenWidth * 0.9, // 90% of screen width
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            _onboardingData.length,
                            (index) => Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  right:
                                      index < _onboardingData.length - 1
                                          ? 8
                                          : 0,
                                ),
                                child: AnimatedBuilder(
                                  animation: _progressAnimation,
                                  builder: (context, child) {
                                    return Container(
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color:
                                            index == _currentIndex
                                                ? Colors.white.withOpacity(0.3)
                                                : Colors.white.withOpacity(0.3),
                                      ),
                                      child:
                                          index == _currentIndex
                                              ? FractionallySizedBox(
                                                alignment: Alignment.centerLeft,
                                                widthFactor:
                                                    _progressAnimation.value,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          2,
                                                        ),
                                                    color: const Color(
                                                      0xFF52BD94,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              : null,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12), // Reduced spacing
                      // Next Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _onNextPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF52BD94),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40), // Bottom spacing
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

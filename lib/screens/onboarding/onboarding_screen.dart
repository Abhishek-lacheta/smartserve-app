import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../auth/login_screen.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();







}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'title': 'ONLINE SHOPPING',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra quam elementum massa, viverra. Ut turpis consectetur.',
      'icon': Icons.shopping_cart_checkout,
    },
    {
      'title': 'HOME DELIVER SERVICE',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra quam elementum massa, viverra. Ut turpis consectetur.',
      'icon': Icons.delivery_dining,
    },
    {
      'title': 'ONLINE PAYMENT',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra quam elementum massa, viverra. Ut turpis consectetur.',
      'icon': Icons.security,
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryCyan,
      body: Column(
        children: [
          // Top Illustration Area
          Expanded(
            flex: 5,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Icon(
                    _onboardingData[index]['icon'],
                    size: 150,
                    color: Colors.white.withOpacity(0.8),
                  ),
                );
              },
            ),
          ),
          
          // Bottom White Card
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                children: [
                  Text(
                    _onboardingData[_currentPage]['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryOrange,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _onboardingData[_currentPage]['description'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  
                  // Bottom Navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: _navigateToLogin,
                        child: const Text(
                          'Skip>>',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryOrange,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _nextPage,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primaryOrange, width: 1.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryOrange,
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

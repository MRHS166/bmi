import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: "Start Your Journey Towards A More Active Lifestyle",
      imagePath: "images/first.jpg",
      icon: Icons.directions_run,
    ),
    OnboardingPage(
      title: "Find Nutrition Tips That Fit Your Lifestyle",
      imagePath: "images/third.jpg",
      icon: Icons.restaurant,
    ),
    OnboardingPage(
      title: "A Community For You, Challenge Yourself",
      imagePath: "images/third1.jpg",
      icon: Icons.people,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToSignIn() {
    Navigator.of(context).pushReplacementNamed('/sign_in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _buildPage(index);
            },
          ),

          // Skip Button
          Positioned(
            top: 50,
            right: 20,
            child: SafeArea(
              child: TextButton(
                onPressed: _navigateToSignIn,
                child: Row(
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.yellow[300],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.yellow[300],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Buttons
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        _navigateToSignIn();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.3),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Center(
                      child: Text(
                        _currentPage < _pages.length - 1
                            ? 'Next'
                            : 'Get Started',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: _currentPage == index ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Fullscreen background image
        Image.asset(
          _pages[index].imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        // Overlay
        Container(
          color: Colors.black.withOpacity(0.3),
        ),

        // Content
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              color: const Color(0x3a3736).withOpacity(0.8),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Column(
                children: [
                  Icon(
                    _pages[index].icon,
                    color: Colors.yellow[300],
                    size: 40,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    _pages[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}

class OnboardingPage {
  final String title;
  final String imagePath;
  final IconData icon;

  OnboardingPage({
    required this.title,
    required this.imagePath,
    required this.icon,
  });
}

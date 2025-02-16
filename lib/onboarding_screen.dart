import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // PageView untuk onboarding
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              if (_currentIndex != index) {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            children: [
              buildPage(
                image: 'assets/barber1.jpg',
                title: 'Selamat Datang!',
                description: 'Potongan terbaik untuk pria modern.',
              ),
              buildPage(
                image: 'assets/barber2.jpg',
                title: 'Profesional & Bersih',
                description: 'Gunakan layanan berkualitas tinggi di sini!',
              ),
              buildPage(
                image: 'assets/barber3.jpg',
                title: 'Pesan Sekarang!',
                description: 'Dapatkan tampilan terbaik Anda hari ini.',
              ),
            ],
          ),

          // Indikator dan tombol di bawah
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol "Lanjut" atau "Mulai"
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _currentIndex == 2
                      ? ElevatedButton(
                          key: const ValueKey('start_button'),
                          onPressed: () {
                            // TODO: Navigasi ke halaman utama
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Mulai',
                              style: TextStyle(fontSize: 18)),
                        )
                      : TextButton(
                          key: const ValueKey('next_button'),
                          onPressed: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: const Text(
                            'Lanjut',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
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

  Widget buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Gambar Fullscreen
        Image.asset(image, fit: BoxFit.cover),

        // Gradasi Transparan
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
        ),

        // Teks di atas gambar
        Positioned(
          bottom: 150,
          left: 20,
          right: 20,
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

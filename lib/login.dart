import 'package:flutter/material.dart';
import 'main_menu.dart'; // Pastikan file main_menu.dart ada di dalam proyek

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Dummy email & password
  final String dummyEmail = "hiwapiputra@gmail.com";
  final String dummyPassword = "123456";

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      if (email == dummyEmail && password == dummyPassword) {
        // Jika login benar, alihkan ke Main Menu
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainMenu()),
        );
      } else {
        // Jika salah, tampilkan pesan error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email atau Password salah!"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/login-img.jpeg',
            fit: BoxFit.cover,
          ),

          // Gradasi Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),

          // Form Login
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Tambahkan Logo
                    Image.asset(
                      'assets/ut-logo.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Login Area",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Gaya Terbaik, Performa Maksimal",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Input Email
                    _buildInputField(
                      controller: _emailController,
                      icon: Icons.email_outlined,
                      hintText: "Email",
                      validator: (value) =>
                          value!.isEmpty ? "Email wajib diisi" : null,
                    ),
                    const SizedBox(height: 15),

                    // Input Password
                    _buildInputField(
                      controller: _passwordController,
                      icon: Icons.lock_outline,
                      hintText: "Password",
                      isPassword: true,
                      validator: (value) =>
                          value!.isEmpty ? "Password wajib diisi" : null,
                    ),
                    const SizedBox(height: 20),

                    // Tombol Login
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child:
                          const Text("Masuk", style: TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(height: 15),

                    // Lupa Password & Daftar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            // TODO: Lupa Password
                          },
                          child: const Text(
                            "Lupa Password?",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            // TODO: Navigasi ke halaman daftar
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }
}

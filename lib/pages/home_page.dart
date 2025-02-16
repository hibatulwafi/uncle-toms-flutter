import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildMenuGrid(context),
                      const SizedBox(height: 15),
                      _buildPromoSlider(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     Color.fromARGB(255, 46, 46, 46),
        //     Color.fromARGB(255, 42, 42, 42),
        //   ],
        // ),
        image: const DecorationImage(
          image: AssetImage('assets/banner-img.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/ava1.png'),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hibatul Wafi P",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  _buildInfoRow(Icons.phone, "+62 812-3456-7890"),
                  _buildInfoRow(Icons.email, "user@email.com"),
                  Row(
                    children: [
                      _buildInfoRow(Icons.star, "Poin: 122k"),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber, // Warna gold untuk VIP
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "VIP Member",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 14),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 5),
        // const Icon(Icons.verified, color: Colors.green, size: 18),
      ],
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildMenuItem(Icons.cut, "Haircut"),
        _buildMenuItem(Icons.spa, "Treatment"),
        _buildMenuItem(Icons.shopping_bag, "Products"),
        _buildMenuItem(Icons.calendar_today, "Booking"),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.orange, size: 40),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoSlider() {
    final List<String> promoImages = [
      'assets/banner1.png',
      'assets/banner2.png',
      'assets/banner3.png',
      'assets/banner4.png',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 28, 28, 28)
                .withOpacity(0.8), // Background untuk judul
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: const Text(
              "Promo Spesial Untukmu!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 320, // Sesuaikan tinggi agar promo tidak hilang
          child: PageView.builder(
            controller: _pageController,
            itemCount: promoImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    promoImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

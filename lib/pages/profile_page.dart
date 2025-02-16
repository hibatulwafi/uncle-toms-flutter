import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color.fromARGB(255, 40, 40, 40)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // Foto Profil
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/ava1.png'), // Ganti dengan path gambar profil
            ),
            const SizedBox(height: 10),

            // Nama & Email
            const Text(
              "John Doe",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "johndoe@example.com",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            // List Menu Pengaturan
            Expanded(
              child: ListView(
                children: [
                  ProfileMenuItem(
                    icon: Icons.person,
                    title: "Edit Profile",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.lock,
                    title: "Ubah Password",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.notifications,
                    title: "Notifikasi",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.help_outline,
                    title: "Bantuan",
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.info_outline,
                    title: "Tentang Aplikasi",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Tombol Logout
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Tambahkan logika logout
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk item menu di profile
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
        onTap: onTap,
      ),
    );
  }
}

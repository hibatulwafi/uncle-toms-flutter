import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo di kiri
          Image.asset(
            'assets/inline-ut-logo.png',
            height: 40,
          ),

          // Icon bell di kanan
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              print("Notifikasi ditekan");
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

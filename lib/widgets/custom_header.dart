import 'package:flutter/material.dart';
import '../services/notification_service.dart'; // Pastikan path benar
import '../screens/notification_screen.dart';

class CustomHeader extends StatefulWidget implements PreferredSizeWidget {
  const CustomHeader({super.key});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomHeaderState extends State<CustomHeader> {
  late Future<int> _unreadNotificationCountFuture;

  @override
  void initState() {
    super.initState();
    _unreadNotificationCountFuture =
        NotificationService().getUnreadNotificationCount();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo kiri
          Image.asset(
            'assets/inline-ut-logo.png',
            height: 40,
          ),

          // Bell kanan
          FutureBuilder<int>(
            future: _unreadNotificationCountFuture,
            builder: (context, snapshot) {
              int unreadCount = snapshot.data ?? 0;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () async {
                      // Setelah kembali dari NotificationScreen, refresh jumlah notif
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                      setState(() {
                        _unreadNotificationCountFuture =
                            NotificationService().getUnreadNotificationCount();
                      });
                    },
                  ),
                  if (unreadCount > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Center(
                          child: Text(
                            unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

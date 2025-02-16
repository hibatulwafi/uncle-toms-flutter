import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasScanned = false; // Pindahkan ke variabel global dalam State

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 200).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pindai QR Code")),
      body: Stack(
        children: [
          // Kamera Scanner
          MobileScanner(
            onDetect: (capture) {
              if (_hasScanned) return;
              _hasScanned = true; // Set flag agar hanya diproses sekali

              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  if (mounted) {
                    Navigator.pop(context, barcode.rawValue);
                  }
                }
              }
            },
          ),

          // Kotak dan Garis Animasi
          Center(
            child: Stack(
              children: [
                // Kotak Pemindai
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                // Garis Animasi Naik-Turun
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Positioned(
                      top: _animation.value,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: 250,
                        height: 4,
                        color: Colors.greenAccent,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

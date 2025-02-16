import 'package:flutter/material.dart';
import 'qr_scanner_page.dart'; // Pastikan file di-import dengan benar

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String scanResult = "Belum ada hasil scan";

  Future<void> scanQRCode() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QRScannerPage(),
      ),
    );

    if (result != null) {
      setState(() {
        scanResult = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR Code")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(scanResult, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanQRCode,
              child: const Text("Mulai Scan"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key});

  // Data store (nama, alamat, koordinat)
  final List<Map<String, dynamic>> stores = [
    {
      "name": "Barbershop A",
      "address": "Jl. Merdeka No. 10, Jakarta",
      "latitude": -6.200000,
      "longitude": 106.816666,
    },
    {
      "name": "Barbershop B",
      "address": "Jl. Diponegoro No. 15, Bandung",
      "latitude": -6.914744,
      "longitude": 107.609810,
    },
    {
      "name": "Barbershop C",
      "address": "Jl. Sudirman No. 20, Surabaya",
      "latitude": -7.257472,
      "longitude": 112.752090,
    },
  ];

  // Fungsi untuk membuka lokasi di Google Maps
  void _openMap(double latitude, double longitude) async {
    final url =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not open the map.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store Locations"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final store = stores[index];
          return Card(
            color: Colors.white.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.store, color: Colors.white),
              title: Text(
                store["name"],
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                store["address"],
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.location_on, color: Colors.red),
                onPressed: () {
                  _openMap(store["latitude"], store["longitude"]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

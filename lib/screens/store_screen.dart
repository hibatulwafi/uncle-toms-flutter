import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key}) : super(key: key); // Hapus const di sini
  // Data barbershop
  final List<Map<String, dynamic>> stores = [
    {
      "name": "Uncle Tom's Barbershop Joglo",
      "address": "Jl. Joglo Raya No.10A, Jakarta Barat.",
      "latitude": -6.200000,
      "longitude": 106.816666,
      "barbers": [
        {
          "name": "John Doe",
          "image": "assets/caster1.jpg",
          "rating": 4.8,
          "status": "available"
        },
        {
          "name": "Mike Smith",
          "image": "assets/caster2.jpg",
          "rating": 4.8,
          "status": "dayoff"
        },
      ],
    },
    {
      "name": "Uncle Tom's Barbershop Pondok Kelapa",
      "address": "Jl. Pd. Kelapa Raya No.Kav. No. 5 Blok B1, Jakarta Timur.",
      "latitude": -6.914744,
      "longitude": 107.609810,
      "barbers": [
        {
          "name": "Sarah Lee",
          "image": "assets/caster3.jpg",
          "rating": 4.7,
          "status": "available"
        },
        {
          "name": "David Brown",
          "image": "assets/caster4.jpg",
          "rating": 4.6,
          "status": "dayoff"
        },
      ],
    },
  ];

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoreDetailPage(store: store),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class StoreDetailPage extends StatelessWidget {
  final Map<String, dynamic> store;

  const StoreDetailPage({super.key, required this.store});

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
        title: Text(store["name"]),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tombol Google Maps
            ElevatedButton.icon(
              onPressed: () => _openMap(store["latitude"], store["longitude"]),
              icon: const Icon(Icons.map, color: Colors.white),
              label: const Text(
                "Lihat di Google Maps",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            // Nama Store
            Text(
              store["name"],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            // Alamat Store
            Text(
              store["address"],
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 16),

            // Daftar Barber
            const Text(
              "Our Caster:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: store["barbers"].length,
                itemBuilder: (context, index) {
                  final barber = store["barbers"][index];
                  final bool isAvailable = barber["status"] == "available";

                  return Card(
                    color: Colors.white.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(barber["image"]),
                      ),
                      title: Text(
                        barber["name"],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.yellow, size: 18),
                              const SizedBox(width: 5),
                              Text(
                                "${barber["rating"]} / 5.0",
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                isAvailable ? Icons.check_circle : Icons.cancel,
                                color: isAvailable ? Colors.green : Colors.red,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                isAvailable ? "Available" : "Day Off",
                                style: TextStyle(
                                  color:
                                      isAvailable ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

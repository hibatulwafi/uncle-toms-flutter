import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support & Contact"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color.fromARGB(255, 29, 28, 28)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const Center(
                child: Text(
                  "Hubungi Kami",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Kontak Barbershop dalam Card
              ContactCard(
                icon: Icons.phone,
                title: "Telepon",
                subtitle: "+62 812-3456-7890",
                color: Colors.blue,
              ),
              ContactCard(
                icon: Icons.email,
                title: "Email",
                subtitle: "info@barbershop.com",
                color: Colors.orange,
              ),
              ContactCard(
                icon: Icons.location_on,
                title: "Alamat",
                subtitle: "Jl. Barber No. 10, Jakarta, Indonesia",
                color: Colors.red,
              ),

              const SizedBox(height: 20),

              // FAQ Section
              const Center(
                child: Text(
                  "FAQ (Pertanyaan Umum)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // FAQ List
              Expanded(
                child: ListView(
                  children: const [
                    FAQItem(
                      question: "Apakah perlu reservasi sebelum datang?",
                      answer:
                          "Tidak wajib, tapi disarankan untuk menghindari antrean.",
                    ),
                    FAQItem(
                      question: "Apakah menerima pembayaran dengan kartu?",
                      answer: "Ya, kami menerima kartu kredit dan debit.",
                    ),
                    FAQItem(
                      question: "Apakah ada layanan home service?",
                      answer:
                          "Ya, kami menyediakan home service dengan biaya tambahan.",
                    ),
                    FAQItem(
                      question: "Berapa harga potong rambut?",
                      answer:
                          "Harga potong rambut mulai dari Rp50.000, tergantung model yang dipilih.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget untuk menampilkan informasi kontak dalam Card
class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}

// Widget untuk menampilkan FAQ dengan animasi ekspansi
class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          widget.question,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        subtitle: _isExpanded
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  widget.answer,
                  style: const TextStyle(color: Colors.white70),
                ),
              )
            : null,
      ),
    );
  }
}

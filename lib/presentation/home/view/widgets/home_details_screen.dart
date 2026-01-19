import 'package:flutter/material.dart';
import '../../../../data/models/category_all_services.dart';

class GigDetailScreen extends StatelessWidget {
  final ItemDetail item;

  const GigDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Creative Gigs", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel Placeholder
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(item.image, width: double.infinity, height: 250, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 25, height: 6, decoration: BoxDecoration(color: const Color(0xFF6C40FE), borderRadius: BorderRadius.circular(10))),
                      const SizedBox(width: 5),
                      Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle)),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Creative Gigs", style: TextStyle(color: Color(0xFF6C40FE), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(item.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("San Francisco, CA . 6h ago", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 12),
                  Text(item.price, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Divider(height: 32),
                  const Text("Gig Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(item.description, style: TextStyle(color: Colors.grey.shade700, height: 1.5)),
                  const SizedBox(height: 20),
                  const Text("Tags:", style: TextStyle(fontWeight: FontWeight.bold)),
                  const Wrap(
                    spacing: 8,
                    children: [
                      Chip(label: Text("Logo Design")),
                      Chip(label: Text("Freelance")),
                      Chip(label: Text("Remote")),
                    ],
                  ),
                  const Divider(height: 32),
                  const Text("Posted by", style: TextStyle(fontWeight: FontWeight.bold)),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=32')),
                    title: Text("Bessie Cooper", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Contact Info:", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text("Call: +99125 456 789"),
                        Text("Email: kathben@gmail.com"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100), // Space for bottom buttons
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.black12))),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C40FE),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: const Text("Message", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
              child: IconButton(icon: const Icon(Icons.favorite_border, color: Color(0xFF6C40FE)), onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
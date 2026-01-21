import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Delivery',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Driver Profile Section
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(Assets.dummy.userPhoto.keyName), // Replace with actual image
              ),
              title: const Text(
                'Davidson Edgar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('20 Deliveries', style: TextStyle(color: Colors.green, fontSize: 12)),
                  Row(
                    children: [
                      ...List.generate(4, (index) => const Icon(Icons.star, color: Colors.orange, size: 16)),
                      const Icon(Icons.star, color: Colors.grey, size: 16),
                      const SizedBox(width: 5),
                      const Text('4.1', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.motorcycle_outlined, color: Colors.orange, size: 30),
            ),
            const SizedBox(height: 20),
            // Locations Section
            _buildLocationRow(Icons.location_on, Colors.orange, "Pickup Location", "32 Samwell Sq, Chevron"),
            _buildDashedLine(),
            _buildLocationRow(Icons.radio_button_checked, Colors.green, "Delivery Location", "21b, Karimu Kotun Street, Victoria Island"),
            const SizedBox(height: 30),
            // Details Section
            _buildDetailField("What you are sending", "Pizza"),
            _buildDetailField("Receipient contact number", "08123456789"),
            _buildDetailField("Fee:", "\$150", isBoldValue: true),
            const SizedBox(height: 20),
            // Pickup Images Section
            const Text("Pickup image(s)", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildPickupImage('https://via.placeholder.com/100'), // Burger placeholder
                const SizedBox(width: 10),
                _buildPickupImage('https://via.placeholder.com/100'), // Pizza placeholder
              ],
            ),
            const SizedBox(height: 40),
            // Map Button
            Center(
              child: TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.trackRiderScreen);
                },
                child: Text("View Map Route", style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            // Delivery Button
            ButtonWidget(label: AppStrings.delivery,
            onPressed: (){
              Get.toNamed(AppRoutes.completedScreen);
            },
              buttonRadius: 100,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow(IconData icon, Color color, String title, String address) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
              Text(address, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDashedLine() {
    return Padding(
      padding: const EdgeInsets.only(left: 11),
      child: Column(
        children: List.generate(3, (index) => Container(
          width: 2, height: 5, color: Colors.green, margin: const EdgeInsets.symmetric(vertical: 2),
        )),
      ),
    );
  }

  Widget _buildDetailField(String label, String value, {bool isBoldValue = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(
              fontSize: 18,
              fontWeight: isBoldValue ? FontWeight.bold : FontWeight.w600,
              color: Colors.black87
          )),
        ],
      ),
    );
  }

  Widget _buildPickupImage(String url) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: AssetImage(Assets.dummy.cartItem.keyName), fit: BoxFit.cover),
      ),
    );
  }
}
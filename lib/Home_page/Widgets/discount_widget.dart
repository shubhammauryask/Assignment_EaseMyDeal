import 'package:easemydeal_task/Home_page/Model/discount_model.dart';
import 'package:flutter/material.dart';


Widget discountWidget(BuildContext context, DiscountModel data) {
  return Card(
    margin: const EdgeInsets.only(left: 8,right: 8, top: 10,bottom: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Container(
      width: 300, // Set a fixed width for horizontal cards
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // image: DecorationImage(
        //   image: AssetImage('assets/your_image_name.png'), // Path to your asset image
        //   fit: BoxFit.cover, // Adjust the fit as needed
        // ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                data.imageUrl, // Replace with your asset image
                fit: BoxFit.fitWidth, // Scale the image appropriately
                width: 120, // Set the desired width for the image
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data.discount,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellowAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data.features,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('BUY NOW'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}


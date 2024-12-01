
import 'package:easemydeal_task/Home_page/Model/offers_coupon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  Widget offerWidget(BuildContext context,OfferModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: data.onTap,
        child: ClipPath(
          clipper: RPSCustomClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width*0.75,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: data.backgroundColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Bank Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      data.bankIcon,
                      width: 35,
                      height: 35,
                      // If using network image, replace with:
                      // Image.network(bankIcon)
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Offer Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Extra ₹${data.offerAmount} off on ',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: data.bankName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.description,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (data.additionalInfo != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          data.additionalInfo!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


class RPSCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 20.0; // Radius of the circular cutouts

    Path path = Path()
      ..moveTo(0, radius) // Start at the top-left, after the top-left cutout
      ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius), clockwise: false) // Top-left cutout
      ..lineTo(size.width - radius, 0) // Top edge
      ..arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius), clockwise: false) // Top-right cutout
      ..lineTo(size.width, size.height - radius) // Right edge
      ..arcToPoint(Offset(size.width - radius, size.height), radius: Radius.circular(radius), clockwise: false) // Bottom-right cutout
      ..lineTo(radius, size.height) // Bottom edge
      ..arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius), clockwise: false) // Bottom-left cutout
      ..lineTo(0, radius) // Left edge
      ..close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Reclip only if needed
  }
}




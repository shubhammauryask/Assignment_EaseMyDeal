import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Delivery location
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery to',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Text(
                      '201301',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Icons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.grey.shade600,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite_outline),
                  color: Colors.grey.shade600,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined),
                  color: Colors.grey.shade600,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
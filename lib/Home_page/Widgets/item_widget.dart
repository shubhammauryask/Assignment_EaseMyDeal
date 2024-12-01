import 'package:easemydeal_task/Home_page/Model/item_model.dart';
import 'package:flutter/material.dart';



Widget itemWidget(BuildContext context,ItemModel data) {
  var hi = MediaQuery.of(context).size.height;
  var wi = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 12,right: 5,left: 5,bottom: 5),
              width: wi*0.15,
              height: wi*0.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.asset(
                data.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 40);
                },
              ),
            ),
            if (data.priceDrop == true)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade700,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'PRICE DROP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          data.itemName,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }


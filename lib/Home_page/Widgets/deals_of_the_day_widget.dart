import 'package:easemydeal_task/Home_page/Model/deals_of_the_day_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dealOfTheDayWidget(BuildContext context,DealOfTheDayModel data){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        SizedBox(width:120,child: Image.asset(data.productUrl)),
        SizedBox(width:190,child: Text(data.productName,style: TextStyle(fontSize: 18,color: Colors.black),overflow: TextOverflow.ellipsis,)),
        SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.yellow.shade600,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
          ),
          child: RichText(
            text:  TextSpan(
              children: [
                TextSpan(
                  text: "-${data.discount}%",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const TextSpan(
                  text: " off  ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "₹ ${data.totalProce}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
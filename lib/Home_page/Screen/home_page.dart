import 'package:easemydeal_task/Home_page/Model/buy_container_model.dart';
import 'package:easemydeal_task/Home_page/Model/deals_of_the_day_Model.dart';
import 'package:easemydeal_task/Home_page/Model/discount_model.dart';
import 'package:easemydeal_task/Home_page/Model/offers_coupon.dart';
import 'package:easemydeal_task/Home_page/Widgets/buy_container_widget.dart';
import 'package:easemydeal_task/Home_page/Widgets/deals_of_the_day_widget.dart';
import 'package:easemydeal_task/Home_page/Widgets/offers_coupon.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Model/item_model.dart';
import '../Widgets/app_bar.dart';
import '../Widgets/discount_widget.dart';
import '../Widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final newPage = (_scrollController.offset / 250).round();
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });
  }


  final List<DiscountModel> adData = [
    DiscountModel(
        imageUrl: "assets/images/loveseat.png",
        discount: 'Flat 15% OFF',
        title: 'Furniture Utsav',
        features: 'Free 72hrs Delivery \n300+ DesignsFree Installation'),
    DiscountModel(
        imageUrl: 'assets/images/dining-table.png',
        discount: 'Up to 50% OFF',
        title: 'Diwali Sale',
        features: 'Limited Period \nOfferBest Prices Guaranteed'),
    DiscountModel(
        imageUrl: 'assets/images/living-room.png',
        discount: 'Flat 15% OFF',
        title: 'Furniture Utsav',
        features: 'Free 72hrs Delivery\n 300+ DesignsFree Installation'),
    // Add more ad data here
  ];

  final List<ItemModel> items = [
    ItemModel(
      itemName: 'Living Room',
      imageUrl: 'assets/images/living-room.png',
      priceDrop: false,
    ),
    ItemModel(
      itemName: 'Bedroom',
      imageUrl: 'assets/images/bedroom.png',
      priceDrop: true,
    ),
    ItemModel(
      itemName: 'Storage',
      imageUrl: 'assets/images/almira.png',
      priceDrop: true,
    ),
    ItemModel(
      itemName: 'Study',
      imageUrl: 'assets/images/table.png',
      priceDrop: false,
    ),
    ItemModel(
      itemName: 'Dinner',
      imageUrl: 'assets/images/dining-table.png',
    ),
    ItemModel(
      itemName: 'Tables',
      imageUrl: 'assets/images/office-table.png',
      priceDrop: true,
    ),
    ItemModel(
      itemName: 'Chair',
      imageUrl: 'assets/images/office-chair.png',
      priceDrop: false,
    ),
    ItemModel(
      itemName: 'Z Rated',
      imageUrl: 'assets/images/living-room.png',
    ),
  ];

  final List<OfferModel>offerItem = [
    OfferModel(bankName: "SBI", offerAmount: "15%", description: "Applicable on SBI Credit card...", additionalInfo: 'No code required', backgroundColor:const Color(0xFFFFDE4D), onTap: (){}, bankIcon: "assets/images/credit-cards.png"),
    OfferModel(bankName: "SBI", offerAmount: "15%", description: "Applicable on SBI Credit card...", additionalInfo: 'No code required', backgroundColor:const Color(0xFFFFDE4D), onTap: (){}, bankIcon: "assets/images/15-percent.png")
  ];

  final List<DealOfTheDayModel>dealsOfDay = [
    DealOfTheDayModel(discount: "72", productName: "Flex 3 Seater Magic Bag ", productUrl: "assets/images/sofa.png", totalProce: "10,499"),
    DealOfTheDayModel(discount: "74", productName: "Flex 3 Seater Magic Bag", productUrl: "assets/images/loveseat.png", totalProce: "9,449"),
    DealOfTheDayModel(discount: "72", productName: "Flex 3 Seater Magic Bag ", productUrl: "assets/images/sofa.png", totalProce: "10,499"),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return Scaffold(
      //appBar: CustomSearchBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CustomSearchBar(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  width: wi * 0.95,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: adData.length,
                    itemBuilder: (context, index) {
                      return discountWidget(context, adData[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SmoothPageIndicator(
                    controller: PageController(initialPage: _currentPage.round()),  // Attach ScrollController
                    count: adData.length,
                    effect: const ScrollingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      dotHeight: 12,
                      dotWidth: 12,
                      spacing: 8,
                    ),
                    onDotClicked: (index) {
                      // Animate scroll to the clicked dot
                      _scrollController.animateTo(
                        index * 200, // 200 is the item width
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "BY FURNITURE",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  width: wi * 0.95,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(5),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return itemWidget(context, items[index]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                itemWidget(
                    context, ItemModel(itemName: "Best Deals", imageUrl: 'assets/images/bestDeals.png')),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buyContainerWidget(
                          context,
                          BuyContainerModel(
                              title: 'Brand New',
                              subtitle: 'Buy',
                              iconPath: "assets/images/add-item.png",
                              gradientEndColor: Colors.blueAccent,
                              gradientStartColor: Colors.blue,
                              onTap: () {})),
                      buyContainerWidget(
                          context,
                          BuyContainerModel(
                              title: 'Refurbished',
                              subtitle: 'Buy',
                              iconPath: "assets/images/recyclable.png",
                              gradientEndColor: Colors.teal,
                              gradientStartColor: Colors.lightBlueAccent,
                              onTap: () {})),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Offers & Discounts",
                      style: TextStyle(fontSize: 24, color: Colors.grey),
                    ),
                    TextButton(
                        onPressed:(){}, 
                        child: const Row(
                          children: [
                              Text("See All"),
                            Icon(Icons.arrow_right_alt_outlined)
                          ],
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  width: wi*0.95,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: offerItem.length,
                    itemBuilder: (context,index){
                      return offerWidget(context, offerItem[index]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                          child: const Center(
                              child: Icon(Icons.percent,color: Colors.black,size: 35,)
                          ),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Deals of the day",
                              style: TextStyle(fontSize: 24, color: Colors.grey),
                            ),
                            Text(
                              " To buy",
                              style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed:(){},
                        child: const Row(
                          children: [
                            Text("See All"),
                            Icon(Icons.arrow_right_alt_outlined)
                          ],
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  width: wi*0.95,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dealsOfDay.length,
                    itemBuilder: (context,index){
                      return dealOfTheDayWidget(context, dealsOfDay[index]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

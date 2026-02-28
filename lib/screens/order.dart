import 'package:flutter/material.dart';
import 'package:launtryapp/screens/splashscreen.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int selectedDelivery = 0;

  Widget buildBasketItem(String name, String price) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(price, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget buildDeliveryOption(String title, String price, int index) {
    bool isSelected = selectedDelivery == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDelivery = index;
        });
      },
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFE6F6F3) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Color(0xFF24C2B0) : Colors.black12,
          ),
        ),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(price, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget tipButton(String text, {bool isPopular = false}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black12),
          ),
          child: Text(text),
        ),
        if (isPopular)
          Positioned(
            top: -8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Color(0xFFE6F6F3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Popular",
                style: TextStyle(fontSize: 10, color: Color(0xFF24C2B0)),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Your Basket",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            buildBasketItem("Pant x 3", "₹59"),
            buildBasketItem("Shirt x 2", "₹59"),
            buildBasketItem("Shirt x 2", "₹59"),
            buildBasketItem("Shirt x 2", "₹59"),

            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "When do you need your Delivery?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 12),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDeliveryOption("3 Days", "(Free)", 0),
                  buildDeliveryOption("2 Days", "(+₹50)", 1),
                  buildDeliveryOption("1 Day", "(+₹70)", 2),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFFE6F6F3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Coupons and offers"),
                  Text("4 offers", style: TextStyle(color: Color(0xFF24C2B0))),
                ],
              ),
            ),

            SizedBox(height: 24),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Payment Summary",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Items Total"), Text("₹400")],
                  ),

                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Taxes and Fee"), Text("₹59")],
                  ),

                  Divider(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount to Pay",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24C2B0),
                        ),
                      ),
                      Text(
                        "₹459",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24C2B0),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Cancellation Policy',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Free cancellation if done more than 2 hrs before the service or delivery agent is arrived. A fee will be charged otherwise.',
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Read full policy',
                    style: TextStyle(
                      color: Color(0xFF24C2B0),
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Add a tip to the professional',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      tipButton("₹50"),
                      tipButton("₹70", isPopular: true),
                      tipButton("₹100"),
                      tipButton("Custom"),
                    ],
                  ),

                  SizedBox(height: 10),

                  Text(
                    '100% of the tip goes to the professional.',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),

            SizedBox(height: 100),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.home_outlined, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "P vemballur,Asmabi college road kodungallur,thrissur,india,ph no.4787965236',",
                    style: TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.more_vert, size: 20),
              ],
            ),

            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.access_time, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Mon - Sep 18 - 01:00 PM",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Icon(Icons.more_vert, size: 20),
              ],
            ),

            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                // Payment action
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccessPage(),
                    ),
                  );
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF24C2B0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Proceed to Pay",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.black12)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Text(price, style: const TextStyle(color: Colors.grey)),
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
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE6F6F3) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? const Color(0xFF24C2B0) : Colors.black12,
        ),
      ),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(price,
              style: const TextStyle(
                  fontSize: 12, color: Colors.grey)),
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
        padding:
        const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
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
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F6F3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Popular",
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF24C2B0),
              ),
            ),
          ),
        ),
    ],
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF7F7F7),

    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "Your Cart",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new,
            color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),

    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 16),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Your Basket",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 10),

          buildBasketItem("Pant x 3", "₹59"),
          buildBasketItem("Shirt x 2", "₹59"),
          buildBasketItem("Shirt x 2", "₹59"),
          buildBasketItem("Shirt x 2", "₹59"),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "When do you need your Delivery?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                buildDeliveryOption(
                    "3 Days", "(Free)", 0),
                buildDeliveryOption(
                    "2 Days", "(+₹50)", 1),
                buildDeliveryOption(
                    "1 Day", "(+₹70)", 2),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Container(
            margin:
            const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F6F3),
              borderRadius:
              BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: const [
                Text("Coupons and offers"),
                Text("4 offers",
                    style: TextStyle(
                        color: Color(0xFF24C2B0))),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Payment Summary",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Items Total"),
                    Text("₹400"),
                  ],
                ),

                const SizedBox(height: 8),

                const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Taxes and Fee"),
                    Text("₹59"),
                  ],
                ),

                const Divider(height: 24),

                const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
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

                const SizedBox(height: 25),

                const Text(
                  'Cancellation Policy',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Free cancellation if done more than 2 hrs before the service or delivery agent is arrived. A fee will be charged otherwise.',
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Read full policy',
                  style: TextStyle(
                    color: Color(0xFF24C2B0),
                    decoration:
                    TextDecoration.underline,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Add a tip to the professional',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    tipButton("₹50"),
                    tipButton("₹70",
                        isPopular: true),
                    tipButton("₹100"),
                    tipButton("Custom"),
                  ],
                ),

                const SizedBox(height: 10),

                const Text(
                  '100% of the tip goes to the professional.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    ),

    bottomNavigationBar: Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.home_outlined, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "P vemballur,Asmabi college road kodungallur,thrissur,india,ph no.4787965236',",
                  style: TextStyle(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.more_vert, size: 20),
            ],
          ),

           SizedBox(height: 30),
          Row(
            children: [
              const Icon(Icons.access_time, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "Mon - Sep 18 - 01:00 PM",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              const Icon(Icons.more_vert, size: 20),
            ],
          ),

           SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              // Payment action
            },
            child: GestureDetector(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentSuccessPage()),
                );
              },child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF24C2B0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Proceed to Pay",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    ),
  );
}}
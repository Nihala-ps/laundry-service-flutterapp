import 'package:flutter/material.dart';
import 'package:launtryapp/screens/order.dart';
import 'package:launtryapp/screens/splashscreen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
  void showAddressBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Saved Address",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),

              const SizedBox(height: 10),

              const Text(
                "+ Add another address",
                style: TextStyle(
                  color: Color(0xFF24C2B0),
                  fontWeight: FontWeight.w500,
                ),
              ),

               Divider(height: 30),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Radio Button
                    const Icon(Icons.radio_button_checked,
                        color: Colors.black),

                    const SizedBox(width: 10),

                    /// Address Details
                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Home",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Indeevaram Building, Koratty InfoPark, India",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Ph: +91 1234567891",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    const Icon(Icons.more_vert)
                  ],
                ),
              ),

               Spacer(),

              /// Proceed Button
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close address sheet
                showSlotBottomSheet(context); // Open slot sheet
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF24C2B0),
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Proceed to Check out",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )]
        )
        );
      },
    );
  }Widget dateBox(String day, String date, int index) {
    bool isSelected = selectedDateIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDateIndex = index;
        });
      },
      child: Container(
        width: 70,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF24C2B0) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black)),
            const SizedBox(height: 4),
            Text(date,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }Widget timeBox(String time, int index) {
    bool isSelected = selectedTimeIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE6F6F3) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF24C2B0)
                : Colors.black12,
          ),
        ),
        child: Text(time,
            style: TextStyle(
              fontSize: 12,
              color:
              isSelected ? const Color(0xFF24C2B0) : Colors.black,
            )),
      ),
    );
  }
  void showSlotBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "When should the Order Pick?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Dates
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    dateBox("Sun", "11", 0),
                    dateBox("Mon", "12", 1),
                    dateBox("Tue", "13", 2),
                    dateBox("Wed", "14", 3),
                    dateBox("Thu", "15", 4),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "When should the Order Pick?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              /// Time Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                childAspectRatio: 2.2,
                children: List.generate(
                timeSlots.length,
                    (index) => timeBox(timeSlots[index], index),
        ),
                ),
              ),

              /// Bottom Button
              GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Order()),
                  );
                },child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF24C2B0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Proceed to Check out",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),
            ],
          ),
        );
      },
    );
  }final List<String> timeSlots = [
    "08:00 AM","08:30 AM","09:00 AM","09:30 AM",
    "10:00 AM","10:30 AM","11:00 AM","11:30 AM",
    "12:00 PM","12:30 PM","01:00 PM","01:30 PM",
    "02:00 PM","02:30 PM","03:00 PM","03:30 PM",
    "04:00 PM","04:30 PM","05:00 PM","05:30 PM",
    "06:00 PM","06:30 PM","07:00 PM","07:30 PM",
  ];
  int selectedDateIndex = 0;
  int selectedTimeIndex = -1;

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

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            showAddressBottomSheet(context);
          },
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFF24C2B0),
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: const Text(
              "Add Address & Slot",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
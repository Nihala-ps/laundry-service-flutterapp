import 'package:flutter/material.dart';
import 'package:launtryapp/screens/cart.dart';
import 'package:launtryapp/screens/home.dart';

class Wash extends StatefulWidget {
  const Wash({super.key});

  @override
  State<Wash> createState() => _WashState();
}

class _WashState extends State<Wash> {
  Widget tabs(String title, bool isSelected) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        SizedBox(height: 4),
        Text('0 items', style: TextStyle(color: Colors.grey, fontSize: 10)),
        SizedBox(height: 6),
        Container(
          height: 2,
          width: 40,
          color: isSelected ? Color(0xFF24C2B0) : Colors.transparent,
        ),
      ],
    );
  }

  Widget items(String name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              SizedBox(height: 4),
              Text(
                '₹40/piece',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Container(
            height: 35,
            width: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Color(0xFF24C2B0)),
            ),
            child: Text('Add', style: TextStyle(color: Color(0xFF24C2B0))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Wash & Fold',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              tabs('Top', true),
              tabs('Bottoms', false),
              tabs('Undergarments', false),
              tabs('Formals', false),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                items('Shirt'),
                items('T-shirt'),
                items('Blouse'),
                items('Sweatshirt/Hoodie'),
                items('Vest/Tanktop'),
                items('Scarf / stole'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12)),
        ),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('10 items'),
                    Text(
                      'Total ₹400',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF24C2B0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Container(
                  width: 252,
                  height: 49,
                  decoration: BoxDecoration(
                    color: Color(0xFF24C2B0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Go to Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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

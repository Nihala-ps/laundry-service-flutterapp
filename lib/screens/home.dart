import 'package:flutter/material.dart';
import 'package:launtryapp/screens/wash.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  box(img, String) {
    return Container(
      height: 90,
      width: 85,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 22,
              backgroundColor: Colors.white,
            ),
          ),
          Text(String, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  int _SelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/Layer_1.png'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Hometown', style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            Text(
              'P vemballur,Asmabi college road kodungallur,thrissur,india,ph no.4787965236',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          Icon(Icons.shopping_cart),
          SizedBox(width: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text(
                'Hey Sam!',
                style: TextStyle(
                  color: Color(0xFF24C2B0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'What would you like to wash today?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Wash()),
                      );
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/Frame 7.png'),
                              radius: 22,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Text('Wash & Fold', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (1).png', 'Wash & iron'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (2).png', 'Dry Cleaning'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (3).png', 'Bed & Bath'),
                ],
              ),
              SizedBox(height: 25),
              Container(
                width: 361,
                height: 130,
                child: Image.asset('assets/Frame 23.png'),
              ),
              SizedBox(height: 25),
              Text(
                'Special Services',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  box('assets/Layer_1 (1).png', 'Stain'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (5).png', 'Handwash'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (6).png', 'Ironing'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (7).png', 'shoes'),
                  SizedBox(width: 3),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  box('assets/Frame 7 (8).png', 'Blankets'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (9).png', 'Home items'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (10).png', 'Ethnic wears'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (11).png', 'Bags'),
                  SizedBox(width: 3),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  box('assets/Frame 7 (12).png', 'Jackets'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (13).png', 'BabyWear'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (14).png', 'Eco-Friendly'),
                  SizedBox(width: 3),
                  box('assets/Frame 7 (15).png', 'Special Care'),
                  SizedBox(width: 3),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _SelectedIndex,
        onTap: (index) {
          setState(() {
            _SelectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF24C2B0),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: "Offers",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

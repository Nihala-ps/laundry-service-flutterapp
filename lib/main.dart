import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launtryapp/provider/provider.dart';
import 'package:launtryapp/screens/cart.dart';
import 'package:launtryapp/screens/home.dart';
import 'package:launtryapp/screens/order.dart';
import 'package:launtryapp/screens/splashscreen.dart';
import 'package:launtryapp/screens/wash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CartProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      color: Color(0xFFFFFFFF),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
    );
  }
}

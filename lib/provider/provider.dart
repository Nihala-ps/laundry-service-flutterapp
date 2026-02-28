import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  int selectedDelivery = 0;
  int selectedDateIndex = 0;
  int selectedTimeIndex = -1;
  String selectedAddress = "P vemballur,Asmabi college road kodungallur,thrissur,india,ph no.4787965236',";

  void setDelivery(int index) {
    selectedDelivery = index;
    notifyListeners();
  }

  void setDate(int index) {
    selectedDateIndex = index;
    notifyListeners();
  }

  void setTime(int index) {
    selectedTimeIndex = index;
    notifyListeners();
  }

  void setAddress(String address) {
    selectedAddress = address;
    notifyListeners();
  }
}
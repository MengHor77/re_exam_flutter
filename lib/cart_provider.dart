import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
 int counter =0;
 void addToCart (){
  counter ++;
  notifyListeners ();

 }
}
import 'package:flutter/material.dart';

import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier{
  // list of drinks for sale
    final List<Drink> _shop = [
        // pearl milk tea 
        Drink (Name:" pearl milk Tea ", 
        price : "180.00" , 
        imagePath:"lib/images/milk_tea.png",),
    ];

  // liist of drinks for user cart 

    final List<Drink> _userCart = [];

  // get drinks for sale 
    List<Drink> get shop => _shop;
  // get uset cart
    List<Drink> get cart => _userCart ;

  // add drink to the cart
   void addToCart(Drink drink){
    _userCart.add(drink);
    notifyListeners();

   }  
   // remove the drink from the cart
   void removeFromCart(Drink drink){
   _userCart.remove(drink);
   }

}
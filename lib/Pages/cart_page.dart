import 'package:flutter/material.dart';
import 'package:flutter_test_22/Models/drink.dart';
import 'package:flutter_test_22/Models/shop.dart';
import 'package:flutter_test_22/components/drink_tile.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

    // remove drink from cart 
    void removeFromCart(Drink drink ){
      Provider.of<BubbleTeaShop>(context, listen:false).removeFromCart(drink);
    }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(builder:(context,value,child) =>SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // heading 
            Text('your cart',
            style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10,),
        
            // list of your cart item 
            Expanded(
                child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index){
                    // get inndividual drink in cart first 
                    Drink drink = value.cart[index];

                    // return a nice tile
                    return DrinkTile(
                    drink: drink,
                    onTap: () => removeFromCart(drink), 
                    trailing: Icon(Icons.delete));
                  }
                ),  
              ),
              // pay button 
              MaterialButton(
                color: Colors.brown,
                onPressed: (){},
                child: Text('Pay', style: TextStyle(color: Colors.white), ),
              )
            ],
          ),
        ),
      ),
    );
  }   
}

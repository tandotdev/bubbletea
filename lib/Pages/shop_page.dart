import 'package:flutter/material.dart';
import 'package:flutter_test_22/Models/drink.dart';
import 'package:flutter_test_22/Models/shop.dart';
import 'package:flutter_test_22/Pages/order_page.dart';
import 'package:flutter_test_22/components/drink_tile.dart';
import 'package:provider/provider.dart';



class ShopPage extends StatefulWidget {
  const ShopPage({super.key});
 

   
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // user seected a drink , go to order page
   void goToOrderPage(Drink drink){
    // nevigate to order page
     Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => OrderPage( 
          drink: drink
          ),
          
      ),
     );
  }

  @override

  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value , child) => SafeArea(
      child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children:[
           // heading 
          Text(
            "Bubble Tea Shop",
          style : TextStyle(fontSize: 20),
          ),

          const SizedBox(height: 10,),

           // list of drinks for sale 
          Expanded(
            child: ListView.builder(
              itemCount: value.shop.length,
              itemBuilder: (context, index) {

                // get individual drink from shop
                Drink individualDrink = value.shop[index];

                // return that drink as a nice  tile 
                return DrinkTile(
                  drink: individualDrink,
                  onTap:() => goToOrderPage(individualDrink),
                  trailing: Icon(Icons.arrow_forward),
                  
                  );
              },
          ),
         )
        ],
       ),
      ),
     ), 
    );
  }
}
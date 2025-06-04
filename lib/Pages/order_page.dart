import 'package:flutter/material.dart';
import 'package:flutter_test_22/Models/shop.dart';
import 'package:provider/provider.dart';

import '../Models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink ;
  
  const OrderPage(
    {super.key, 
    required this.drink, 
    
    }
    );

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customise sweeness
  double sweetValue = 0.5;
  void customizeSweet(double newValue){
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0.5;
  void customizeIce(double newValue){
    setState(() {
      iceValue = newValue;
    });
  }
  double pearlValue = 0.5;
  void customizePearls(double newValue){
    setState(() {
      pearlValue = newValue;
    });
  }

   void AddtoCart(){
              Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

             // direct your user to the shop  page 
             Navigator.pop(context);

             // let the user know it has been successfully added 
             showDialog(context: context, builder: (context) => AlertDialog(
              title: Text('Successfully added to cart '),
             ));

            }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.Name)),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          // drink image 
            Image.asset(widget.drink.imagePath),
          // slider to costum drink 
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // sweetness slider 
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width:100,
                    child: Text('Sweet')),
                  Expanded(
                    child: Slider(
                      value: sweetValue,
                      label: sweetValue.toString(),
                      divisions: 4,
                      onChanged: (value) => customizeSweet(value), 
                    ),
                  )
                ],
               ),
             // ice slider 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Ice')),
                  Expanded(
                    child: Slider(
                      value: iceValue,
                      label: iceValue.toString(),
                      divisions: 4,
                      onChanged: (value) => customizeIce(value), 
                    ),
                  )
                ],
               ),
             // pearl slider 
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Pearls')),
                  Expanded(
                    child: Slider(
                      value: pearlValue,
                      label: pearlValue.toString(),
                      divisions: 4,
                      onChanged: (value) => customizePearls(value), 
                    ),
                  )
                ],
               ),
            // add to cart button 
             MaterialButton(
              color: Colors.brown,
              onPressed:(){} ,
              child: Text('Add to Cart',style: TextStyle(color: Colors.white),),
              )
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}
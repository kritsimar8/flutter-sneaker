import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/components/cart_item.dart';
import 'package:sneaker_store/models/cart.dart';
import 'package:sneaker_store/models/shoe.dart';

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  @override 
  Widget build(BuildContext context){
    return Consumer<Cart>(
      builder:(context,value,child)=>Padding(
        padding:const EdgeInsets.symmetric(horizontal:25.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const Text('My Cart',
            style:TextStyle(fontWeight:FontWeight.bold,fontSize:24),),

            const SizedBox(height:25),

            Expanded(
              child:ListView.builder(
                itemCount:value.getUserCart().length,
                  itemBuilder:(context,index){
                    
                    Shoe individualShoe= value.getUserCart()[index];

                    return CartItem(shoe:individualShoe);
              }
              ),
            
            )
            

          ]
        )
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/components/shoe_tile.dart';
import 'package:sneaker_store/models/cart.dart';
import 'package:sneaker_store/models/shoe.dart';

class ShopPage extends StatefulWidget{
  const ShopPage({super.key});

  @override
  State<ShopPage> createState()=> _ShopPageState();
}

class _ShopPageState extends State<ShopPage>{

  void addshoeToCart(Shoe shoe){
    Provider.of<Cart>(context,listen:false).addItemToCart(shoe);

    showDialog(
      context:context,
      builder:(context)=>AlertDialog(
        title:Text('Successfully added!'),
        content:Text('Check your cart'),
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return Consumer<Cart>(builder: (copntext,value,child)=> Column(
      children:[
        Container(
          padding:const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal:25),
          decoration:BoxDecoration(
            color: Colors.grey[200],
            borderRadius:BorderRadius.circular(8),
          ),
          child:Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:const[
              Text(
                'search',
                style:TextStyle(color:Colors.grey),
              ),
              Icon(
                Icons.search,
                color:Colors.grey,
              )
            ]
          )
        ),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal:25.0,vertical:20),
          child:Text(
            'Everyone flies.. some fly longer than others',
            style:TextStyle(color:Colors.grey[600]),
          )
        ),
        const Padding(
          padding:const EdgeInsets.symmetric(horizontal:20),
          child:Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Text(
                'Hot Picks 🔥',
                style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:24,
                )
              ),
              Text(
                'See All',
                style:TextStyle(fontWeight:FontWeight.bold,color:Colors.blue),
                
              )
            ]
          )
        ),
        const SizedBox(height:10),

        Expanded(
          child:Container(
            padding: const EdgeInsets.only(bottom:20.0),
             child: ListView.builder(
            itemCount:4,
            scrollDirection:Axis.horizontal,
            itemBuilder:(context,index){
             Shoe shoe = value.getShoeList()[index];
              return ShoeTile(
                shoe:shoe,
                onTap:()=> addshoeToCart(shoe),
              );
              
            }
          )
          )
         
        ),
        const Padding(
          padding:EdgeInsets.only(top:25.0,left:25,right:25),
          child:Divider(
            color:Colors.white,
          )
        )
      
      ],
    )
    );
  }
}
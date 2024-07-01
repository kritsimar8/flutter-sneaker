import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier{
  List<Shoe> shoeShop=[
    Shoe(
      name:'Zoom Freak',
      price: '36',
      description:'The forward-thinking design of his latest signature shoe',
      imagePath:'lib/images/nike-shoe5.png',
    ),
    Shoe(
      name:'KD Treys',
      price:'200',
      description:'You\'ve got the hops and the speed-lace up in shoes that ',
      imagePath:'lib/images/nike-shoe2.png'
    ),
    Shoe(
      name:'Kyrie 6',
      price:'190',
      description:'Bouncy cushioning is paired ',
      imagePath:'lib/images/nike-shoe3.png'
    ),
    Shoe(
      name:'Kyrie 6',
      price:'190',
      description:'Bouncy cushioning is paired ',
      imagePath:'lib/images/nike-shoe4.png'
    ),
  ];

  List<Shoe> userCart=[];

  List<Shoe> getShoeList(){
    return shoeShop;
  }
  List<Shoe> getUserCart(){
    return userCart;
  }
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}
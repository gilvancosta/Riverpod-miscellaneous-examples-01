import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = ChangeNotifierProvider<HomeController>((ref) => HomeController());

class HomeController with ChangeNotifier{

  int _counter = 0;

 
  int get counter => _counter;

  void increment(){
    _counter++;
    notifyListeners();
  }

  void decrement(){
    _counter--;
    notifyListeners();
  }
  
}
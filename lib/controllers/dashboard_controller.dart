import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_application/pages/Home_page.dart';
import 'package:todolist_application/pages/Profile_page.dart';
import 'package:todolist_application/pages/history_page.dart';

  final List <Widget> pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

class DashboardController extends GetxController{
  var selectedIndex = 0.obs;
  
  void changetabIndex(int index){
    selectedIndex.value = index;
  }


}
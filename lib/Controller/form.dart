import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:uis_the_apk/Controller/variable.dart';

class NextPage extends GetxController{
  static next(){
    Controller.controllerPage.nextPage(duration: Duration(milliseconds: 5), curve: Curves.bounceIn);
  }


  static previous(){
    Controller.controllerPage.previousPage(duration: Duration(milliseconds: 5), curve: Curves.bounceIn);
  }


}
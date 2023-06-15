
import 'package:get/get.dart';

class GetController extends GetxController{
  int select = 0;
  updateValue(value){
    select = value;
    update();
  }
}
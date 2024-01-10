
import 'package:apijsonproject/simple%20api/serviiii/service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController{
  RxBool isLoading = true.obs;  // loading is now observable
  var productList = [].obs;

  @override
  void onInit() {  // what should happen when the app is loaded
    loadProducts();
    super.onInit();
  }

  void loadProducts() async{
    try{
      isLoading(true);
      var product = await HttpService.fetchProducts(); // fetch the list of products from http class
      if(product != null){
        productList.value = product;   // now the list having the value and it is observable too
      }
    }finally{
      isLoading(false);
    }

  }
}
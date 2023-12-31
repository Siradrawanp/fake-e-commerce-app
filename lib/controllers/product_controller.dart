import 'package:get/state_manager.dart';

import '../model/product_model.dart';
import '../services/fakestore_api.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await FakeStoreAPI.fetchProducts();
      if (products != null) {
        productList.value = products;
        isError(false);
      } else {
        isError(true);
      }
    } 
    finally {
      isLoading(false);
    }
  }
}
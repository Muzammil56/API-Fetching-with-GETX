import 'package:get/state_manager.dart';
import 'package:api_fetching_with_getx/services/remote_service.dart';
import 'package:api_fetching_with_getx/model/products.dart';
class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Products>.empty().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
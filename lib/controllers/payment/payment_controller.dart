import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/core/api_service.dart';
import 'package:el_afrik_restaurant/core/show_snackbar.dart';
import 'package:el_afrik_restaurant/utils/api_endpoints/api_endpoints.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PaymentController extends GetxController{

  final storage = GetStorage();
  final ApiService apiService = Get.find<ApiService>();

  RxBool isCheckoutLoading = false.obs;

  //CHECKOUT - PICKUP/DELIVERY
checkOut({required String deliveryMethod}) async{

  if( isCheckoutLoading.value ){
    return;
  }
  isCheckoutLoading.value = true;

  print("${storage.read(emailKey)}");
  Map<String, dynamic> body = {
    "orderType": deliveryMethod,
    "pickupTime": DateTime.now().toUtc().toIso8601String(),
    "notes": "Will pick up around 2:70 PM",
    "customerEmail": "${storage.read(emailKey)}"
  };
  ApiResponse response = await apiService.networkRequest(
      method: "POST",
      isAuthRequired: true,
      endPoint: ApiEndpoints.checkout,
    body: body
  );

  isCheckoutLoading.value = false;
  if( response.statusCode == 200 ){
    print(response.data);
    final responseData = response.data['data'] ?? "";
    String url = responseData['url'] ?? "";
    String sessionId = responseData['sessionId'] ?? "";
    String orderNumber = responseData['orderNumber'] ?? "";
    String orderId = responseData['orderId'] ?? "";
    String orderType = responseData['orderType'] ?? "";
    double deliveryFee = (responseData['deliveryFee'] as num?)?.toDouble() ?? 0;
    int totalPoints = (responseData['totalPoints'] as num?)?.toInt() ?? 0;
    print(url);
    print(sessionId);
    print(orderNumber);
    print(orderId);
    print(orderType);
    print(deliveryFee);
    print(totalPoints);
  }else if( response.statusCode == 400 ){
    showSnackBar(
        title: "Cart empty!",
        message: "Your cart is empty. Add items to cart first.",
        backgroundColor: AppColors.warningYellow
    );
  }
}
}
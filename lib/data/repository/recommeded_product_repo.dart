import 'package:get/get.dart';

import '../../utils/app_constant.dart';
import '../api/api_client.dart';

class RecommendedProductRepo extends GetxService{
  late final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}
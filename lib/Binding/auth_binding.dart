import 'package:bdo_pannel/controllers/userController.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<UserController>(UserController());
    // Get.put<ClientController>(ClientController());
    //Get.put<ConfirmClientsController>(ConfirmClientsController());
  }
}

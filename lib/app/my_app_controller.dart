import 'package:games/core/enums/connectivityStatus.dart';
import 'package:games/ui/shared/utils.dart';
import 'package:get/get.dart';

class MyAppController extends GetxController {
  @override
  void onInit() async {
    // checkConnection();
    super.onInit();
  }

  void checkConnection() async {
    // ConnectivityStatus status = connectivitySerivce.getStatus(
    //     (await connectivity.checkConnectivity()) as ConnectivityResult);

    // connectivitySerivce.connectivityStatusController.add(status);
    // isOnline = online.value = status == ConnectivityStatus.ONLINE;

    // connectivitySerivce.connectivityStatusController.stream.listen((event) {
    //   isOnline = online.value = event == ConnectivityStatus.ONLINE;
    // });
  }
}

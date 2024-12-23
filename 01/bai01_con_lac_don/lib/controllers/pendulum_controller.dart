import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

class PendulumController extends GetxController {
  RxDouble angle = 0.7.obs;
  double angularVelocity = 0.0;
  double angularAcceleration = 0.0;
  final double wireLength = 220.0;
  final double gravity = 9.8;

  RxDouble x = 0.0.obs;
  RxDouble y = 0.0.obs;
  Timer? timer;

  void updatePendulum(double deltaTime) {
    angularAcceleration = (-gravity / wireLength) * sin(angle.value);
    angularVelocity += angularAcceleration * deltaTime;
    angle.value += angularVelocity * deltaTime;

    x.value = wireLength * sin(angle.value);
    y.value = wireLength * cos(angle.value);
  }

  void startPendulum() {
    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      updatePendulum(0.016);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startPendulum();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    timer?.cancel();
  }
}

import 'package:bai01_con_lac_don/controllers/pendulum_controller.dart';
import 'package:bai01_con_lac_don/painters/pendulum_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pendulum extends StatefulWidget {
  const Pendulum({super.key});

  @override
  State<Pendulum> createState() => _PendulumState();
}

class _PendulumState extends State<Pendulum> {
  final PendulumController controller = Get.put(PendulumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mô phỏng con lắc đơn',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Obx(() {
          return CustomPaint(
            painter: PendulumPainter(controller.x.value, controller.y.value,
                controller.wireLength, controller.angle.value),
            child: Container(
              height: 350,
            ),
          );
        }),
      ),
    );
  }
}

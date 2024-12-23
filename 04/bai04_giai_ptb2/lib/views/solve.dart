import 'package:bai04_giai_ptb2/controllers/quadratic_solver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Solve extends StatelessWidget {
  Solve({super.key});

  final QuadraticSolverController controller =
      Get.put(QuadraticSolverController());
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController cController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void solveQuadratic() {
    double a = double.tryParse(aController.text) ?? 0.0;
    double b = double.tryParse(bController.text) ?? 0.0;
    double c = double.tryParse(cController.text) ?? 0.0;

    controller.solve(a, b, c);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Giải Phương Trình Bậc Hai',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nhập hệ số của phương trình bậc hai:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                buildInputField(label: 'Hệ số a', controller: aController),
                const SizedBox(height: 16),
                buildInputField(label: 'Hệ số b', controller: bController),
                const SizedBox(height: 16),
                buildInputField(label: 'Hệ số c', controller: cController),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        solveQuadratic();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      'Giải phương trình',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Obx(
                  () => Center(
                    child: Text(
                      controller.result.value,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildInputField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: 'Nhập $label',
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập $label';
            }
            if (double.tryParse(value) == null) {
              return 'Vui lòng nhập một số hợp lệ';
            }
            return null;
          },
        ),
      ],
    );
  }
}

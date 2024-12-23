import 'package:bai02_memory_face/controllers/memory_face_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemoryFace extends StatefulWidget {
  const MemoryFace({super.key});

  @override
  State<MemoryFace> createState() => _MemoryFaceState();
}

class _MemoryFaceState extends State<MemoryFace> {
  final MemoryFaceController controller = Get.put(MemoryFaceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Memory Faces',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => GridView.builder(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                itemCount: controller.faceModels.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final face = controller.faceModels[index];
                  return GestureDetector(
                    onTap: () => controller.selectImage(face),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: face.isOpen
                          ? ClipOval(
                              child: Image.asset(
                                face.imagePath,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                    ),
                  );
                },
              )),
          const SizedBox(height: 10,),
          Obx(() {
            if (controller.isGameCompleted()) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent
                ),
                  onPressed: controller.resetGame,
                  child: const Text(
                    'Restart',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ));
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }
}

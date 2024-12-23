import 'dart:async';

import 'package:bai02_memory_face/config/Image/image_app.dart';
import 'package:bai02_memory_face/models/face_model.dart';
import 'package:get/get.dart';

class MemoryFaceController extends GetxController{
  RxList<FaceModel> faceModels=<FaceModel>[].obs;
  Rx<FaceModel?> selectedFace = Rx<FaceModel?>(null);
  RxInt countCardOpen = 0.obs;

  void initGame(){
    faceModels.value=[
      FaceModel(imagePath: ImageApp.human1),
      FaceModel(imagePath: ImageApp.human1),
      FaceModel(imagePath: ImageApp.human2),
      FaceModel(imagePath: ImageApp.human2),
      FaceModel(imagePath: ImageApp.human3),
      FaceModel(imagePath: ImageApp.human3),
      FaceModel(imagePath: ImageApp.human4),
      FaceModel(imagePath: ImageApp.human4),
      FaceModel(imagePath: ImageApp.human5),
      FaceModel(imagePath: ImageApp.human5),
      FaceModel(imagePath: ImageApp.human6),
      FaceModel(imagePath: ImageApp.human6),
    ]..shuffle();
    selectedFace.value=null;
    countCardOpen.value=0;
  }

  void resetGame(){
    initGame();
  }

  bool isGameCompleted(){
    return faceModels.every((face) => face.isOpen);
  }

  void selectImage(FaceModel face){
    if(face.isOpen || countCardOpen.value >= 2) return;

    face.isOpen = true;
    countCardOpen.value++;
    faceModels.refresh();

    if(selectedFace.value == null) {
      selectedFace.value = face;
    }else{
      if(selectedFace.value?.imagePath == face.imagePath){
        selectedFace.value = null;
        countCardOpen.value = 0;
      }else{
        Timer(const Duration(seconds: 1), () {
          face.isOpen = false;
          selectedFace.value?.isOpen = false;
          selectedFace.value = null;
          countCardOpen.value = 0;
          faceModels.refresh();
        });
      }
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initGame();
  }
}
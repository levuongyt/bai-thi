import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:bai03_play_audio/models/book_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BookController extends GetxController{
  Rxn<BookModel> book=Rxn<BookModel>();
  RxInt currentIndex=(-1).obs;
  final AudioPlayer audioPlayer=AudioPlayer();
  Timer? timer;

  Future<void> loadData() async{
    final String response= await rootBundle.loadString('assets/output.json');
    final data = json.decode(response);
    book.value=BookModel.fromJson(data);
  }
   void startReading()async{
    final bookData=book.value;
    if(bookData == null) {
      return ;
    }

    await audioPlayer.play(AssetSource('output.wav'));
    timer = Timer.periodic(const Duration(milliseconds: 1), (timer) async{
      final currentPosition = await audioPlayer.getCurrentPosition();
      final currentTime = currentPosition?.inMilliseconds ?? 0;

      for (var i = 0; i < bookData.timestamps.length; i++) {
        var timestamp = bookData.timestamps[i];
        if (currentTime >= timestamp.timeElapsed &&
            currentTime < timestamp.timeElapsed + timestamp.wordDuration) {
          currentIndex.value = i;
          break;
        }
      }
    });
   }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    audioPlayer.dispose();
    timer?.cancel();
  }
}
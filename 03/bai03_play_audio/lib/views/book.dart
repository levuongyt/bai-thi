import 'package:bai03_play_audio/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookReader extends StatefulWidget {
  const BookReader({super.key});

  @override
  State<BookReader> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  final BookController controller = Get.put(BookController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Highlight',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.book.value == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    children: [_buildTextSpans()],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: controller.startReading,
              child: const Text(
                'Play',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      }),
    );
  }

  TextSpan _buildTextSpans() {
    final book = controller.book.value;
    final spans = <TextSpan>[];

    if (book == null) return TextSpan(children: spans);

    int textIndex = 0;
    for (int i = 0; i < book.timestamps.length; i++) {
      var timestamp = book.timestamps[i];
      String word = book.text.substring(
          timestamp.wordIndex, timestamp.wordIndex + timestamp.wordLength);
      if (textIndex < timestamp.wordIndex) {
        spans.add(TextSpan(
            text: book.text.substring(textIndex, timestamp.wordIndex)));
      }
      spans.add(
        TextSpan(
          text: word,
          style: TextStyle(
            backgroundColor: controller.currentIndex.value == i
                ? Colors.yellow
                : Colors.transparent,
          ),
        ),
      );
      textIndex = timestamp.wordIndex + timestamp.wordLength;
    }
    return TextSpan(
        children: spans,
        style: const TextStyle(color: Colors.black, fontSize: 18));
  }
}

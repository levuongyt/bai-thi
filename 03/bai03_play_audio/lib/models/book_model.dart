class BookModel{
  final String text;
  final List<Timestamp> timestamps;

  BookModel({required this.text, required this.timestamps});
  factory BookModel.fromJson(Map<String, dynamic> json) {
    var timestampJson = json['timestamp'] as List;
    List<Timestamp> timestamps = timestampJson.map((e) => Timestamp.fromJson(e)).toList();
    return BookModel(
      text: json['text'],
      timestamps: timestamps,
    );
  }
}
class Timestamp {
  final int timeElapsed;
  final int wordDuration;
  final int wordIndex;
  final int wordLength;

  Timestamp({
    required this.timeElapsed,
    required this.wordDuration,
    required this.wordIndex,
    required this.wordLength,
  });

  factory Timestamp.fromJson(List<dynamic> json) {
    return Timestamp(
      timeElapsed: json[0],
      wordDuration: json[1],
      wordIndex: json[2],
      wordLength: json[3],
    );
  }
}
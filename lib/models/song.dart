class Song {
  final String title;
  final String lyrics;
  final String chords;

  Song({
    required this.title,
    required this.lyrics,
    required this.chords,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'],
      lyrics: json['lyrics'],
      chords: json['chords'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'lyrics': lyrics,
      'chords': chords,
    };
  }
}

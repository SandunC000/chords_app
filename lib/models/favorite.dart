class Favorite {
  final String songTitle;
  final String artistName;
  final String lyrics;
  final String chords;

  Favorite({
    required this.songTitle,
    required this.artistName,
    required this.chords,
    required this.lyrics,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      songTitle: json['songTitle'],
      artistName: json['artistName'],
      lyrics: json['lyrics'],
      chords: json['chords'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'songTitle': songTitle,
      'artistName': artistName,
      'lyrics': lyrics,
      'chords': chords,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Favorite &&
          runtimeType == other.runtimeType &&
          songTitle == other.songTitle &&
          artistName == other.artistName &&
          chords == other.chords &&
          lyrics == other.lyrics;

  @override
  int get hashCode =>
      songTitle.hashCode ^
      artistName.hashCode ^
      chords.hashCode ^
      lyrics.hashCode;
}

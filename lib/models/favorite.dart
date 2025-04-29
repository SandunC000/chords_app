class Favorite {
  final String songTitle;
  final String artistName;
  final String lyrics;
  final String chords;

  Favorite(
      {required this.songTitle,
      required this.artistName,
      required this.chords,
      required this.lyrics});

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

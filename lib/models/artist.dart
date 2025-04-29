class Artist {
  final String name;
  final String imageUrl;
  final List<Song> songs;

  Artist({required this.name, required this.imageUrl, required this.songs});
}

class Song {
  final String title;
  final String chords;

  Song({required this.title, required this.chords});
}

import 'package:guitar_codes_app/models/song.dart';

class Artist {
  final String name;
  final String imageUrl;
  final List<Song> songs;

  Artist({
    required this.name,
    required this.imageUrl,
    required this.songs,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'],
      imageUrl: json['imageUrl'],
      songs: (json['songs'] as List)
          .map((songJson) => Song.fromJson(songJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'songs': songs.map((song) => song.toJson()).toList(),
    };
  }
}

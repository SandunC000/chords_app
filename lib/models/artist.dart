import 'package:guitar_codes_app/models/song.dart';

class Artist {
  final String name;
  final String imageUrl;
  final List<Song> songs;

  Artist({required this.name, required this.imageUrl, required this.songs});
}

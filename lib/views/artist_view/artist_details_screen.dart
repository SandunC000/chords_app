import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/artist.dart';
import 'package:guitar_codes_app/views/song_view/song_detail_view.dart';

class ArtistDetailsScreen extends StatelessWidget {
  final Artist artist;

  const ArtistDetailsScreen({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: artist.songs.length,
        itemBuilder: (context, index) {
          final song = artist.songs[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.music_note),
              title: Text(song.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SongDetailsScreen(
                            song: song,
                            artistName: artist.name,
                          )),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

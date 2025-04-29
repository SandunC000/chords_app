import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/artist.dart';
import 'package:guitar_codes_app/services/favorites_service.dart';
import 'package:guitar_codes_app/views/song_view/song_detail_view.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesService = Provider.of<FavoritesService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: favoritesService.favorites.length,
        itemBuilder: (context, index) {
          final favorite = favoritesService.favorites[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(favorite.songTitle),
              subtitle: Text(favorite.artistName),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongDetailsScreen(
                      song: Song(
                          title: favorite.songTitle, chords: favorite.chords),
                      artistName: favorite.artistName,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

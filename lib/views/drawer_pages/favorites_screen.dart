import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/song.dart';
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
      body: favoritesService.favorites.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet! \n Add some songs to your favorites.',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
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
                                title: favorite.songTitle,
                                chords: favorite.chords,
                                lyrics: favorite.lyrics),
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

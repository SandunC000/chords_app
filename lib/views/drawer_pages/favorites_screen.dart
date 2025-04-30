import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/song.dart';
import 'package:guitar_codes_app/services/favorites_service.dart';
import 'package:guitar_codes_app/utilities/primary_search_bar.dart';
import 'package:guitar_codes_app/views/song_view/song_detail_view.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final favoritesService = Provider.of<FavoritesService>(context);
    final filteredFavorites = favoritesService.favorites.where((favorite) {
      return favorite.songTitle
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          favorite.artistName
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimarySearchBar(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: favoritesService.favorites.isEmpty
                ? const Center(
                    child: Text(
                      'No favorites yet! \n Add some songs to your favorites.',
                      textAlign: TextAlign.center,
                    ),
                  )
                : filteredFavorites.isEmpty
                    ? const Center(
                        child: Text(
                          'No favorites found!',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: filteredFavorites.length,
                        itemBuilder: (context, index) {
                          final favorite = filteredFavorites[index];
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
          ),
        ],
      ),
    );
  }
}

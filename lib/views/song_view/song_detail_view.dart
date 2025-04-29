import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/artist.dart';
import 'package:guitar_codes_app/models/favorite.dart';
import 'package:guitar_codes_app/services/favorites_service.dart';
import 'package:provider/provider.dart';

class SongDetailsScreen extends StatefulWidget {
  final Song song;
  final String artistName;

  const SongDetailsScreen(
      {super.key, required this.song, required this.artistName});

  @override
  State<SongDetailsScreen> createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {
  late Favorite _favorite;

  @override
  void initState() {
    super.initState();
    _favorite = Favorite(
      songTitle: widget.song.title,
      artistName: widget.artistName,
      chords: widget.song.chords,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
        actions: [
          Consumer<FavoritesService>(
              builder: (context, favoritesService, child) {
            return IconButton(
              icon: Icon(
                favoritesService.isFavorite(_favorite)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              onPressed: () {
                if (favoritesService.isFavorite(_favorite)) {
                  favoritesService.removeFavorite(_favorite);
                } else {
                  favoritesService.addFavorite(_favorite);
                }
              },
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.song.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Chords: ${widget.song.chords}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            // Add lyrics or additional information here if needed
            // Text(
            //   'Lyrics: ...',
            //   style: const TextStyle(
            //     fontSize: 16,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

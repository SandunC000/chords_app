import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/favorite.dart';
import 'package:guitar_codes_app/models/song.dart';
import 'package:guitar_codes_app/services/auth_service.dart';
import 'package:guitar_codes_app/services/favorites_service.dart';
import 'package:guitar_codes_app/services/settings_service.dart';
import 'package:guitar_codes_app/utilities/functions.dart';
import 'package:guitar_codes_app/utilities/song_lyrics_chords_widget.dart';
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
  int _transposeValue = 0;

  @override
  void initState() {
    super.initState();
    _favorite = Favorite(
      songTitle: widget.song.title,
      artistName: widget.artistName,
      chords: widget.song.chords,
      lyrics: widget.song.lyrics,
    );
  }

  void _transpose(int value) {
    setState(() {
      _transposeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final settingsService = Provider.of<SettingsService>(context);
    final transposedChords =
        transposeChords(widget.song.chords, _transposeValue);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
        actions: [
          if (!authService.isGuest)
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_downward),
                            onPressed: () => _transpose(_transposeValue - 1),
                          ),
                          const SizedBox(width: 8),
                          Text('Transpose: $_transposeValue'),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.arrow_upward),
                            onPressed: () => _transpose(_transposeValue + 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.text_decrease),
                            onPressed: () {
                              settingsService
                                  .setFontSize(settingsService.fontSize - 2);
                            },
                          ),
                          const SizedBox(width: 8),
                          Text('Font Size: ${settingsService.fontSize}'),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.text_increase),
                            onPressed: () {
                              settingsService
                                  .setFontSize(settingsService.fontSize + 2);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SongLyricsChordsWidget(
                lyrics: widget.song.lyrics,
                chords: transposedChords,
                fontSize: settingsService.fontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

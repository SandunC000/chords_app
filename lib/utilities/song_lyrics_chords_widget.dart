import 'package:flutter/material.dart';

class SongLyricsChordsWidget extends StatelessWidget {
  final String lyrics;
  final String chords;

  const SongLyricsChordsWidget(
      {super.key, required this.lyrics, required this.chords});

  @override
  Widget build(BuildContext context) {
    final lyricsLines = lyrics.split('\n');
    final chordsLines = chords.split('\n');

    final paddedChordsLines = List.generate(
      lyricsLines.length,
      (index) => chordsLines.length > index ? chordsLines[index] : '',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        lyricsLines.length * 2,
        (index) {
          if (index.isEven) {
            // Display chords line
            return Text(
              paddedChordsLines[index ~/ 2],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              textAlign: TextAlign.center,
            );
          } else {
            // Display lyrics line
            return Text(
              lyricsLines[index ~/ 2],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            );
          }
        },
      ),
    );
  }
}

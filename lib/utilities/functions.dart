import 'dart:ui';

String transposeChords(String chords, int semitones) {
  final chordMap = {
    'C': ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'],
    'C#': ['C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B', 'C'],
    'D': ['D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B', 'C', 'C#'],
    'D#': ['D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B', 'C', 'C#', 'D'],
    'E': ['E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B', 'C', 'C#', 'D', 'D#'],
    'F': ['F', 'F#', 'G', 'G#', 'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E'],
    'F#': ['F#', 'G', 'G#', 'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F'],
    'G': ['G', 'G#', 'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#'],
    'G#': ['G#', 'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G'],
    'A': ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'],
    'A#': ['A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A'],
    'B': ['B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#'],
  };

  return chords.split('\n').map((line) {
    return line.split(' ').map((chord) {
      if (chord.isEmpty) return '';
      final root = chord[0];
      final quality = chord.substring(1);
      final newRoot = chordMap[root] != null
          ? chordMap[root]![((chordMap[root]!.indexOf(root) + semitones) % 12)]
          : root;
      return '$newRoot$quality';
    }).join(' ');
  }).join('\n');
}

class AppColors {
  // Shared primary color (green-based, soft)
  static const primary = Color(0xFF4CAF50);
  static const primaryDark = Color(0xFF81C784);

  // Light theme
  static const lightBackground = Color(0xFFF9FAFB);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightPrimaryText = Color(0xFF1F2937);
  static const lightSecondaryText = Color(0xFF6B7280);

  // Dark theme
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkPrimaryText = Color(0xFFF9FAFB);
  static const darkSecondaryText = Color(0xFF9CA3AF);

  static const appBarColor = Color(0xFF2F855A);
}

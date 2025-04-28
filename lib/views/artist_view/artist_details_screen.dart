import 'package:flutter/material.dart';

class ArtistDetailsScreen extends StatelessWidget {
  final String singerName;

  const ArtistDetailsScreen({super.key, required this.singerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(singerName),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 10, // Example 10 songs
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.music_note),
              title: Text('Song Title ${index + 1}'),
              onTap: () {
                // Navigate to Song Details Page
              },
            ),
          );
        },
      ),
    );
  }
}

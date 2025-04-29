import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/artist.dart';
import 'package:guitar_codes_app/views/artist_view/artist_details_screen.dart';
import 'package:guitar_codes_app/views/favorites_view/favorites_screen.dart';
import 'package:guitar_codes_app/views/song_view/song_detail_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isGridView = true;
  String _searchQuery = '';

  List<Artist> sampleArtists = [
    Artist(
      name: 'Artist 1',
      imageUrl: 'assets/singer_placeholder.png',
      songs: [
        Song(title: 'Song 1', chords: 'C G Am F'),
        Song(title: 'Song 2', chords: 'D A Bm G'),
      ],
    ),
    Artist(
      name: 'Artist 2',
      imageUrl: 'assets/singer_placeholder.png',
      songs: [
        Song(title: 'Song 3', chords: 'E B C#m A'),
        Song(title: 'Song 4', chords: 'F C G Am'),
      ],
    ),
    // Add more artists as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isGridView ? 'Artists' : 'Songs'),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
          ),
          Expanded(
            child: _isGridView ? _buildGridView() : _buildListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return SafeArea(
      top: true,
      bottom: true,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).colorScheme.inverseSurface
                    : Theme.of(context).colorScheme.surface,
              ),
              child: const Center(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/app_logo.png'),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Rate Us'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3x3 grid
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: sampleArtists.length,
      itemBuilder: (context, index) {
        final artist = sampleArtists[index];

        if (_searchQuery.isNotEmpty &&
            !artist.name.toLowerCase().contains(_searchQuery.toLowerCase())) {
          return const SizedBox.shrink();
        }

        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArtistDetailsScreen(
                artist: artist,
              ),
            ),
          ),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 30,
                //   backgroundImage: AssetImage(artist.imageUrl),
                // ),
                const SizedBox(height: 8),
                Text(artist.name),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: sampleArtists.expand((artist) => artist.songs).length,
      itemBuilder: (context, index) {
        final song =
            sampleArtists.expand((artist) => artist.songs).elementAt(index);
        final artist =
            sampleArtists.firstWhere((artist) => artist.songs.contains(song));

        if (_searchQuery.isNotEmpty &&
            !song.title.toLowerCase().contains(_searchQuery.toLowerCase())) {
          return const SizedBox.shrink();
        }

        return Card(
          child: ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(song.title),
            subtitle: Text(artist.name),
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
    );
  }
}

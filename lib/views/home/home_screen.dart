import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/artist.dart';
import 'package:guitar_codes_app/models/song.dart';
import 'package:guitar_codes_app/services/auth_service.dart';
import 'package:guitar_codes_app/views/artist_view/artist_details_screen.dart';
import 'package:guitar_codes_app/views/drawer_pages/contact_us_screen.dart';
import 'package:guitar_codes_app/views/drawer_pages/favorites_screen.dart';
import 'package:guitar_codes_app/views/drawer_pages/my_profile_screen.dart';
import 'package:guitar_codes_app/views/drawer_pages/rate_us_screen.dart';
import 'package:guitar_codes_app/views/drawer_pages/settings_screen.dart';
import 'package:guitar_codes_app/views/song_view/song_detail_view.dart';
import 'package:provider/provider.dart';

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
      name: 'Saman de Silva',
      imageUrl: 'assets/singer_placeholder.png',
      songs: [
        Song(
          title: 'Niyare Piya Nagala',
          lyrics: '''niyare.. piya  nagala
manike.. oba dura enawa
dakalaa.. wehesa niwee
sitha piruna..... ada senehasa danunaa''',
          chords: '''Em        D        Em
              D           Em
          Am             Em
                         C            D            Em''',
        ),
        Song(
          title: 'Song 2',
          lyrics: '''This is the first verse
With some lyrics here
This is the chorus
With some more lyrics''',
          chords: '''C G Am F
C G Am F
D A Bm G
D A Bm G''',
        ),
      ],
    ),
    Artist(
      name: 'Artist 2',
      imageUrl: 'assets/singer_placeholder.png',
      songs: [
        Song(
          title: 'Song 3',
          lyrics: '''This is the first verse
With some lyrics here
This is the chorus
With some more lyrics''',
          chords: '''C G Am F
C G Am F
D A Bm G
D A Bm G''',
        ),
        Song(
          title: 'Song 4',
          lyrics: '''This is the first verse
With some lyrics here
This is the chorus
With some more lyrics''',
          chords: '''C G Am F
C G Am F
D A Bm G
D A Bm G''',
        ),
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
    final authService = Provider.of<AuthService>(context);

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyProfileScreen()),
                );
              },
            ),
            if (!authService.isGuest)
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorites'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoritesScreen()),
                  );
                },
              ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Rate Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RateUsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContactUsScreen()),
                );
              },
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

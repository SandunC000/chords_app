import 'package:flutter/material.dart';
import 'package:guitar_codes_app/services/favorites_service.dart';
import 'package:guitar_codes_app/services/settings_service.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsService = Provider.of<SettingsService>(context);
    final favoritesService = Provider.of<FavoritesService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: settingsService.isDarkModeEnabled,
              onChanged: (value) {
                settingsService.toggleDarkMode(value);
              },
            ),
          ),
          ListTile(
            title: const Text('Font Size'),
            subtitle: Text('Font Size: ${settingsService.fontSize}'),
            onTap: () {
              _showFontSizeDialog(context, settingsService);
            },
          ),
          ListTile(
            title: const Text('Reset Favorites'),
            subtitle: const Text('Clear all favorites'),
            onTap: () {
              _showResetFavoritesDialog(context, favoritesService);
            },
          ),
        ],
      ),
    );
  }

  void _showFontSizeDialog(
      BuildContext context, SettingsService settingsService) {
    showDialog(
      context: context,
      builder: (context) {
        double selectedFontSize = settingsService.fontSize;
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Select Font Size'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(
                  title: const Text('Small'),
                  value: 14.0,
                  groupValue: selectedFontSize,
                  onChanged: (value) {
                    setState(() {
                      selectedFontSize = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Medium'),
                  value: 16.0,
                  groupValue: selectedFontSize,
                  onChanged: (value) {
                    setState(() {
                      selectedFontSize = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Large'),
                  value: 18.0,
                  groupValue: selectedFontSize,
                  onChanged: (value) {
                    setState(() {
                      selectedFontSize = value!;
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  settingsService.setFontSize(selectedFontSize);
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
      },
    );
  }

  void _showResetFavoritesDialog(
      BuildContext context, FavoritesService favoritesService) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reset Favorites'),
          content: const Text('Are you sure you want to clear all favorites?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                favoritesService.clearFavorites();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

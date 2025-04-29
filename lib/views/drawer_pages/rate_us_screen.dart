import 'package:flutter/material.dart';

class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  // Future<void> _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Us'),
      ),
      body: const Text(
        'We would love to hear your feedback!',
      ),

      // Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       _launchURL('https://play.google.com/store/apps/details?id=your.app.package');
      //     },
      //     child: const Text('Rate This App'),
      //   ),
      // ),
    );
  }
}

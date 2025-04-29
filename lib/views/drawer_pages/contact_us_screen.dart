import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  // Future<void> _sendEmail() async {
  //   final Uri emailLaunchUri = Uri(
  //     scheme: 'mailto',
  //     path: 'support@yourapp.com',
  //     queryParameters: {
  //       'subject': 'Support Request',
  //     },
  //   );

  //   if (await canLaunch(emailLaunchUri.toString())) {
  //     await launch(emailLaunchUri.toString());
  //   } else {
  //     throw 'Could not launch email';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Email: sanduncooray000@gmail.com'),
            const SizedBox(height: 16),
            ElevatedButton(
              // onPressed: _sendEmail,
              onPressed: () {},
              child: const Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}

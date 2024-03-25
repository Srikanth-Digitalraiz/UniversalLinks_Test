import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class DeepLinkHandlerWidget extends StatefulWidget {
  @override
  _DeepLinkHandlerWidgetState createState() => _DeepLinkHandlerWidgetState();
}

class _DeepLinkHandlerWidgetState extends State<DeepLinkHandlerWidget> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _initDeepLinkListener();
  }

  @override
  void dispose() {
    _sub!.cancel();
    super.dispose();
  }

  Future<void> _initDeepLinkListener() async {
    _sub = getLinksStream().listen((String? link) {
      _handleDeepLink(link);
    }, onError: (err) {
      print('Deep link error: $err');
    });
  }

  void _handleDeepLink(String? link) {
    if (link != null) {
      // Parse the deep link and extract relevant information if needed
      // In this case, you can directly navigate to the profile screen
      Navigator.of(context).pushNamed('/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Link Handler'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _generateAndShareDeepLink();
          },
          child: Text('Generate and Share Deep Link'),
        ),
      ),
    );
  }

  // Future<void> _generateAndShareDeepLink() async {
  //   // Replace 'myapp' with your app's scheme
  //   // String deepLink = 'mlqqq://profile';
  //   String deepLink = 'mlqqq://profile';

  //   // Share.share(deepLink);

  //   // // Share the deep link
  //   if (await canLaunch(deepLink)) {
  //     await launch(deepLink);
  //   } else {
  //     print('Could not launch $deepLink');
  //   }
  // }

  Future<void> _generateAndShareDeepLink() async {
    // Replace 'mlqqq' with your app's scheme
    String scheme = 'mlqqq';
    String host = 'com.srikanth.mlq'; // Your app's host
    String path = 'profile';

    String deepLink = '$scheme://$host/$path';

    print(deepLink);

    // Convert the deep link to a URI object
    Uri uri = Uri.parse(deepLink);

    // Format the deep link as a clickable URL
    String clickableLink = '<a href="$deepLink">Click here to open</a>';

    // Share the clickable link
    try {
      await Share.share(uri.toString());
    } catch (e) {
      print('Error sharing deep link: $e');
    }

    // if (await canLaunch(deepLink)) {
    //   await launch(deepLink);
    // } else {
    //   print('Could not launch $deepLink');
    // }
  }
}

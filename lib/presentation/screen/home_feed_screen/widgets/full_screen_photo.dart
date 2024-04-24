import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullScreenPhoto extends StatelessWidget {
  const FullScreenPhoto({super.key, required this.photoUrl});

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: SystemUiOverlay.values);

          Navigator.of(context).pop();
        },
        child: Center(
          child: Image.network(
            photoUrl,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }
}

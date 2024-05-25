import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io' show Platform;

class PlatformScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://gas-kvas.com/grafic/uploads/posts/2024-01/gas-kvas-com-p-znachok-vindovs-prozrachnii-fon-1.png',
    'https://static.tildacdn.com/tild6332-3533-4531-b561-386236373534/photo.jpg',
    'https://avatars.mds.yandex.net/i?id=747b34a4928b91f98bef57db38e7842f1091aafa-10743754-images-thumbs&n=13',
    'https://nerabotaet-internet.ru/wp-content/uploads/2023/07/ios-mac.png',
    'https://www.pngall.com/wp-content/uploads/4/MacOS-PNG.png',
  ];

  @override
  Widget build(BuildContext context) {
    String platform;
    int platformIndex;
    if (Platform.isAndroid) {
      platform = 'Android';
      platformIndex = 2;
    } else if (Platform.isIOS) {
      platform = 'iOS';
      platformIndex = 3;
    } else if (Platform.isLinux) {
      platform = 'Linux';
      platformIndex = 1;
    } else if (Platform.isMacOS) {
      platform = 'macOS';
      platformIndex = 4;
    } else if (Platform.isWindows) {
      platform = 'Windows';
      platformIndex = 0;
    } else {
      platform = 'неизвестная платформа';
      platformIndex = -1;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Экран платформы'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Приложение запущено на: $platform'),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrls[index],
                      placeholder: (context, url) => CircularProgressIndicator(),

                    ),
                    if (index == platformIndex)
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.check, color: Colors.green, size: 60),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PlatformScreen(),
  ));
}

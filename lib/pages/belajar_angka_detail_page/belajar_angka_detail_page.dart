import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/asset_path.dart';

class BelajarAngkaDetailPage extends StatelessWidget {
  const BelajarAngkaDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.bg),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    AssetPath.close,
                    width: 50,
                  ),
                ),
              ),
              Wrap(
                children: List.generate(
                  100,
                  (index) {
                    final assetPath =
                        "assets/icons/angka/gambar (${index + 1}).png";

                    return GestureDetector(
                      onTap: () {
                        final musicPath =
                            "assets/audios/sound angka/${index + 1}.mp3";

                        assetsAudioPlayer.open(Audio(musicPath));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          assetPath,
                          width: 80,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

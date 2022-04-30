import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/asset_path.dart';

class BelajarAbjadBesarDetailPage extends StatelessWidget {
  const BelajarAbjadBesarDetailPage({Key? key, required this.isUpperCase})
      : super(key: key);

  final bool isUpperCase;

  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                  26,
                  (index) {
                    String assetPath = '';
                    if (isUpperCase) {
                      assetPath = "assets/icons/huruf/" +
                          String.fromCharCode(index + 97) +
                          "-besar.png";
                    } else {
                      assetPath = "assets/icons/huruf/" +
                          String.fromCharCode(index + 97) +
                          "-kecil.png";
                    }

                    return GestureDetector(
                      onTap: () {
                        final musicPath = "assets/audios/sound huruf/" +
                            String.fromCharCode(97 + index).toUpperCase() +
                            ".mp3";
                        assetsAudioPlayer.open(Audio(musicPath));
                        // showDialog(
                        //     context: context,
                        //     builder: (context) => AlertDialog(
                        //           title: Text("Jawaban Anda: Benar"),
                        //         ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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

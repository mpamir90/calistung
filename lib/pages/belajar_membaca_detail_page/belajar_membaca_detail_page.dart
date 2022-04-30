import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:calistung/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../constant/asset_path.dart';

class BelajarMembacaDetailPage extends StatelessWidget {
  const BelajarMembacaDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listKata = [
      'BAJU',
      'BAYI',
      'BOLA',
      'BUKU',
      'BUMI',
      'DASI',
      'FOTO',
      'JARI',
      'KADO',
      'KAKI',
      'KOPI',
      'KUDA',
      'MEJA',
      'PENA',
      'RODA',
      'ROTI',
      'RUSA',
      'SAPI',
      'SOFA',
      'TOPI',
    ];

    RxBool isLowerCase = RxBool(false);
    RxInt currentIndex = RxInt(0);
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
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(100),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            listKata[currentIndex.value].length,
                            (index) {
                              final currentHuruf =
                                  listKata[currentIndex.value][index];
                              String assetPath = "";

                              if (isLowerCase.value) {
                                assetPath =
                                    "assets/icons/huruf-membaca/${currentHuruf.toLowerCase()}-kecil.png";
                              } else {
                                assetPath =
                                    "assets/icons/huruf-membaca/${currentHuruf.toLowerCase()}-besar.png";
                              }

                              return Image.asset(
                                assetPath,
                                width: 100,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      isLowerCase.toggle();
                    },
                    child: Image.asset(
                      AssetPath.font,
                      width: 50,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      AssetPath.close,
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (currentIndex.value <= 0) {
                      return;
                    }
                    currentIndex--;
                  },
                  child: Image.asset(
                    AssetPath.back,
                    width: 50,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    final musicPath =
                        "assets/audios/sound 2 kata/${currentIndex.value + 1}.mp3";
                    print(musicPath);
                    assetsAudioPlayer.open(Audio(musicPath));
                  },
                  child: Image.asset(
                    AssetPath.play,
                    width: 50,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (currentIndex.value + 1 >= listKata.length) {
                      return;
                    }
                    currentIndex++;
                  },
                  child: Image.asset(
                    AssetPath.next,
                    width: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

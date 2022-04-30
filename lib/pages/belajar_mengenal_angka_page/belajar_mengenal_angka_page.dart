import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/asset_path.dart';
import '../belajar_angka_detail_page/belajar_angka_detail_page.dart';

class BelajarMengenalAngkaPage extends StatelessWidget {
  const BelajarMengenalAngkaPage({Key? key, this.initialPage = 0})
      : super(key: key);

  final int initialPage;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(
      initialPage: initialPage,
    );

    final assetsAudioPlayer = AssetsAudioPlayer();
    final musicPath = "assets/audios/sound angka/${initialPage + 1}.mp3";
    assetsAudioPlayer.open(Audio(musicPath));

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                GestureDetector(
                  child: Image.asset(
                    AssetPath.fullscreen,
                    width: 50,
                  ),
                  onTap: () => Get.to(const BelajarAngkaDetailPage()),
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
            Expanded(
              child: Center(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    final musicPath =
                        "assets/audios/sound angka/${index + 1}.mp3";

                    assetsAudioPlayer.open(
                      Audio(musicPath),
                      showNotification: false,
                    );
                  },
                  children: List.generate(
                    26,
                    (index) {
                      String assetPath =
                          "assets/icons/angka/gambar (${index + 1}).png";

                      return Image.asset(
                        assetPath,
                        width: 100,
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (pageController.page == 0) {
                      return;
                    }
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Image.asset(
                    AssetPath.back,
                    width: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (pageController.page == 25) {
                      return;
                    }

                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
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

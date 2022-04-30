import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:calistung/pages/belajar_abjad_besar_detail_page/belajar_abjad_besar_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/asset_path.dart';

class BelajarAbjadBesarPage extends StatelessWidget {
  const BelajarAbjadBesarPage({Key? key, this.initialPage = 0})
      : super(key: key);

  final int initialPage;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(
      initialPage: initialPage,
    );

    final assetsAudioPlayer = AssetsAudioPlayer();
    final musicPath = "assets/audios/sound huruf/" +
        String.fromCharCode(97 + initialPage).toUpperCase() +
        ".mp3";
    assetsAudioPlayer.open(Audio(musicPath));
    RxBool isUpperCase = RxBool(true);

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
                GestureDetector(
                  child: Image.asset(
                    AssetPath.font,
                    width: 50,
                  ),
                  onTap: () => isUpperCase.toggle(),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  child: Image.asset(
                    AssetPath.fullscreen,
                    width: 50,
                  ),
                  onTap: () => Get.to(BelajarAbjadBesarDetailPage(
                    isUpperCase: isUpperCase.value,
                  )),
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
                child: Obx(
                  () => PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      final musicPath = "assets/audios/sound huruf/" +
                          String.fromCharCode(97 + index).toUpperCase() +
                          ".mp3";
                      assetsAudioPlayer.open(
                        Audio(musicPath),
                        showNotification: false,
                      );
                    },
                    children: List.generate(26, (index) {
                      String assetPath = "";
                      if (isUpperCase.value) {
                        assetPath = "assets/icons/huruf/" +
                            String.fromCharCode(index + 97) +
                            "-besar.png";
                      } else {
                        assetPath = "assets/icons/huruf/" +
                            String.fromCharCode(index + 97) +
                            "-kecil.png";
                      }

                      return Image.asset(
                        assetPath,
                        width: 100,
                      );
                    }),
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

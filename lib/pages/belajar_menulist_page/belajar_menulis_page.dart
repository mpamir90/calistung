import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:calistung/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../constant/asset_path.dart';

enum BelajarMenulisMode { huruf, angka }

class BelajarMenulisPage extends StatelessWidget {
  const BelajarMenulisPage({
    Key? key,
    required this.belajarMenulisMode,
  }) : super(key: key);

  final BelajarMenulisMode belajarMenulisMode;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);
    RxInt initialHuruf =
        RxInt(belajarMenulisMode == BelajarMenulisMode.huruf ? 97 : 1);
    RxBool isLowerCase = RxBool(true);
    final signatureController = SignatureController(
      penColor: Colors.white,
      penStrokeWidth: 3,
    );
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "PAPAN TULIS",
                              style: textTheme.headline6?.copyWith(
                                color: palette.onSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => signatureController.clear(),
                          child: Image.asset(
                            AssetPath.clean,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Center(
                            child: Obx(
                              () {
                                if (belajarMenulisMode ==
                                    BelajarMenulisMode.huruf) {
                                  final musicPath =
                                      "assets/audios/sound huruf/" +
                                          String.fromCharCode(
                                                  initialHuruf.value)
                                              .toUpperCase() +
                                          ".mp3";
                                  assetsAudioPlayer.open(Audio(musicPath));

                                  return Text(
                                    isLowerCase.value
                                        ? String.fromCharCode(
                                            initialHuruf.value)
                                        : String.fromCharCode(
                                                initialHuruf.value)
                                            .toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 200,
                                      color: palette.onSecondary.withAlpha(100),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                } else {
                                  final musicPath =
                                      "assets/audios/sound angka/${initialHuruf.value}.mp3";
                                  assetsAudioPlayer.open(Audio(musicPath));

                                  return Text(
                                    initialHuruf.string,
                                    style: TextStyle(
                                      fontSize: 200,
                                      color: palette.onSecondary.withAlpha(100),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Signature(
                            controller: signatureController,
                            backgroundColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            switch (belajarMenulisMode) {
                              case BelajarMenulisMode.huruf:
                                if (initialHuruf.value <= 97) {
                                  return;
                                }
                                signatureController.clear();
                                initialHuruf--;
                                break;
                              case BelajarMenulisMode.angka:
                                if (initialHuruf.value <= 1) {
                                  return;
                                }
                                signatureController.clear();
                                initialHuruf--;
                                break;
                            }
                          },
                          child: Image.asset(
                            AssetPath.back,
                            width: 50,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            switch (belajarMenulisMode) {
                              case BelajarMenulisMode.huruf:
                                if (initialHuruf >= 122) {
                                  return;
                                }
                                signatureController.clear();
                                initialHuruf++;
                                break;
                              case BelajarMenulisMode.angka:
                                if (initialHuruf >= 100) {
                                  return;
                                }
                                signatureController.clear();
                                initialHuruf++;
                                break;
                            }
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
            ),
            const SizedBox(width: 16),
            if (belajarMenulisMode == BelajarMenulisMode.huruf)
              GestureDetector(
                onTap: () {
                  isLowerCase.toggle();
                  signatureController.clear();
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
    );
  }
}

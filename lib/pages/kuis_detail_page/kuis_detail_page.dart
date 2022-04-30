import 'package:calistung/models/kuis_model.dart';
import 'package:calistung/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/asset_path.dart';

class KuisDetailPage extends StatelessWidget {
  const KuisDetailPage({
    Key? key,
    required this.listKuis,
  }) : super(key: key);

  final List<KuisModel> listKuis;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);
    RxInt currentIndex = RxInt(0);
    int score = 0;

    Future<void> nextIndex(String jawaban) async {
      final currentKuis = listKuis[currentIndex.value];
      if (currentKuis.jawaban == jawaban) {
        score += 10;
        print("benar");
        await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Jawaban Anda: Benar"),
          ),
        );
      } else {
        await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Jawaban Anda: Salah"),
          ),
        );
      }

      currentIndex++;
    }

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
            Obx(() {
              final realSoal = listKuis[currentIndex.value].soal.split(" ");

              return Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(100),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currentIndex.value + 1 != 10) ...[
                          Text(
                            "Nomor ${currentIndex.value + 1}",
                            style: textTheme.headline6?.copyWith(
                              color: palette.onSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: List.generate(
                              realSoal.length,
                              (index) {
                                final assetPath =
                                    "assets/icons/kuis/${realSoal[index]}.png";
                                return Image.asset(assetPath);
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          _ItemJawaban(
                            imgPath: AssetPath.pilihanA,
                            onTap: () => nextIndex(
                                listKuis[currentIndex.value].pilihan[0]),
                            pilihan: listKuis[currentIndex.value].pilihan[0],
                          ),
                          const SizedBox(height: 16),
                          _ItemJawaban(
                            imgPath: AssetPath.pilihanB,
                            onTap: () => nextIndex(
                                listKuis[currentIndex.value].pilihan[1]),
                            pilihan: listKuis[currentIndex.value].pilihan[1],
                          ),
                          const SizedBox(height: 16),
                          _ItemJawaban(
                            imgPath: AssetPath.pilihanC,
                            onTap: () => nextIndex(
                                listKuis[currentIndex.value].pilihan[2]),
                            pilihan: listKuis[currentIndex.value].pilihan[2],
                          ),
                        ],
                        if (currentIndex.value + 1 == 10) ...[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Skor Nilai",
                                style: textTheme.headline6?.copyWith(
                                  color: palette.onSecondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(score.toString().length,
                                    (index) {
                                  final String scoreString = score.toString();
                                  final assetPath =
                                      "assets/icons/kuis/${scoreString[index]}.png";

                                  return Image.asset(
                                    assetPath,
                                    width: 100,
                                  );
                                }),
                              ),
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: Image.asset(
                                      AssetPath.menu,
                                      width: 64,
                                    ),
                                  ),
                                  const SizedBox(width: 32),
                                  GestureDetector(
                                    onTap: () {
                                      currentIndex.value = 0;
                                      score = 0;
                                    },
                                    child: Image.asset(
                                      AssetPath.reload,
                                      width: 64,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(width: 16),
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

class _ItemJawaban extends StatelessWidget {
  const _ItemJawaban({
    Key? key,
    required this.imgPath,
    required this.onTap,
    required this.pilihan,
  }) : super(key: key);

  final String imgPath;
  final void Function()? onTap;
  final String pilihan;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            imgPath,
            width: 40,
          ),
          const SizedBox(width: 16),
          Text(
            pilihan,
            style: textTheme.headline6?.copyWith(
              color: palette.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

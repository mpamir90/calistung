import 'package:calistung/models/kuis_model.dart';
import 'package:calistung/pages/kuis_detail_page/kuis_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/asset_path.dart';
import '../../widgets/item_choice.dart';
import '../belajar_abjad_page/belajar_abjad_page.dart';
import '../belajar_angka_page/belajar_angka_page.dart';
import '../belajar_membaca_page/belajar_membaca_page.dart';

class GameKuisPage extends StatelessWidget {
  const GameKuisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.bg),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetPath.logo,
              width: 150,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemChoice(
                  title: "Penjumlahan",
                  assetPath: AssetPath.oneTwoThreeFour,
                  width: 130,
                  onTap: () {
                    final List<KuisModel> listKuis = [
                      KuisModel(
                        soal: '1 tambah 1',
                        pilihan: ['1', '2', '3'],
                        jawaban: '2',
                      ),
                      KuisModel(
                        soal: '1 tambah 2',
                        pilihan: ['1', '2', '3'],
                        jawaban: '3',
                      ),
                      KuisModel(
                        soal: '1 tambah 3',
                        pilihan: ['2', '4', '1'],
                        jawaban: '4',
                      ),
                      KuisModel(
                        soal: '1 tambah 4',
                        pilihan: ['5', '6', '7'],
                        jawaban: '5',
                      ),
                      KuisModel(
                        soal: '1 tambah 5',
                        pilihan: ['5', '7', '6'],
                        jawaban: '6',
                      ),
                      KuisModel(
                        soal: '1 tambah 6',
                        pilihan: ['8', '7', '9'],
                        jawaban: '7',
                      ),
                      KuisModel(
                        soal: '1 tambah 7',
                        pilihan: ['8', '7', '9'],
                        jawaban: '8',
                      ),
                      KuisModel(
                        soal: '1 tambah 8',
                        pilihan: ['10', '9', '8'],
                        jawaban: '9',
                      ),
                      KuisModel(
                        soal: '1 tambah 9',
                        pilihan: ['8', '10', '9'],
                        jawaban: '10',
                      ),
                      KuisModel(
                        soal: '1 tambah 1 0',
                        pilihan: ['11', '10', '9'],
                        jawaban: '11',
                      ),
                    ];
                    Get.to(KuisDetailPage(listKuis: listKuis));
                  },
                ),
                ItemChoice(
                  title: "Pengurangan",
                  width: 130,
                  assetPath: AssetPath.oneTwoThreeFour,
                  onTap: () {
                    final List<KuisModel> listKuis = [
                      KuisModel(
                        soal: '1 kurang 1',
                        pilihan: ['0', '2', '3'],
                        jawaban: '0',
                      ),
                      KuisModel(
                        soal: '2 kurang 1',
                        pilihan: ['1', '2', '3'],
                        jawaban: '1',
                      ),
                      KuisModel(
                        soal: '3 kurang 1',
                        pilihan: ['1', '2', '3'],
                        jawaban: '2',
                      ),
                      KuisModel(
                        soal: '4 kurang 1',
                        pilihan: ['1', '2', '3'],
                        jawaban: '3',
                      ),
                      KuisModel(
                        soal: '5 kurang 1',
                        pilihan: ['3', '4', '5'],
                        jawaban: '4',
                      ),
                      KuisModel(
                        soal: '6 kurang 1',
                        pilihan: ['3', '4', '5'],
                        jawaban: '5',
                      ),
                      KuisModel(
                        soal: '7 kurang 1',
                        pilihan: ['5', '6', '7'],
                        jawaban: '6',
                      ),
                      KuisModel(
                        soal: '8 kurang 1',
                        pilihan: ['7', '8', '9'],
                        jawaban: '7',
                      ),
                      KuisModel(
                        soal: '9 kurang 1',
                        pilihan: ['7', '8', '9'],
                        jawaban: '8',
                      ),
                      KuisModel(
                        soal: '1 0 kurang 1',
                        pilihan: ['7', '8', '9'],
                        jawaban: '9',
                      ),
                    ];
                    Get.to(KuisDetailPage(listKuis: listKuis));
                  },
                ),
                ItemChoice(
                  title: "Perkalian",
                  width: 130,
                  assetPath: AssetPath.oneTwoThreeFour,
                  onTap: () {
                    final List<KuisModel> listKuis = [
                      KuisModel(
                        soal: '1 kali 1',
                        pilihan: ['1', '2', '3'],
                        jawaban: '1',
                      ),
                      KuisModel(
                        soal: '1 kali 2',
                        pilihan: ['1', '2', '3'],
                        jawaban: '2',
                      ),
                      KuisModel(
                        soal: '1 kali 3',
                        pilihan: ['1', '2', '3'],
                        jawaban: '3',
                      ),
                      KuisModel(
                        soal: '1 kali 4',
                        pilihan: ['3', '4', '5'],
                        jawaban: '4',
                      ),
                      KuisModel(
                        soal: '1 kali 5',
                        pilihan: ['3', '4', '5'],
                        jawaban: '5',
                      ),
                      KuisModel(
                        soal: '1 kali 6',
                        pilihan: ['5', '6', '7'],
                        jawaban: '6',
                      ),
                      KuisModel(
                        soal: '1 kali 7',
                        pilihan: ['5', '6', '7'],
                        jawaban: '7',
                      ),
                      KuisModel(
                        soal: '1 kali 8',
                        pilihan: ['7', '8', '9'],
                        jawaban: '8',
                      ),
                      KuisModel(
                        soal: '1 kali 9',
                        pilihan: ['7', '8', '9'],
                        jawaban: '9',
                      ),
                      KuisModel(
                        soal: '1 kali 1 0',
                        pilihan: ['8', '10', '9'],
                        jawaban: '10',
                      ),
                    ];
                    Get.to(KuisDetailPage(listKuis: listKuis));
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  AssetPath.back,
                  width: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

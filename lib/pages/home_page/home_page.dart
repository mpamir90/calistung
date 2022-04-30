import 'package:calistung/pages/game_kuis_page/game_kuis_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/asset_path.dart';
import '../../widgets/item_choice.dart';
import '../belajar_abjad_page/belajar_abjad_page.dart';
import '../belajar_angka_page/belajar_angka_page.dart';
import '../belajar_membaca_page/belajar_membaca_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  title: "Belajar Abjad",
                  assetPath: AssetPath.abc,
                  onTap: () => Get.to(const BelajarAbjadPage()),
                ),
                ItemChoice(
                  title: "Belajar Membaca",
                  assetPath: AssetPath.reading,
                  onTap: () => Get.to(const BelajarMembacaPage()),
                ),
                ItemChoice(
                  title: "Belajar Angka",
                  assetPath: AssetPath.oneTwoThree,
                  onTap: () => Get.to(const BelajarAngkaPage()),
                ),
                ItemChoice(
                  title: "Game\nKuis",
                  assetPath: AssetPath.oneTwoThreeFour,
                  onTap: () => Get.to(const GameKuisPage()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

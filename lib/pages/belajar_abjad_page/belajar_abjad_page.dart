import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/asset_path.dart';
import '../../widgets/item_choice.dart';
import '../belajar_abjad_besar_page/belajar_abjad_besar_page.dart';
import '../belajar_menulist_page/belajar_menulis_page.dart';

class BelajarAbjadPage extends StatelessWidget {
  const BelajarAbjadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
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
                  title: "Mengenal Huruf",
                  assetPath: AssetPath.abc,
                  onTap: () => Get.to(const BelajarAbjadBesarPage()),
                ),
                ItemChoice(
                  title: "Menulis Huruf",
                  assetPath: AssetPath.abc,
                  onTap: () => Get.to(
                    () => const BelajarMenulisPage(
                      belajarMenulisMode: BelajarMenulisMode.huruf,
                    ),
                  ),
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

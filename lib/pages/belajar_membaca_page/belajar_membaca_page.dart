import 'package:calistung/pages/belajar_membaca_detail_page/belajar_membaca_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/asset_path.dart';
import '../../widgets/item_choice.dart';

class BelajarMembacaPage extends StatelessWidget {
  const BelajarMembacaPage({Key? key}) : super(key: key);

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
                  title: "Membaca 2 Suku Kata",
                  assetPath: AssetPath.reading,
                  width: 150,
                  onTap: () => Get.to(() => const BelajarMembacaDetailPage()),
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

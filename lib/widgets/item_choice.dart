import 'package:flutter/material.dart';

class ItemChoice extends StatefulWidget {
  const ItemChoice({
    Key? key,
    required this.title,
    this.onTap,
    required this.assetPath,
    this.width = 100,
  }) : super(key: key);

  final String title;
  final String assetPath;
  final void Function()? onTap;
  final double width;

  @override
  State<ItemChoice> createState() => _ItemChoiceState();
}

class _ItemChoiceState extends State<ItemChoice> {
  double opacity = 0;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      setState(() {
        opacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: opacity,
        child: Container(
          width: widget.width,
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(
                widget.assetPath,
              ),
              const SizedBox(height: 16),
              Text(
                widget.title,
                style: textTheme.headline6,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

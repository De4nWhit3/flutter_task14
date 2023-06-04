import 'package:flutter/material.dart';

import '../question.dart';

class CardItem extends StatelessWidget {
  final Animation<double> animation;
  final Question item;
  final bool selected;
  const CardItem({
    super.key,
    this.selected = false,
    required this.animation,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Colors.white;

    if (selected) {
      selectedColor = Colors.greenAccent;
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizeTransition(
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: SizedBox(
            height: 80,
            child: Card(
              color: Colors.red.shade900,
              child: Center(
                child: Text(
                  'Item ${item.question}',
                  style: TextStyle(
                    color: selectedColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

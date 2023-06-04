import 'package:assignment_14/main.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback? onTap;
  final Question item;
  final bool selected;
  const CardItem({
    super.key,
    this.onTap,
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
          onTap: onTap,
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

import 'package:flutter/material.dart';

class ListModel<E> {
  final GlobalKey<AnimatedListState> listKey;
  final List<E> _items;

  ListModel({
    required this.listKey,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  AnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList!.insertItem(index);
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

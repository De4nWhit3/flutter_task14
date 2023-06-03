import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<int> _list;
  int? _selectedItem;
  late int _nextItem;
  @override
  void initState() {
    super.initState();
    _list = ListModel<int>(listKey: _listKey, initialItems: <int>[0, 1, 2]);
    _nextItem = 3;
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    _list.insert(index, _nextItem++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        centerTitle: true,
        title: Text(
          'Dean\'s Quiz App',
          style: TextStyle(
            color: Colors.white.withOpacity(.7),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _insert,
            icon: const Icon(Icons.plus_one),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimatedList(
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder: _buildItem),
      ),
    );
  }
}

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

class CardItem extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;
  const CardItem({
    super.key,
    this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
  }) : assert(item >= 0);

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
                  'Item $item',
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

import 'package:flutter/material.dart';

import 'list_model.dart';
import 'widgets/card_item.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<Question> _list;
  Question? _selectedItem;
  late Question _nextItem;
  @override
  void initState() {
    super.initState();
    _list = ListModel<Question>(listKey: _listKey, initialItems: <Question>[
      Question(
          answer: 'answer',
          hints: ['hints'],
          question: 'question',
          category: 'category'),
    ]);
    _nextItem = Question(
        answer: 'answer',
        hints: ['hints'],
        question: 'question',
        category: 'category');
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
    _list.insert(index, _list[0]);
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

class Question {
  final String question;
  final String answer;
  final String category;
  final List<String> hints;

  Question({
    required this.answer,
    required this.hints,
    required this.question,
    required this.category,
  });

  (String, String, String, List<String>) getInfo() {
    return (question, answer, category, hints);
  }
}

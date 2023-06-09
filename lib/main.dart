import 'dart:math';

import 'package:assignment_14/widgets/question_form_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';

import 'question.dart';
import 'widgets/question_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
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
  final List<Question> questions = [];
  Random random = new Random();
  int randomIndex = 0;
  @override
  void initState() {
    super.initState();
    questions.add(
      Question(
        question: 'What type of Digimon is Agumon?',
        answer: 'Vaccine',
        category: 'digimon',
        imageUrl: 'assets/agumon.jpg',
        hints: [
          'It\'s a term also used for immunity against diseases.',
          'It\'s considered the strongest type in the show.'
        ],
      ),
    );
    questions.add(
      Question(
        question: 'Can Gabumon remove its fur?',
        answer: 'Yes',
        category: 'digimon',
        imageUrl: 'assets/gabumon.jpg',
        hints: [
          'In the show he refers to his fur as a coat.',
          'In the series when Matt is freezing he gives him the fur.'
        ],
      ),
    );
    questions.add(
      Question(
        question: 'What animal does Gomamon summon as his strongest spell?',
        answer: 'Fish',
        category: 'digimon',
        imageUrl: 'assets/gomamon.jpg',
        hints: [
          'In England it goes well with fries.',
          'It\'s rich in Omega oils.'
        ],
      ),
    );
    questions.add(
      Question(
        question: 'What is the name of Palmon\'s evolution?',
        answer: 'Lillymon',
        category: 'digimon',
        imageUrl: 'assets/palmon.jpg',
        hints: [
          'It\'s the name of a flower.',
          'It\'s popular on rivers and still dams.'
        ],
      ),
    );
    questions.add(
      Question(
        question: 'What was Patamon\'s evolution inspired by?',
        answer: 'Angel',
        category: 'digimon',
        imageUrl: 'assets/patamon.jpg',
        hints: [
          'It\'s popular in the Bible.',
          'Finish the sentence: Your guardian ???'
        ],
      ),
    );
    questions.add(
      Question(
        question: 'What is Piymon obsessed with?',
        answer: 'Himself',
        category: 'digimon',
        imageUrl: 'assets/piyomon.jpg',
        hints: [
          'Some people are also obsessed by it.',
          'If you constantly admire yourself in the mirror with who are you obsessed?'
        ],
      ),
    );
    questions.add(
      Question(
        question: 'What is the name of Tentomon\'s owner?',
        answer: 'Izzy',
        category: 'digimon',
        imageUrl: 'assets/tentomon.jpg',
        hints: ['He\'s a short boy.', 'He was the IT nerd in the series.'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        centerTitle: true,
        title: Text(
          'Dean\'s Quiz App',
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
      ),

      // body: QuestionFormWidget(
      //   question: questions[0],
      // ),
      body: HomeScreenQuestionsWidget(questions: questions),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          randomIndex = random.nextInt(questions.length);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  QuestionFormWidget(question: questions[randomIndex]),
            ),
          );
        },
        label: const Text('Random Question'),
        icon: const Icon(Icons.recycling),
      ),
    );
  }
}

class HomeScreenQuestionsWidget extends StatelessWidget {
  const HomeScreenQuestionsWidget({
    super.key,
    required this.questions,
  });

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(seconds: 1),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Column(
                    children: [
                      QuestionCard(
                        question: questions[index],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

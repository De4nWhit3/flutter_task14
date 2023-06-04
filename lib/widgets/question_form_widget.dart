import 'package:flutter/material.dart';

import '../question.dart';

class QuestionFormWidget extends StatefulWidget {
  final Question question;

  const QuestionFormWidget({super.key, required this.question});

  @override
  State<QuestionFormWidget> createState() => _QuestionFormWidgetState();
}

class _QuestionFormWidgetState extends State<QuestionFormWidget> {
  int attempts = 3;
  bool _showHintOne = false;
  bool _showHintTwo = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Question question = widget.question;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          centerTitle: true,
          title: const Text('Question Page'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Image(
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                    image: AssetImage(question.imageUrl),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value.toUpperCase() ==
                          question.answer.toUpperCase()) {
                        return null;
                      } else if (attempts == 1) {
                        return "Answer was: ${question.answer}";
                      } else {
                        attempts--;
                        return 'Answer was not correct';
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Answer was correct!"),
                          backgroundColor: Colors.green,
                        ));
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (!_showHintOne) {
                          _showHintOne = true;
                          attempts--;
                          return;
                        }
                        if (!_showHintTwo) {
                          _showHintTwo = true;
                          attempts--;
                          return;
                        }
                      });
                    },
                    child: const Text(
                      'Show Hint',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: _showHintOne,
                  child: Text(
                    'Hint 1: ${question.hints[0]}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: _showHintTwo,
                  child: Text(
                    'Hint 2: ${question.hints[1]}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

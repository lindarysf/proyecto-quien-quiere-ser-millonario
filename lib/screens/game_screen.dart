import 'package:flutter/material.dart';

import '../models/question_model.dart';

class GameScreen extends StatefulWidget {
  final Category category;

  const GameScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOptionIndex;
  bool _hasAnswered = false;

  void _answerQuestion(int index) {
    if (_hasAnswered) return;

    setState(() {
      _selectedOptionIndex = index;
      _hasAnswered = true;
      if (index ==
          widget.category.questions[_currentIndex].correctOptionIndex) {
        _score += 100000;
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (_currentIndex < widget.category.questions.length - 1) {
        setState(() {
          _currentIndex++;
          _selectedOptionIndex = null;
          _hasAnswered = false;
        });
      } else {
        _showGameOverDialog();
      }
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF031926),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF00E5FF), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Text(
          "¡JUEGO TERMINADO!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF00E5FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          "Categoría: ${widget.category.title}\nPuntaje total: \$$_score",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cerrar cuadro
              Navigator.pop(context); // Volver a categorías
            },
            child: const Text(
              "MENÚ PRINCIPAL",
              style: TextStyle(color: Color(0xFF00E5FF)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.category.questions[_currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF020C1B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _buildTopBar(),
              const SizedBox(height: 10),
              Expanded(child: _buildLayoutContent(currentQuestion)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0A2239),
        border: Border.all(color: const Color(0xFF00E5FF), width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.category.title} (${_currentIndex + 1}/${widget.category.questions.length})",
            style: const TextStyle(
              color: Color(0xFF00E5FF),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            "Acumulado: \$$_score",
            style: const TextStyle(
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayoutContent(Question q) {
    switch (q.type) {
      case QuestionType.imageInQuestion:
        return _buildImageInQuestionLayout(q);
      case QuestionType.imagesInAnswers:
        return _buildImagesInAnswersLayout(q);
      case QuestionType.textOnly:
        return _buildTextOnlyLayout(q);
    }
  }

  // Layout 1
  Widget _buildImageInQuestionLayout(Question q) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(q.options.length, (i) {
              return _buildOptionButton(
                text: q.options[i].text,
                index: i,
                correctIndex: q.correctOptionIndex,
              );
            }),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF031926),
              border: Border.all(color: const Color(0xFF00E5FF), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      q.questionImageUrl ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  q.questionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Layout 2
  Widget _buildImagesInAnswersLayout(Question q) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF031926),
              border: Border.all(color: const Color(0xFF00E5FF), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              q.questionText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          flex: 4,
          child: Row(
            children: List.generate(q.options.length, (i) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: _buildImageOptionButton(
                    imageUrl: q.options[i].imageUrl ?? '',
                    index: i,
                    correctIndex: q.correctOptionIndex,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  // Layout 3
  Widget _buildTextOnlyLayout(Question q) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF031926),
              border: Border.all(color: const Color(0xFF00E5FF), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              q.questionText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _buildOptionButton(
                        text: q.options[0].text,
                        index: 0,
                        correctIndex: q.correctOptionIndex,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildOptionButton(
                        text: q.options[1].text,
                        index: 1,
                        correctIndex: q.correctOptionIndex,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _buildOptionButton(
                        text: q.options[2].text,
                        index: 2,
                        correctIndex: q.correctOptionIndex,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildOptionButton(
                        text: q.options[3].text,
                        index: 3,
                        correctIndex: q.correctOptionIndex,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOptionButton({
    required String text,
    required int index,
    required int correctIndex,
  }) {
    Color borderColor = const Color(0xFF00E5FF);
    Color bgColor = const Color(0xFF0A2239);

    if (_hasAnswered) {
      if (index == correctIndex) {
        borderColor = Colors.greenAccent;
        bgColor = Colors.green.withOpacity(0.4);
      } else if (index == _selectedOptionIndex) {
        borderColor = Colors.redAccent;
        bgColor = Colors.red.withOpacity(0.4);
      }
    }

    return GestureDetector(
      onTap: () => _answerQuestion(index),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildImageOptionButton({
    required String imageUrl,
    required int index,
    required int correctIndex,
  }) {
    Color borderColor = const Color(0xFF00E5FF);

    if (_hasAnswered) {
      if (index == correctIndex) {
        borderColor = Colors.greenAccent;
      } else if (index == _selectedOptionIndex) {
        borderColor = Colors.redAccent;
      }
    }

    return GestureDetector(
      onTap: () => _answerQuestion(index),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0A2239),
          border: Border.all(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

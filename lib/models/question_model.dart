enum QuestionType {
  imageInQuestion, // Pregunta con imagen a la derecha y texto a la izquierda
  imagesInAnswers, // Pregunta en texto y opciones con imágenes abajo
  textOnly, // Pregunta escrita y respuestas escritas
}

class Option {
  final String text;
  final String? imageUrl;

  Option({this.text = '', this.imageUrl});
}

class Question {
  final String questionText;
  final String? questionImageUrl;
  final List<Option> options;
  final int correctOptionIndex;
  final QuestionType type;

  Question({
    required this.questionText,
    this.questionImageUrl,
    required this.options,
    required this.correctOptionIndex,
    required this.type,
  });
}

class Category {
  final String id;
  final String title;
  final String description;
  final String iconImage;
  final List<Question> questions;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.iconImage,
    required this.questions,
  });
}

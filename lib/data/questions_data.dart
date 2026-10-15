import '../models/question_model.dart';

final List<Category> categoriesData = [
  // ================= CATEGORÍA 1: CULTURA GENERAL =================
  Category(
    id: 'cultura_general',
    title: 'Cultura General',
    description:
        'Demuestra tus conocimientos en geografía, historia, ciencia y arte.',
    iconImage: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=400',
    questions: [
      // P1: Imagen en Pregunta
      Question(
        questionText:
            "¿Qué famosa maravilla del mundo moderno se muestra en la imagen?",
        questionImageUrl: "https://images.unsplash.com/photo-1526392060635-9d6019884377?q=80&w=800",
        type: QuestionType.imageInQuestion,
        correctOptionIndex: 1,
        options: [
          Option(text: "A) Chichén Itzá"),
          Option(text: "B) Machu Picchu"),
          Option(text: "C) El Coliseo"),
          Option(text: "D) Petra"),
        ],
      ),
      // P2: Imágenes en Respuestas
      Question(
        questionText:
            "¿Cuál de las siguientes es la bandera oficial de Argentina?",
        type: QuestionType.imagesInAnswers,
        correctOptionIndex: 0,
        options: [
          Option(
            text: "Argentina",
            imageUrl: "https://flagcdn.com/w320/ar.png",
          ),
          Option(text: "Uruguay", imageUrl: "https://flagcdn.com/w320/uy.png"),
          Option(
            text: "Guatemala",
            imageUrl: "https://flagcdn.com/w320/gt.png",
          ),
          Option(text: "Honduras", imageUrl: "https://flagcdn.com/w320/hn.png"),
        ],
      ),
      // P3: Solo Texto
      Question(
        questionText:
            "¿Cuál es el elemento químico más abundante en el universo?",
        type: QuestionType.textOnly,
        correctOptionIndex: 2,
        options: [
          Option(text: "A) Oxígeno"),
          Option(text: "B) Helio"),
          Option(text: "C) Hidrógeno"),
          Option(text: "D) Carbono"),
        ],
      ),
      // P4: Imagen en Pregunta (Corregida: Torre de Pisa)
      Question(
        questionText: "¿En qué país se encuentra la famosa Torre de Pisa?",
        questionImageUrl: "https://images.unsplash.com/photo-1543429776-2782fc8e1acd?q=80&w=800",
        type: QuestionType.imageInQuestion,
        correctOptionIndex: 0,
        options: [
          Option(text: "A) Italia"),
          Option(text: "B) Francia"),
          Option(text: "C) Grecia"),
          Option(text: "D) España"),
        ],
      ),
      // P5: Solo Texto
      Question(
        questionText:
            "¿En qué año llegó el ser humano a la Luna por primera vez?",
        type: QuestionType.textOnly,
        correctOptionIndex: 1,
        options: [
          Option(text: "A) 1965"),
          Option(text: "B) 1969"),
          Option(text: "C) 1972"),
          Option(text: "D) 1959"),
        ],
      ),
      // P6: Imágenes en Respuestas
      Question(
        questionText:
            "¿Cuál de estas opciones corresponde a la bandera de Japón?",
        type: QuestionType.imagesInAnswers,
        correctOptionIndex: 1,
        options: [
          Option(
            text: "Corea del Sur",
            imageUrl: "https://flagcdn.com/w320/kr.png",
          ),
          Option(text: "Japón", imageUrl: "https://flagcdn.com/w320/jp.png"),
          Option(text: "China", imageUrl: "https://flagcdn.com/w320/cn.png"),
          Option(text: "Vietnam", imageUrl: "https://flagcdn.com/w320/vn.png"),
        ],
      ),
      // P7: Solo Texto
      Question(
        questionText:
            "¿Quién escribió la célebre obra 'Don Quijote de la Mancha'?",
        type: QuestionType.textOnly,
        correctOptionIndex: 3,
        options: [
          Option(text: "A) Gabriel García Márquez"),
          Option(text: "B) William Shakespeare"),
          Option(text: "C) Mario Vargas Llosa"),
          Option(text: "D) Miguel de Cervantes"),
        ],
      ),
      // P8: Imagen en Pregunta (Mona Lisa con el nuevo enlace)
      Question(
        questionText: "¿Cuál es el nombre de la famosa pintura clásica que se muestra aquí?",
        questionImageUrl: "https://i.pinimg.com/236x/67/12/0e/67120e7e550dfb98c1fe6cb7b440cdbf.jpg",
        type: QuestionType.imageInQuestion,
        correctOptionIndex: 2,
        options: [
          Option(text: "A) La Última Cena"),
          Option(text: "B) La Joven de la Perla"),
          Option(text: "C) Mona Lisa"),
          Option(text: "D) La Noche Estrellada"),
        ],
      ),
      // P9: Solo Texto
      Question(
        questionText: "¿Cuál es el océano más grande del planeta Tierra?",
        type: QuestionType.textOnly,
        correctOptionIndex: 0,
        options: [
          Option(text: "A) Pacífico"),
          Option(text: "B) Atlántico"),
          Option(text: "C) Índico"),
          Option(text: "D) Ártico"),
        ],
      ),
      // P10: Imágenes en Respuestas
      Question(
        questionText: "¿Cuál es la bandera oficial de Brasil?",
        type: QuestionType.imagesInAnswers,
        correctOptionIndex: 2,
        options: [
          Option(text: "Colombia", imageUrl: "https://flagcdn.com/w320/co.png"),
          Option(text: "Chile", imageUrl: "https://flagcdn.com/w320/cl.png"),
          Option(text: "Brasil", imageUrl: "https://flagcdn.com/w320/br.png"),
          Option(text: "Perú", imageUrl: "https://flagcdn.com/w320/pe.png"),
        ],
      ),
    ],
  ),

  // ================= CATEGORÍA 2: PELÍCULAS FAMOSAS =================
  Category(
    id: 'peliculas_famosas',
    title: 'Películas Famosas',
    description: 'Preguntas sobre Avengers, Harry Potter, 500 días con ella, El Extraño Mundo de Jack y Coraline.',
    iconImage: 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=400',
    questions: [
      // P1: Harry Potter (Solo texto)
      Question(
        questionText: "¿Cómo se llama la escuela de magia y hechicería a la que asiste Harry Potter?",
        type: QuestionType.textOnly,
        correctOptionIndex: 3,
        options: [
          Option(text: "A) Durmstrang"),
          Option(text: "B) Beauxbatons"),
          Option(text: "C) Ilvermorny"),
          Option(text: "D) Hogwarts"),
        ],
      ),
      // P2: Avengers (Imagen en Pregunta)
      Question(
        questionText: "¿A qué superhéroe del universo de Avengers pertenece este famoso escudo?",
        questionImageUrl: "https://i.pinimg.com/1200x/c4/81/77/c481778a866e6b46fca7f1da737b1d30.jpg",
        type: QuestionType.imageInQuestion,
        correctOptionIndex: 0,
        options: [
          Option(text: "A) Capitán América"),
          Option(text: "B) Iron Man"),
          Option(text: "C) Thor"),
          Option(text: "D) Hawkeye"),
        ],
      ),
      // P3: 500 días con ella (Solo texto)
      Question(
        questionText: "En la película '500 días con ella', ¿cuál es el nombre del protagonista masculino interpretado por Joseph Gordon-Levitt?",
        type: QuestionType.textOnly,
        correctOptionIndex: 1,
        options: [
          Option(text: "A) Michael"),
          Option(text: "B) Tom Hansen"),
          Option(text: "C) Ben"),
          Option(text: "D) Paul"),
        ],
      ),
      // P4: El Extraño Mundo de Jack (Solo texto)
      Question(
        questionText: "¿Cómo se llama el protagonista esquelético de 'El Extraño Mundo de Jack'?",
        type: QuestionType.textOnly,
        correctOptionIndex: 2,
        options: [
          Option(text: "A) Victor Van Dort"),
          Option(text: "B) Oogie Boogie"),
          Option(text: "C) Jack Skellington"),
          Option(text: "D) Barbas de Hojalata"),
        ],
      ),
      // P5: Coraline (Solo texto)
      Question(
        questionText: "En la película 'Coraline', ¿qué rasgo físico peculiar tienen los habitantes del Otro Mundo en lugar de ojos?",
        type: QuestionType.textOnly,
        correctOptionIndex: 0,
        options: [
          Option(text: "A) Botones cosidos"),
          Option(text: "B) Piedras preciosas"),
          Option(text: "C) Monedas de oro"),
          Option(text: "D) Espejos oscuros"),
        ],
      ),
      // P6: Harry Potter
      Question(
        questionText: "¿Quiénes recogen a Harry en el coche volador (Ford Anglia) a través de su ventana en 'Harry Potter y la Cámara de los Secretos'?",
        type: QuestionType.textOnly,
        correctOptionIndex: 1,
        options: [
          Option(text: "A) Sirius Black y Lupin"),
          Option(text: "B) Ron, Fred y George Weasley"),
          Option(text: "C) Hermione y Hagrid"),
          Option(text: "D) Los tío Dursley a la fuerza"),
        ],
      ),
      // P7: Avengers (Solo texto)
      Question(
        questionText: "¿Cuál es el nombre real del villano Thanos en las películas de Avengers?",
        type: QuestionType.textOnly,
        correctOptionIndex: 3,
        options: [
          Option(text: "A) Loki"),
          Option(text: "B) Ultron"),
          Option(text: "C) Red Skull"),
          Option(text: "D) Thanos (es su nombre real de Titán)"),
        ],
      ),
      // P8: 500 días con ella (Solo texto)
      Question(
        questionText: "¿Cuál es el grupo musical favorito que comparten Tom y Summer (ella) en '500 días con ella'?",
        type: QuestionType.textOnly,
        correctOptionIndex: 2,
        options: [
          Option(text: "A) The Beatles"),
          Option(text: "B) Radiohead"),
          Option(text: "C) The Smiths"),
          Option(text: "D) Oasis"),
        ],
      ),
      // P9: El Extraño Mundo de Jack (Solo texto)
      Question(
        questionText: "¿Cuál es el nombre de la festividad que Jack Skellington descubre y desea celebrar por cuenta propia?",
        type: QuestionType.textOnly,
        correctOptionIndex: 1,
        options: [
          Option(text: "A) Acción de Gracias"),
          Option(text: "B) Navidad"),
          Option(text: "C) Pascua"),
          Option(text: "D) Año Nuevo"),
        ],
      ),
      // P10: Coraline (Solo texto)
      Question(
        questionText: "¿A través de qué objeto en la nueva casa logra Coraline cruzar hacia el 'Otro Lado'?",
        type: QuestionType.textOnly,
        correctOptionIndex: 0,
        options: [
          Option(text: "A) Una pequeña puerta secreta"),
          Option(text: "B) Un espejo antiguo"),
          Option(text: "C) Un armario ropero"),
          Option(text: "D) Una chimenea abandonada"),
        ],
      ),
    ],
  ),
];

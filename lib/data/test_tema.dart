class FichaTema {
  final String pregunta;
  final String respuesta;

  FichaTema({
    required this.pregunta,
    required this.respuesta,
  });
}

class FichasPorTema {
  static final Map<int, List<FichaTema>> fichasPorTema = {
    1: [
      FichaTema(
        pregunta: '¿Cuándo comenzó la historia del vino?',
        respuesta: 'La producción de vino comenzó hace más de 8,000 años en Mesopotamia, alrededor del 6000 a.C.',
      ),
      FichaTema(
        pregunta: '¿Qué civilización expandió el vino por Europa?',
        respuesta: 'El Imperio Romano fue clave en la expansión del vino por toda Europa, refinando técnicas y creando rutas comerciales.',
      ),
      FichaTema(
        pregunta: '¿Qué papel jugaron los monasterios?',
        respuesta: 'Los monasterios medievales fueron centros de innovación vinícola, preservando y mejorando las técnicas de elaboración.',
      ),
      FichaTema(
        pregunta: '¿Cuál es la importancia cultural del vino?',
        respuesta: 'El vino ha influido en religiones, comercio, arte y tradiciones sociales a lo largo de toda la historia humana.',
      ),
      FichaTema(
        pregunta: '¿Cómo evolucionó la vinificación moderna?',
        respuesta: 'La era moderna trajo la revolución industrial y técnicas científicas que transformaron la producción vinícola.',
      ),
    ],
    
    2: [
      FichaTema(
        pregunta: '¿Qué es el terroir?',
        respuesta: 'El terroir es el concepto francés que engloba clima, suelo y tradición, definiendo las características únicas de cada región.',
      ),
      FichaTema(
        pregunta: '¿Cuál es la diferencia entre Viejo y Nuevo Mundo?',
        respuesta: 'Viejo Mundo (Europa) se basa en tradiciones milenarias; Nuevo Mundo (América, Australia) enfatiza innovación y técnicas modernas.',
      ),
      FichaTema(
        pregunta: 'Nombra 3 regiones francesas famosas',
        respuesta: 'Burdeos (tintos elegantes), Borgoña (Pinot Noir y Chardonnay), Champagne (espumosos de lujo).',
      ),
      FichaTema(
        pregunta: '¿Qué caracteriza a los vinos de Mendoza?',
        respuesta: 'Mendoza, Argentina, es famosa mundialmente por sus excepcionales vinos Malbec de alta altitud.',
      ),
      FichaTema(
        pregunta: '¿Por qué es importante el clima en viticultura?',
        respuesta: 'El clima determina la maduración de la uva, los niveles de azúcar, acidez y desarrollo de aromas característicos.',
      ),
    ],
    
    3: [
      FichaTema(
        pregunta: "¿Por qué Cabernet Sauvignon es 'el rey'?",
        respuesta: 'Por su estructura, taninos potentes, capacidad de guarda y versatilidad para crear vinos complejos y longevos.',
      ),
      FichaTema(
        pregunta: '¿Qué caracteriza al Chardonnay?',
        respuesta: 'Es la uva blanca más versátil, puede ser desde fresca y mineral hasta cremosa y con crianza en barrica.',
      ),
      FichaTema(
        pregunta: '¿Cuál es la uva española por excelencia?',
        respuesta: 'Tempranillo, especialmente exitosa en Rioja y Ribera del Duero, aporta elegancia y potencial de guarda.',
      ),
      FichaTema(
        pregunta: '¿Cuántas variedades de uva existen?',
        respuesta: 'Más de 10,000 variedades, pero solo unas pocas decenas se cultivan para producir vinos de calidad.',
      ),
      FichaTema(
        pregunta: '¿Qué determina el carácter varietal?',
        respuesta: 'Cada variedad aporta características distintivas de aroma, sabor, estructura, color y potencial de envejecimiento.',
      ),
    ],
    
    22: [
      FichaTema(
        pregunta: '¿Cuántas secciones tiene la prueba final?',
        respuesta: '5 secciones: Historia (20 pts), Regiones (25 pts), Variedades (20 pts), Elaboración (15 pts), Cata y maridaje (20 pts).',
      ),
      FichaTema(
        pregunta: '¿Qué formatos incluye la evaluación?',
        respuesta: 'Preguntas de opción múltiple, casos prácticos de cata, ejercicios de maridaje e identificación de regiones.',
      ),
      FichaTema(
        pregunta: '¿Qué puntuación necesitas para ser experto?',
        respuesta: "90-100 puntos te classifican como 'Experto en vinos', demostrando dominio completo del temario.",
      ),
      FichaTema(
        pregunta: '¿Cuánto tiempo dura la prueba?',
        respuesta: '45 minutos es el tiempo recomendado para completar todas las secciones de la evaluación final.',
      ),
      FichaTema(
        pregunta: '¿Qué demuestra completar el curso?',
        respuesta: 'Demuestra tu dominio del fascinante mundo del vino, desde historia hasta técnicas modernas de cata y maridaje.',
      ),
    ],
  };

  static List<FichaTema> getFichasPorTema(int numeroTema) {
    return fichasPorTema[numeroTema] ?? _getFichasGenericas(numeroTema);
  }
  
  static List<FichaTema> _getFichasGenericas(int numeroTema) {
    return [
      FichaTema(
        pregunta: '¿Qué aprenderás en este tema?',
        respuesta: 'Conceptos fundamentales del Tema $numeroTema que complementan tu formación vinícola integral.',
      ),
      FichaTema(
        pregunta: '¿Está disponible el contenido completo?',
        respuesta: 'Este tema está en desarrollo y estará disponible en futuras actualizaciones del curso.',
      ),
      FichaTema(
        pregunta: '¿Qué hacer mientras tanto?',
        respuesta: 'Puedes continuar con otros temas disponibles y repasar los contenidos ya estudiados.',
      ),
      FichaTema(
        pregunta: '¿Cuándo estará listo?',
        respuesta: 'Trabajamos constantemente para completar todos los temas. ¡Gracias por tu paciencia!',
      ),
      FichaTema(
        pregunta: '¿Cómo se actualiza el curso?',
        respuesta: 'Las actualizaciones se realizan automáticamente, añadiendo nuevo contenido y mejorando la experiencia.',
      ),
    ];
  }
}
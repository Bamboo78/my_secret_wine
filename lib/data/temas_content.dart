class FichaTema {
  final String pregunta;
  final String respuesta;

  FichaTema({
    required this.pregunta,
    required this.respuesta,
  });
}

class TemaContent {
  final List<dynamic> contenido; // Puede contener String (texto) o FichaTema (ficha)

  TemaContent({
    required this.contenido,
  });
}

class TemasData {
  static final Map<int, TemaContent> temas = {
    1: TemaContent(
      contenido: [
        '''Historia del vino desde las civilizaciones antiguas.

El vino ha acompañado a la humanidad durante más de 8,000 años, siendo una de las bebidas más antiguas y culturalmente significativas del mundo. Sus orígenes se remontan a la antigua Mesopotamia, donde las primeras evidencias de producción vinícola datan del 6000 a.C.''',
        
        FichaTema(
          pregunta: '¿Cuándo comenzó la historia del vino?',
          respuesta: 'La producción de vino comenzó hace más de 8,000 años en Mesopotamia, alrededor del 6000 a.C.',
        ),

        '''Desarrollo histórico:
• Mesopotamia y Egipto: Primeras técnicas de fermentación
• Grecia y Roma: Expansión y refinamiento de métodos
• Edad Media: Monasterios como centros de innovación
• Era moderna: Revolución industrial y técnicas científicas''',

        FichaTema(
          pregunta: '¿Qué civilización expandió el vino por Europa?',
          respuesta: 'El Imperio Romano fue clave en la expansión del vino por toda Europa, refinando técnicas y creando rutas comerciales.',
        ),

        '''El vino no solo es una bebida, sino un elemento cultural que ha influido en religiones, comercio, arte y tradiciones sociales a lo largo de la historia.

Los monasterios medievales fueron centros de innovación vinícola, preservando y mejorando las técnicas de elaboración durante siglos oscuros para el conocimiento.''',

        FichaTema(
          pregunta: '¿Qué papel jugaron los monasterios?',
          respuesta: 'Los monasterios medievales fueron centros de innovación vinícola, preservando y mejorando las técnicas de elaboración.',
        ),
      ],
    ),
    
    2: TemaContent(
      contenido: [
        '''Las principales zonas productoras de vino del mundo.

El terroir, concepto francés que engloba clima, suelo y tradición, define las características únicas de cada región vinícola. Exploremos las zonas más prestigiosas:''',

        FichaTema(
          pregunta: '¿Qué es el terroir?',
          respuesta: 'El terroir es el concepto francés que engloba clima, suelo y tradición, definiendo las características únicas de cada región.',
        ),

        '''EUROPA - Viejo Mundo:
• Francia: Burdeos, Borgoña, Champagne, Valle del Loira
• Italia: Toscana, Piamonte, Véneto
• España: Rioja, Ribera del Duero, Rías Baixas
• Alemania: Valle del Rin, Mosela''',

        FichaTema(
          pregunta: '¿Cuál es la diferencia entre Viejo y Nuevo Mundo?',
          respuesta: 'Viejo Mundo (Europa) se basa en tradiciones milenarias; Nuevo Mundo (América, Australia) enfatiza innovación y técnicas modernas.',
        ),

        '''AMÉRICA - Nuevo Mundo:
• Estados Unidos: Valle de Napa, Sonoma, Oregón
• Chile: Valle de Maipo, Casablanca, Colchagua
• Argentina: Mendoza, Salta
• Australia: Valle de Barossa, Hunter Valley

Cada región aporta características distintivas basadas en su clima, suelo y tradiciones vitivinícolas.''',

        FichaTema(
          pregunta: '¿Qué caracteriza a los vinos de Mendoza?',
          respuesta: 'Mendoza, Argentina, es famosa mundialmente por sus excepcionales vinos Malbec de alta altitud.',
        ),
      ],
    ),

    3: TemaContent(
      contenido: [
        '''Variedades de uva y su influencia en el vino.

Existen más de 10,000 variedades de uva en el mundo, pero solo unas pocas decenas son ampliamente cultivadas para la producción de vino de calidad.''',

        FichaTema(
          pregunta: '¿Cuántas variedades de uva existen?',
          respuesta: 'Más de 10,000 variedades, pero solo unas pocas decenas se cultivan para producir vinos de calidad.',
        ),

        '''TINTAS PRINCIPALES:
• Cabernet Sauvignon: Rey de las tintas, estructura y taninos
• Merlot: Suavidad y elegancia
• Pinot Noir: Elegancia y finura borgoñona
• Syrah/Shiraz: Potencia y especias
• Tempranillo: Uva española por excelencia''',

        FichaTema(
          pregunta: "¿Por qué Cabernet Sauvignon es 'el rey'?",
          respuesta: 'Por su estructura, taninos potentes, capacidad de guarda y versatilidad para crear vinos complejos y longevos.',
        ),

        '''BLANCAS PRINCIPALES:
• Chardonnay: Versatilidad y complejidad
• Sauvignon Blanc: Frescura y acidez
• Riesling: Aromática y mineral
• Albariño: Atlántica y fresca
• Verdejo: Expresión castellana

Cada variedad aporta características distintivas de aroma, sabor, estructura y potencial de guarda.''',

        FichaTema(
          pregunta: '¿Qué caracteriza al Chardonnay?',
          respuesta: 'Es la uva blanca más versátil, puede ser desde fresca y mineral hasta cremosa y con crianza en barrica.',
        ),
      ],
    ),

    23: TemaContent(
      contenido: [
        '''Evaluación integral de conocimientos vinícolas.

Esta prueba final evaluará todo lo aprendido durante el curso My Secret Wine. La evaluación incluye diferentes secciones:''',

        FichaTema(
          pregunta: '¿Cuántas secciones tiene la prueba final?',
          respuesta: '5 secciones: Historia (20 pts), Regiones (25 pts), Variedades (20 pts), Elaboración (15 pts), Cata y maridaje (20 pts).',
        ),

        '''SECCIONES DE LA PRUEBA:
1. Historia y tradición (20 puntos)
2. Regiones vinícolas (25 puntos)
3. Variedades de uva (20 puntos)
4. Proceso de elaboración (15 puntos)
5. Cata y maridaje (20 puntos)

FORMATO:
• Preguntas de opción múltiple
• Casos prácticos de cata
• Ejercicios de maridaje
• Identificación de regiones''',

        FichaTema(
          pregunta: '¿Qué formatos incluye la evaluación?',
          respuesta: 'Preguntas de opción múltiple, casos prácticos de cata, ejercicios de maridaje e identificación de regiones.',
        ),

        '''CRITERIOS DE EVALUACIÓN:
• 90-100: Experto en vinos
• 80-89: Conocimientos avanzados
• 70-79: Nivel intermedio
• 60-69: Conocimientos básicos
• <60: Necesita repasar

¡Demuestra todo lo que has aprendido sobre el fascinante mundo del vino!''',

        FichaTema(
          pregunta: '¿Qué puntuación necesitas para ser experto?',
          respuesta: "90-100 puntos te clasifican como 'Experto en vinos', demostrando dominio completo del temario.",
        ),
      ],
    ),
  };

  static TemaContent? getTema(int numero) {
    return temas[numero];
  }

  static TemaContent getTemaPorDefecto(int numero) {
    return TemaContent(
      contenido: [
        '''Contenido del tema $numero próximamente disponible.

Este tema se encuentra en desarrollo y estará disponible en futuras actualizaciones del curso.''',

        FichaTema(
          pregunta: '¿Qué aprenderás en este tema?',
          respuesta: 'Conceptos fundamentales del Tema $numero que complementan tu formación vinícola integral.',
        ),

        '''Mientras tanto, puedes:
• Continuar con los otros temas disponibles
• Repasar los contenidos ya estudiados
• Practicar con los ejercicios de cata

¡Gracias por tu paciencia mientras completamos todo el contenido del curso!''',

        FichaTema(
          pregunta: '¿Cuándo estará listo?',
          respuesta: 'Trabajamos constantemente para completar todos los temas. ¡Gracias por tu paciencia!',
        ),
      ],
    );
  }
}
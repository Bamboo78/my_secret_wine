class PreguntaTest {
  final String pregunta;
  final List<String> opciones;
  final int respuestaCorrecta;
  final String explicacion;

  PreguntaTest({
    required this.pregunta,
    required this.opciones,
    required this.respuestaCorrecta,
    required this.explicacion,
  });
}

class TestPorTema {
  static final Map<int, List<PreguntaTest>> preguntasPorTema = {
    1: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],
    
    2: [
      PreguntaTest(
        pregunta: "¿Cuál de estas regiones pertenece al 'Nuevo Mundo' vinícola?",
        opciones: ['Borgoña', 'Toscana', 'Valle de Napa', 'Rioja'],
        respuestaCorrecta: 2,
        explicacion: "Valle de Napa en California es una región del 'Nuevo Mundo', mientras que las otras son regiones tradicionales europeas del 'Viejo Mundo'.",
      ),
      PreguntaTest(
        pregunta: '¿Qué concepto francés engloba clima, suelo y tradición vinícola?',
        opciones: ['Appellation', 'Terroir', 'Vintage', 'Cuvée'],
        respuestaCorrecta: 1,
        explicacion: 'Terroir es el concepto francés que describe la combinación única de factores geográficos, climáticos y culturales que caracterizan un viñedo.',
      ),
      PreguntaTest(
        pregunta: '¿Cuál es la región vinícola más famosa de Francia?',
        opciones: ['Alsacia', 'Burdeos', 'Provenza', 'Languedoc'],
        respuestaCorrecta: 1,
        explicacion: 'Burdeos es la región vinícola más prestigiosa de Francia, conocida por sus vinos tintos de alta calidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué país del Nuevo Mundo es famoso por sus vinos Malbec?',
        opciones: ['Chile', 'Australia', 'Argentina', 'Estados Unidos'],
        respuestaCorrecta: 2,
        explicacion: 'Argentina, especialmente la región de Mendoza, es mundialmente reconocida por sus excelentes vinos Malbec.',
      ),
      PreguntaTest(
        pregunta: '¿Cuál es la principal diferencia entre vinos del Viejo y Nuevo Mundo?',
        opciones: ['El tipo de uva', 'La temperatura', 'Tradición vs innovación', 'El alcohol'],
        respuestaCorrecta: 2,
        explicacion: 'La principal diferencia radica en que el Viejo Mundo se basa en tradiciones milenarias, mientras el Nuevo Mundo enfatiza la innovación.',
      ),
    ],
    
    3: [
      PreguntaTest(
        pregunta: "¿Qué variedad de uva es conocida como 'el rey de las tintas'?",
        opciones: ['Merlot', 'Pinot Noir', 'Cabernet Sauvignon', 'Tempranillo'],
        respuestaCorrecta: 2,
        explicacion: "Cabernet Sauvignon es conocida como 'el rey de las tintas' por su estructura, taninos y capacidad de guarda.",
      ),
      PreguntaTest(
        pregunta: '¿Cuál de estas es una variedad de uva blanca?',
        opciones: ['Syrah', 'Chardonnay', 'Merlot', 'Cabernet'],
        respuestaCorrecta: 1,
        explicacion: 'Chardonnay es una de las variedades de uva blanca más versátiles y populares del mundo.',
      ),
      PreguntaTest(
        pregunta: "¿Qué uva española es considerada 'por excelencia'?",
        opciones: ['Garnacha', 'Tempranillo', 'Monastrell', 'Bobal'],
        respuestaCorrecta: 1,
        explicacion: 'Tempranillo es considerada la uva española por excelencia, especialmente en regiones como Rioja y Ribera del Duero.',
      ),
      PreguntaTest(
        pregunta: '¿Aproximadamente cuántas variedades de uva existen en el mundo?',
        opciones: ['1,000', '5,000', '10,000', '20,000'],
        respuestaCorrecta: 2,
        explicacion: 'Existen más de 10,000 variedades de uva en el mundo, aunque solo unas pocas decenas se usan para vinos de calidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué característica define principalmente una variedad de uva?',
        opciones: ['El color', 'El tamaño', 'Aroma y sabor', 'La región'],
        respuestaCorrecta: 2,
        explicacion: 'Cada variedad aporta características distintivas de aroma, sabor, estructura y potencial de guarda.',
      ),
    ],
    
    4: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],
    
    5: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    6: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    7: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    8: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    9: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    10: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    11: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    12: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    13: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    14: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    15: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    16: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    17: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    18: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    19: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    20: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    21: [
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      PreguntaTest(
        pregunta: '¿Qué civilización antigua fue clave en la expansión del vino?',
        opciones: ['Egipcia', 'Romana', 'Griega', 'Persa'],
        respuestaCorrecta: 1,
        explicacion: 'El Imperio Romano fue fundamental en la expansión y refinamiento de las técnicas vinícolas por todo su territorio.',
      ),
      PreguntaTest(
        pregunta: '¿En qué período los monasterios jugaron un papel importante en la vinicultura?',
        opciones: ['Antigüedad', 'Edad Media', 'Renacimiento', 'Era Moderna'],
        respuestaCorrecta: 1,
        explicacion: 'Durante la Edad Media, los monasterios fueron centros de innovación vinícola y preservaron las técnicas de elaboración.',
      ),
      PreguntaTest(
        pregunta: '¿Cuántos años aproximadamente tiene la tradición vinícola?',
        opciones: ['4,000 años', '6,000 años', '8,000 años', '10,000 años'],
        respuestaCorrecta: 2,
        explicacion: 'La tradición vinícola tiene más de 8,000 años, siendo una de las bebidas más antiguas de la humanidad.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aspecto cultural NO está tradicionalmente asociado con el vino?',
        opciones: ['Religión', 'Comercio', 'Arte', 'Tecnología moderna'],
        respuestaCorrecta: 3,
        explicacion: 'El vino ha estado asociado históricamente con religión, comercio y arte, mientras que la tecnología moderna es un desarrollo reciente.',
      ),
    ],

    22: [
      // Pregunta representativa del Tema 1 - Historia
      PreguntaTest(
        pregunta: '¿En qué región se originó la producción de vino hace más de 8,000 años?',
        opciones: ['Francia', 'Mesopotamia', 'Italia', 'España'],
        respuestaCorrecta: 1,
        explicacion: 'Mesopotamia es considerada la cuna de la vitivinicultura, con evidencias de producción vinícola que datan del 6000 a.C.',
      ),
      // Pregunta representativa del Tema 2 - Regiones
      PreguntaTest(
        pregunta: '¿Qué concepto francés engloba clima, suelo y tradición vinícola?',
        opciones: ['Appellation', 'Terroir', 'Vintage', 'Cuvée'],
        respuestaCorrecta: 1,
        explicacion: 'Terroir es el concepto francés que describe la combinación única de factores geográficos, climáticos y culturales que caracterizan un viñedo.',
      ),
      // Pregunta representativa del Tema 3 - Variedades
      PreguntaTest(
        pregunta: "¿Qué variedad de uva es conocida como 'el rey de las tintas'?",
        opciones: ['Merlot', 'Pinot Noir', 'Cabernet Sauvignon', 'Tempranillo'],
        respuestaCorrecta: 2,
        explicacion: "Cabernet Sauvignon es conocida como 'el rey de las tintas' por su estructura, taninos y capacidad de guarda.",
      ),
      // Pregunta representativa del Tema 4 - Proceso de vinificación
      PreguntaTest(
        pregunta: '¿Cuál es el primer paso en la elaboración del vino tinto?',
        opciones: ['Fermentación', 'Despalillado', 'Prensado', 'Clarificación'],
        respuestaCorrecta: 1,
        explicacion: 'El despalillado es el proceso de separar las uvas del raspón y es uno de los primeros pasos en la vinificación.',
      ),
      // Pregunta representativa del Tema 5 - Cata de vinos
      PreguntaTest(
        pregunta: '¿Cuál es el orden correcto en la cata de vinos?',
        opciones: ['Gusto, vista, olfato', 'Vista, olfato, gusto', 'Olfato, vista, gusto', 'Vista, gusto, olfato'],
        respuestaCorrecta: 1,
        explicacion: 'La secuencia correcta de cata es: vista (fase visual), olfato (fase olfativa) y gusto (fase gustativa).',
      ),
      // Pregunta representativa del Tema 6 - Maridaje
      PreguntaTest(
        pregunta: '¿Qué vino marida mejor con pescados y mariscos?',
        opciones: ['Tinto joven', 'Vino blanco', 'Tinto reserva', 'Vino dulce'],
        respuestaCorrecta: 1,
        explicacion: 'Los vinos blancos, especialmente los secos y frescos, son el maridaje clásico para pescados y mariscos.',
      ),
      // Pregunta representativa del Tema 7 - Temperatura de servicio
      PreguntaTest(
        pregunta: '¿A qué temperatura se debe servir un vino tinto joven?',
        opciones: ['6-8°C', '10-12°C', '14-16°C', '18-20°C'],
        respuestaCorrecta: 2,
        explicacion: 'Los vinos tintos jóvenes se sirven a 14-16°C para apreciar mejor sus aromas frutales y estructura.',
      ),
      // Pregunta representativa del Tema 8 - Copas y servicio
      PreguntaTest(
        pregunta: '¿Qué forma de copa es ideal para vinos tintos con cuerpo?',
        opciones: ['Copa estrecha', 'Copa ancha', 'Copa tipo flauta', 'Copa pequeña'],
        respuestaCorrecta: 1,
        explicacion: 'Las copas anchas permiten que los vinos tintos con cuerpo se oxigenen y liberen mejor sus aromas complejos.',
      ),
      // Pregunta representativa del Tema 9 - Conservación
      PreguntaTest(
        pregunta: '¿Cuál es la posición ideal para almacenar botellas de vino?',
        opciones: ['Vertical', 'Horizontal', 'Inclinada 45°', 'No importa'],
        respuestaCorrecta: 1,
        explicacion: 'Las botellas deben almacenarse horizontalmente para mantener el corcho húmedo y evitar la entrada de aire.',
      ),
      // Pregunta representativa del Tema 10 - Denominaciones de origen
      PreguntaTest(
        pregunta: "¿Qué significa 'D.O.' en el etiquetado de vinos españoles?",
        opciones: ['Denominación Original', 'Denominación de Origen', 'Depósito Oficial', 'Destino Oficial'],
        respuestaCorrecta: 1,
        explicacion: 'D.O. significa Denominación de Origen, que garantiza que el vino procede de una región específica con características particulares.',
      ),
      // Pregunta representativa del Tema 11 - Vendimia
      PreguntaTest(
        pregunta: '¿En qué estación se realiza la vendimia en el hemisferio norte?',
        opciones: ['Primavera', 'Verano', 'Otoño', 'Invierno'],
        respuestaCorrecta: 2,
        explicacion: 'En el hemisferio norte, la vendimia se realiza en otoño, típicamente entre septiembre y octubre.',
      ),
      // Pregunta representativa del Tema 12 - Crianza y envejecimiento
      PreguntaTest(
        pregunta: "¿Cuánto tiempo mínimo debe permanecer en barrica un vino 'Crianza'?",
        opciones: ['6 meses', '12 meses', '18 meses', '24 meses'],
        respuestaCorrecta: 1,
        explicacion: "Un vino 'Crianza' debe permanecer mínimo 12 meses en barrica de roble antes de su comercialización.",
      ),
      // Pregunta representativa del Tema 13 - Tipos de vino
      PreguntaTest(
        pregunta: '¿Cuál es la característica principal del vino rosado?',
        opciones: ['Fermentación larga', 'Contacto breve con hollejos', 'Doble fermentación', 'Sin fermentación'],
        respuestaCorrecta: 1,
        explicacion: 'El vino rosado se caracteriza por un contacto breve con los hollejos de uvas tintas, lo que le da su color rosado.',
      ),
      // Pregunta representativa del Tema 14 - Espumosos
      PreguntaTest(
        pregunta: '¿Qué método se utiliza para producir Champagne?',
        opciones: ['Charmat', 'Tradicional', 'Gasificación', 'Continuo'],
        respuestaCorrecta: 1,
        explicacion: 'El Champagne se produce mediante el método tradicional (champenoise) con segunda fermentación en botella.',
      ),
      // Pregunta representativa del Tema 15 - Vinos dulces
      PreguntaTest(
        pregunta: '¿Cómo se obtienen los vinos de vendimia tardía?',
        opciones: ['Fermentación parada', 'Uvas sobremaduras', 'Adición de azúcar', 'Concentración'],
        respuestaCorrecta: 1,
        explicacion: 'Los vinos de vendimia tardía se obtienen de uvas que se dejan en la vid más tiempo para concentrar azúcares.',
      ),
      // Pregunta representativa del Tema 16 - Defectos del vino
      PreguntaTest(
        pregunta: "¿Qué defecto produce el olor a 'corcho' en el vino?",
        opciones: ['Oxidación', 'TCA (tricloroanisol)', 'Sulfitos', 'Acidez'],
        respuestaCorrecta: 1,
        explicacion: 'El olor a corcho es causado por TCA (tricloroanisol), un compuesto que contamina el corcho y el vino.',
      ),
      // Pregunta representativa del Tema 17 - Viticultura
      PreguntaTest(
        pregunta: "¿Qué es el 'envero' en viticultura?",
        opciones: ['Poda de la vid', 'Cambio de color de la uva', 'Plantación', 'Cosecha'],
        respuestaCorrecta: 1,
        explicacion: 'El envero es el momento en que las uvas cambian de color, indicando el inicio de la maduración.',
      ),
      // Pregunta representativa del Tema 18 - Suelos y clima
      PreguntaTest(
        pregunta: '¿Qué tipo de suelo es ideal para el cultivo de la vid?',
        opciones: ['Muy fértil', 'Pobre y drenado', 'Arcilloso compacto', 'Muy húmedo'],
        respuestaCorrecta: 1,
        explicacion: 'Los suelos pobres y bien drenados son ideales para la vid, ya que la hacen trabajar y concentrar sabores.',
      ),
      // Pregunta representativa del Tema 19 - Etiquetado
      PreguntaTest(
        pregunta: '¿Qué información es obligatoria en la etiqueta de un vino?',
        opciones: ['Precio de venta', 'Graduación alcohólica', 'Año de plantación', 'Tipo de barrica'],
        respuestaCorrecta: 1,
        explicacion: 'La graduación alcohólica es información obligatoria que debe aparecer en todas las etiquetas de vino.',
      ),
      // Pregunta representativa del Tema 20 - Historia moderna
      PreguntaTest(
        pregunta: '¿Qué plaga devastó los viñedos europeos en el siglo XIX?',
        opciones: ['Mildiu', 'Oidio', 'Filoxera', 'Botrytis'],
        respuestaCorrecta: 2,
        explicacion: 'La filoxera fue la plaga que devastó los viñedos europeos en el siglo XIX, obligando a injertar sobre portainjertos americanos.',
      ),
      // Pregunta representativa del Tema 21 - Tendencias actuales
      PreguntaTest(
        pregunta: '¿Qué caracteriza a la viticultura ecológica?',
        opciones: ['Uso intensivo de químicos', 'Sin uso de pesticidas sintéticos', 'Mayor producción', 'Vendimia mecanizada'],
        respuestaCorrecta: 1,
        explicacion: 'La viticultura ecológica se caracteriza por no usar pesticidas ni fertilizantes sintéticos, respetando el medio ambiente.',
      ),
    ],
  };
  
  static List<PreguntaTest> getPreguntasPorTema(int numeroTema) {
    return preguntasPorTema[numeroTema] ?? _getPreguntasGenericas(numeroTema);
  }
  
  static List<PreguntaTest> _getPreguntasGenericas(int numeroTema) {
    return [
      PreguntaTest(
        pregunta: '¿Cuál es el tema principal de esta lección?',
        opciones: ['Tema $numeroTema', 'Historia general', 'Técnicas básicas', 'Conceptos avanzados'],
        respuestaCorrecta: 0,
        explicacion: 'Este tema se enfoca específicamente en el contenido del Tema $numeroTema del curso My Secret Wine.',
      ),
      PreguntaTest(
        pregunta: '¿Este contenido está disponible actualmente?',
        opciones: ['Sí, completo', 'En desarrollo', 'Parcialmente', 'No disponible'],
        respuestaCorrecta: 1,
        explicacion: 'Este tema se encuentra en desarrollo y estará disponible en futuras actualizaciones del curso.',
      ),
      PreguntaTest(
        pregunta: '¿Qué puedes hacer mientras se completa este contenido?',
        opciones: ['Esperar solamente', 'Continuar con otros temas', 'Abandonar el curso', 'Repetir temas'],
        respuestaCorrecta: 1,
        explicacion: 'Puedes continuar con los otros temas disponibles mientras completamos todo el contenido del curso.',
      ),
      PreguntaTest(
        pregunta: '¿Cuál es la duración estimada de este tema?',
        opciones: ['10 min', '15 min', '20 min', '25 min'],
        respuestaCorrecta: 1,
        explicacion: 'La duración estimada para este tema es de 15 minutos una vez que esté completamente desarrollado.',
      ),
      PreguntaTest(
        pregunta: '¿Cómo se actualiza el contenido del curso?',
        opciones: ['Manual', 'Automático', 'Por actualizaciones', 'No se actualiza'],
        respuestaCorrecta: 2,
        explicacion: 'El contenido se actualiza mediante actualizaciones del curso que incluyen nuevos temas y mejoras.',
      ),
    ];
  }
}
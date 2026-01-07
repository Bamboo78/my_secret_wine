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
        pregunta: '¿Qué civilización asoció el vino con Dionisio?',
        opciones: ['Egipcia', 'Griega', 'Mesopotámica', 'Romana'],
        respuestaCorrecta: 1,
        explicacion: 'Esta civilización vinculó el vino con Dionisio como símbolo de transformación, éxtasis y profunda conexión espiritual.',
      ),
      PreguntaTest(
        pregunta: '¿Dónde se originó el cultivo de la vid?',
        opciones: ['Egipto', 'Roma', 'Mesopotamia', 'Grecia'],
        respuestaCorrecta: 2,
        explicacion: 'Los registros históricos sitúan el origen de la viticultura en esta región y en la zona del Cáucaso.',
      ),
      PreguntaTest(
        pregunta: '¿Quiénes conservaron el arte del vino en la Edad Media?',
        opciones: ['Los comerciantes', 'Los monjes en los monasterios', 'Los alquimistas', 'Los soldados'],
        respuestaCorrecta: 1,
        explicacion: 'Las órdenes religiosas preservaron el conocimiento vitivinícola y mejoraron las técnicas de cultivo durante siglos.',
      ),
      PreguntaTest(
        pregunta: '¿Qué representa el vino en la historia?',
        opciones: ['Un simple producto agrícola', 'Un símbolo de celebración y espiritualidad', 'Una moda pasajera', 'Un sustituto del agua'],
        respuestaCorrecta: 1,
        explicacion: 'A lo largo del tiempo, el vino ha sido un elemento central en rituales sociales y religiosos.',
      ),
      PreguntaTest(
        pregunta: '¿Cuál fue el primer continente productor de vino?',
        opciones: ['Europa', 'Asia', 'América', 'África'],
        respuestaCorrecta: 1,
        explicacion: 'Las primeras evidencias de producción vinícola se localizan en la región del Cáucaso y la antigua Mesopotamia.',
      ),
    ],
    
    2: [
      PreguntaTest(
        pregunta: '¿Qué es el “terroir”?',
        opciones: ['Un tipo de uva', 'Una técnica de fermentación', 'El conjunto de clima, suelo y entorno', 'La marca de una bodega'],
        respuestaCorrecta: 2,
        explicacion: 'Este concepto define cómo los factores geográficos y climáticos influyen directamente en la personalidad del vino.',
      ),
      PreguntaTest(
        pregunta: '¿Cuánto puede vivir una vid?',
        opciones: ['Hasta 30 años', 'Más de 100 años', 'Solo una temporada', 'Máximo 10 años'],
        respuestaCorrecta: 1,
        explicacion: 'Una vid bien cuidada puede vivir un siglo, produciendo uvas con una calidad y concentración excepcionales.',
      ),
      PreguntaTest(
        pregunta: '¿Qué factor influye más en el aroma del vino?',
        opciones: ['La temperatura de servicio', 'La variedad de uva', ' El tipo de botella', 'El color de la etiqueta'],
        respuestaCorrecta: 1,
        explicacion: 'La genética de cada tipo de uva determina los aromas primarios fundamentales que percibiremos en el vino.',
      ),
      PreguntaTest(
        pregunta: '¿Qué diferencia una uva de clima frío de una de clima cálido?',
        opciones: ['La acidez y el grado de azúcar', 'El color', 'El número de semillas', 'El tamaño de la hoja'],
        respuestaCorrecta: 0,
        explicacion: 'Los climas fríos suelen aportar mayor acidez, mientras que los cálidos favorecen una mayor concentración de azúcares.',
      ),
      PreguntaTest(
        pregunta: '¿Qué representa la vid en la viticultura?',
        opciones: ['Un producto de rápido crecimiento', 'Un símbolo de transformación y sabiduría natural', 'Una planta exclusivamente decorativa', 'Una fuente de madera'],
        respuestaCorrecta: 1,
        explicacion: 'La planta refleja la adaptación al entorno y el ciclo vital constante de la naturaleza.',
      ),
    ],
    
    3: [
      PreguntaTest(
        pregunta: '¿Qué proceso convierte el mosto en vino?',
        opciones: ['Clarificación', 'Fermentación', 'Crianza', 'Estabilización'],
        respuestaCorrecta: 1,
        explicacion: 'Es el proceso biológico donde las levaduras transforman los azúcares naturales del mosto en alcohol etílico.',
      ),
      PreguntaTest(
        pregunta: '¿Qué etapa da los aromas más complejos?',
        opciones: ['Fermentación', 'Crianza', 'Embotellado', 'Vendimia'],
        respuestaCorrecta: 1,
        explicacion: 'Durante esta etapa de reposo, el vino desarrolla matices complejos y elegantes gracias al contacto con la madera.',
      ),
      PreguntaTest(
        pregunta: '¿Qué es una crianza?',
        opciones: ['Un proceso de reposo y afinamiento del vino', 'El prensado de la uva', 'El filtrado previo al embotellado', 'La recogida del fruto'],
        respuestaCorrecta: 0,
        explicacion: 'Consiste en el tiempo de maduración necesario para que el vino alcance su equilibrio y suavidad óptimos.',
      ),
      PreguntaTest(
        pregunta: '¿Qué diferencia un vino joven de uno reserva?',
        opciones: ['El tipo de uva', 'El tiempo de maduración', 'El color', 'El grado alcohólico'],
        respuestaCorrecta: 1,
        explicacion: 'Los vinos reserva requieren periodos más largos de envejecimiento en barrica y botella que los jóvenes.',
      ),
      PreguntaTest(
        pregunta: '¿Cuándo se embotella el vino?',
        opciones: ['Antes de la fermentación', 'Durante la crianza', 'Después de su afinamiento final', 'Inmediatamente tras el prensado'],
        respuestaCorrecta: 2,
        explicacion: 'El embotellado es la fase culminante que ocurre una vez el vino ha completado su ciclo de mejora.',
      ),
    ],
    
    4: [
      PreguntaTest(
        pregunta: '¿De dónde proviene el color del vino tinto?',
        opciones: ['Del jugo de la uva', 'De las pieles de la uva durante la maceración', 'De la fermentación maloláctica', 'De los pigmentos del corcho'],
        respuestaCorrecta: 1,
        explicacion: 'El color se extrae de los antocianos presentes en la piel mediante el contacto prolongado con el mosto.',
      ),
      PreguntaTest(
        pregunta: '¿Cuál es la temperatura ideal para servirlo?',
        opciones: ['Entre 8 y 10 °C', 'Entre 12 y 14 °C', 'Entre 16 y 18 °C', 'Entre 20 y 22 °C'],
        respuestaCorrecta: 1,
        explicacion: 'Este rango térmico permite que los taninos se suavicen y los aromas complejos se expresen correctamente.',
      ),
      PreguntaTest(
        pregunta: '¿Qué tipo de copa se recomienda para tintos con cuerpo?',
        opciones: ['Estrecha tipo flauta', 'Amplia tipo Bordeaux o Burgundy', 'Pequeña tipo licor', 'Vaso de cristal grueso'],
        respuestaCorrecta: 1,
        explicacion: 'Una copa amplia favorece la oxigenación necesaria para que los vinos potentes desplieguen todos sus matices.',
      ),
      PreguntaTest(
        pregunta: '¿Con qué tipo de comida combina mejor un tinto reserva?',
        opciones: ['Ensaladas y postres', 'Carnes rojas, embutidos o quesos curados', 'Mariscos y pescados blancos', 'Frutas tropicales frescas'],
        respuestaCorrecta: 1,
        explicacion: 'La estructura y taninos del vino armonizan perfectamente con la grasa y la intensidad de estos alimentos.',
      ),
      PreguntaTest(
        pregunta: '¿Qué variedad de uva es común en tintos con mucho cuerpo?',
        opciones: ['Sauvignon Blanc', 'Garnacha Blanca', 'Cabernet Sauvignon', 'Verdejo'],
        respuestaCorrecta: 2,
        explicacion: 'Es una uva de piel gruesa que aporta gran estructura, color intenso y potencial de envejecimiento.',
      ),
    ],
    
    5: [
      PreguntaTest(
        pregunta: '¿A qué temperatura se sirve el vino blanco joven?',
        opciones: ['4–6 °C', '8–10 °C', '14–16 °C', '18–20 °C'],
        respuestaCorrecta: 1,
        explicacion: 'Esta temperatura resalta la frescura y la acidez sin llegar a adormecer los aromas frutales delicados.',
      ),
      PreguntaTest(
        pregunta: '¿Qué tipo de copa se usa para blancos aromáticos?',
        opciones: ['Tipo flauta', 'De gran volumen', 'Alargada o tipo tulipaga', 'De balón de tinto'],
        respuestaCorrecta: 2,
        explicacion: 'Su diseño ayuda a concentrar los aromas volátiles y dirige el líquido a la parte fresca de la lengua.',
      ),
      PreguntaTest(
        pregunta: '¿Qué plato combina mejor con un blanco joven?',
        opciones: ['Cordero asado', 'Pescado o marisco', 'Estofado de ternera', 'Carne de caza mayor'],
        respuestaCorrecta: 1,
        explicacion: 'La ligereza del blanco respeta la delicadeza del pescado, mientras su acidez limpia el paladar.',
      ),
      PreguntaTest(
        pregunta: '¿Qué variedad es común en vinos blancos frescos y herbáceos?',
        opciones: ['Sauvignon Blanc', 'Syrah', 'Tempranillo', 'Monastrell'],
        respuestaCorrecta: 0,
        explicacion: 'Es una uva famosa por sus notas cítricas y vegetales que aportan mucha viveza al vino.',
      ),
      PreguntaTest(
        pregunta: '¿Qué aporta la crianza en barrica a un vino blanco?',
        opciones: ['Pérdida total de aroma', 'Aromas de vainilla, miel y mayor untuosidad', 'Un color rosado brillante', 'Mayor grado de burbujas'],
        respuestaCorrecta: 1,
        explicacion: 'El contacto con la madera otorga complejidad, cuerpo y notas dulces especiadas muy valoradas en la cata.',
      ),
    ],

    6: [
      PreguntaTest(
        pregunta: '¿Cómo se obtiene el color rosado?',
        opciones: ['Mezclando vino tinto y blanco', 'Contacto breve con las pieles tintas', 'Añadiendo colorantes naturales', 'Por oxidación al sol'],
        respuestaCorrecta: 1,
        explicacion: 'El mosto se deja macerar con los hollejos tintos apenas unas horas para extraer poco color.',
      ),
      PreguntaTest(
        pregunta: '¿Qué temperatura es ideal para servirlo?',
        opciones: ['6–8 °C', '10–12 °C', '14–16 °C', '18–20 °C'],
        respuestaCorrecta: 1,
        explicacion: 'Permite que los aromas de frutas rojas se perciban bien manteniendo una sensación refrescante y equilibrada.',
      ),
      PreguntaTest(
        pregunta: '¿Qué tipo de copa se recomienda para rosados?',
        opciones: ['Pequeña tipo flauta', 'Ancha de tinto gran reserva', 'Mediana tipo universal', 'Vaso de barro tradicional'],
        respuestaCorrecta: 2,
        explicacion: 'Su tamaño equilibrado permite disfrutar tanto de la frescura visual como de su perfil aromático intermedio.',
      ),
      PreguntaTest(
        pregunta: '¿Qué alimentos lo acompañan mejor por su versatilidad?',
        opciones: ['Carnes rojas pesadas', 'Tapas, ensaladas o platos de pasta', 'Solo postres dulces', 'Quesos muy fuertes y picantes'],
        respuestaCorrecta: 1,
        explicacion: 'El rosado es ideal para maridar con cocina mediterránea ligera y platos que no requieren gran potencia.',
      ),
      PreguntaTest(
        pregunta: '¿Qué variedad es una de las más comunes para rosados de calidad?',
        opciones: ['Garnacha', 'Albariño', 'Palomino Fino', 'Pedro Ximénez'],
        respuestaCorrecta: 0,
        explicacion: 'La Garnacha aporta un color atractivo y notas golosas de fresa y frambuesa muy características.',
      ),
    ],

    7: [
      PreguntaTest(
        pregunta: '¿Qué tipo de copa se usa tradicionalmente para espumosos?',
        opciones: ['Ancha y baja', 'Flauta o tulipa', 'De vino tinto', 'De brandy'],
        respuestaCorrecta: 1,
        explicacion: 'Su diseño alargado ayuda a retener el gas carbónico y permite apreciar el ascenso de la burbuja.',
      ),
      PreguntaTest(
        pregunta: '¿A qué temperatura se debe servir el Champagne o Cava?',
        opciones: ['10–12 °C', '6–8 °C', '14–16 °C', 'Temperatura ambiente (20 °C)'],
        respuestaCorrecta: 1,
        explicacion: 'El frío intenso mantiene el gas integrado y potencia la sensación punzante y vivaz de la burbuja.',
      ),
      PreguntaTest(
        pregunta: '¿Qué diferencia fundamental hay entre Cava y Champagne?',
        opciones: ['Proceden de regiones geográficas y uvas distintas', 'Solo cambia el nombre comercial', 'Uno no tiene burbujas', 'El Cava es solo para postres'],
        respuestaCorrecta: 0,
        explicacion: 'Aunque comparten el método tradicional, el clima, el suelo y las variedades locales los hacen productos diferentes.',
      ),
      PreguntaTest(
        pregunta: '¿Qué alimentos maridan mejor con un espumoso seco?',
        opciones: ['Solo platos con mucho picante', 'Sushi, ostras o aperitivos salados', 'Postres con mucho chocolate', 'Carnes de caza muy intensas'],
        respuestaCorrecta: 1,
        explicacion: 'La burbuja y la acidez limpian el paladar de la grasa del pescado crudo y los mariscos.',
      ),
      PreguntaTest(
        pregunta: '¿Qué figura histórica es clave en la historia del Champagne?',
        opciones: ['Louis Pasteur', 'Dom Pérignon', 'Napoleón Bonaparte', 'El Rey Sol (Luis XIV)'],
        respuestaCorrecta: 1,
        explicacion: 'Este monje realizó aportes fundamentales en el control de la efervescencia y el ensamblaje de uvas.',
      ),
    ],

    8: [
      PreguntaTest(
        pregunta: '¿Qué sistema de crianza es emblemático en Jerez?',
        opciones: ['Tanques de acero inoxidable', 'Ánforas de barro cerradas', 'Criaderas y soleras', 'Barricas enterradas bajo tierra'],
        respuestaCorrecta: 2,
        explicacion: 'Es un sistema dinámico de mezcla de vinos de distintas añadas que asegura una calidad constante.',
      ),
      PreguntaTest(
        pregunta: '¿A qué temperatura se sirve un vino dulce natural?',
        opciones: ['Muy caliente (30 °C)', 'A menos de 4 °C', 'A temperatura ambiente', 'Entre 10–14 °C según su cuerpo'],
        respuestaCorrecta: 3,
        explicacion: 'Esta temperatura permite que el dulzor sea agradable sin saturar el paladar ni ocultar los aromas.',
      ),
      PreguntaTest(
        pregunta: '¿Qué tipo de copa se usa para degustar vinos de postre?',
        opciones: ['De tinto grande', 'De espumoso', 'Pequeña o tipo "catavinos"', 'De licor muy ancha'],
        respuestaCorrecta: 2,
        explicacion: 'Su pequeño tamaño es ideal para servirlos en pequeñas dosis debido a su alta concentración y potencia.',
      ),
      PreguntaTest(
        pregunta: '¿Con qué plato genera un maridaje de contraste perfecto?',
        opciones: ['Queso azul o foie gras', 'Pescados blancos al vapor', 'Sopas y consomés claros', 'Ensaladas verdes amargas'],
        respuestaCorrecta: 0,
        explicacion: 'El dulzor del vino equilibra de forma excelente la salinidad y la grasa de estos alimentos potentes.',
      ),
      PreguntaTest(
        pregunta: '¿Qué uva es famosa por producir vinos dulces muy densos?',
        opciones: ['Garnacha', 'Pedro Ximénez', 'Tempranillo', 'Sauvignon Blanc'],
        respuestaCorrecta: 1,
        explicacion: 'Esta uva pasificada produce vinos de una densidad extrema y aromas a pasas, higos y dátiles.',
      ),
    ],

    9: [
      PreguntaTest(
        pregunta: '¿Cuáles son las tres fases de una cata técnica?',
        opciones: ['Visual, sonora y táctil', 'Vista, olfato y gusto', 'Aroma, sabor y precio', 'Color, cuerpo y etiqueta'],
        respuestaCorrecta: 1,
        explicacion: 'Son los tres pasos secuenciales necesarios para analizar de forma objetiva todas las propiedades del vino.',
      ),
      PreguntaTest(
        pregunta: '¿Por qué los profesionales suelen escupir el vino en catas largas?',
        opciones: ['Porque el vino es de mala calidad', 'Por una norma religiosa antigua', 'Para no mancharse los dientes', 'Para evitar los efectos del alcohol y mantener el juicio'],
        respuestaCorrecta: 3,
        explicacion: 'Evitar la ingesta permite catar decenas de vinos manteniendo la lucidez y la precisión sensorial intactas.',
      ),
      PreguntaTest(
        pregunta: '¿Qué buscamos analizar principalmente en la fase visual?',
        opciones: ['El aroma a flores', 'El color, el brillo y la densidad (lágrimas)', 'El grado de alcohol exacto', 'El tipo de corcho usado'],
        respuestaCorrecta: 1,
        explicacion: 'Estos elementos nos dan pistas sobre la edad del vino, su concentración y su estado de conservación.',
      ),
      PreguntaTest(
        pregunta: '¿Qué nos revela la fase olfativa?',
        opciones: ['El precio de la botella', 'La temperatura del local', 'La complejidad aromática y el estilo del vino', 'El material de la etiqueta'],
        respuestaCorrecta: 2,
        explicacion: 'Identificamos aromas primarios, secundarios y terciarios que nos cuentan la historia y elaboración del vino.',
      ),
      PreguntaTest(
        pregunta: '¿Qué significa que un vino tenga "cuerpo" en boca?',
        opciones: ['Sensación de densidad, volumen y estructura', 'Que tiene muchas burbujas', 'Que es excesivamente ácido', 'Que tiene sedimentos en el fondo'],
        respuestaCorrecta: 0,
        explicacion: 'El cuerpo se refiere a la untuosidad y peso que el líquido deja al pasar por el paladar.',
      ),
    ],

    10: [
      PreguntaTest(
        pregunta: '¿Qué efecto tiene servir un vino demasiado frío?',
        opciones: ['Los aromas se vuelven más potentes', 'El vino se vuelve más dulce', 'Se intensifica el color visual', 'Los aromas se bloquean y el vino parece plano'],
        respuestaCorrecta: 3,
        explicacion: 'El frío excesivo impide que las moléculas aromáticas se volatilicen, dificultando la percepción de sus matices.',
      ),
      PreguntaTest(
        pregunta: '¿Cuál es la temperatura recomendada para un espumoso?',
        opciones: ['6–8 °C', '12–14 °C', '18–20 °C', '4 °C'],
        respuestaCorrecta: 0,
        explicacion: 'El frío ayuda a que la burbuja se integre mejor y el vino resulte refrescante y punzante.',
      ),
      PreguntaTest(
        pregunta: '¿A qué temperatura se debe servir un tinto con mucha crianza?',
        opciones: ['10–12 °C', '16–18 °C', '22–24 °C', '8–10 °C'],
        respuestaCorrecta: 1,
        explicacion: 'Esta temperatura "de bodega" es la ideal para apreciar la complejidad de la madera sin resaltar el alcohol.',
      ),
      PreguntaTest(
        pregunta: '¿Qué sucede si el vino se sirve muy caliente (más de 20 °C)?',
        opciones: ['Resalta la fruta fresca', 'El alcohol se vuelve agresivo y dominante', 'La acidez se vuelve muy agradable', 'El color se aclara'],
        respuestaCorrecta: 1,
        explicacion: 'El calor evapora el alcohol rápidamente, desequilibrando el vino y haciendo que queme en nariz y boca.',
      ),
      PreguntaTest(
        pregunta: '¿Por qué la temperatura afecta la cata?',
        opciones: ['Cambia la variedad de uva', 'Altera el diseño de la copa', 'Solo influye en el precio final', 'Modifica la percepción de aromas, sabores y alcohol'],
        respuestaCorrecta: 3,
        explicacion: 'La temperatura es un factor físico que puede mejorar o arruinar la experiencia sensorial de cualquier vino.',
      ),
    ],

    11: [
      PreguntaTest(
        pregunta: '¿Por qué influye la forma de la copa en la cata?',
        opciones: ['Por pura moda estética', 'Para que no se rompa', 'Dirige los aromas y el vino a zonas clave', 'Para enfriar el vino más rápido'],
        respuestaCorrecta: 2,
        explicacion: 'El diseño está pensado para potenciar los aromas y guiar el líquido hacia receptores gustativos específicos.',
      ),
      PreguntaTest(
        pregunta: '¿Qué copa es ideal para un vino tinto potente?',
        opciones: ['Copa pequeña de jerez', 'Copa amplia tipo Bordeaux', 'Copa flauta estrecha', 'Vaso corto de cristal'],
        respuestaCorrecta: 1,
        explicacion: 'Su gran apertura y volumen permiten que el vino se oxigene y los aromas intensos respiren mejor.',
      ),
      PreguntaTest(
        pregunta: '¿Por qué los blancos usan copas un poco más estrechas?',
        opciones: ['Para servir menos cantidad', 'Porque tienen menos alcohol', 'Por una tradición romana antigua', 'Para concentrar aromas delicados y mantener el frío'],
        respuestaCorrecta: 3,
        explicacion: 'Al tener menos superficie expuesta, el vino mantiene su temperatura baja y focaliza mejor sus matices sutiles.',
      ),
      PreguntaTest(
        pregunta: '¿Cuál es la ventaja de una copa tipo tulipa para espumosos?',
        opciones: ['No tiene ventajas', 'Mantiene la burbuja y permite oler el vino', 'Es más fácil de lavar', 'Cabe más cantidad de vino'],
        respuestaCorrecta: 1,
        explicacion: 'Al ser un poco más ancha en el centro que la flauta, deja que los aromas se desarrollen.',
      ),
      PreguntaTest(
        pregunta: '¿Qué efecto tiene un borde fino en la copa?',
        opciones: ['Se rompe más fácilmente', 'No tiene ninguna función técnica', 'Permite que el vino fluya suavemente al paladar', 'Solo es para vinos caros'],
        respuestaCorrecta: 2,
        explicacion: 'Un borde fino facilita que el líquido entre en contacto directo con la lengua sin interferencias táctiles gruesas.',
      ),
    ],

    12: [
      PreguntaTest(
        pregunta: '¿Qué representaba el vino en las pinturas de la Antigua Grecia?',
        opciones: ['Solo una bebida de esclavos', 'Celebración, ritual y la figura de Dionisio', 'Un veneno prohibido', 'Un elemento puramente decorativo'],
        respuestaCorrecta: 1,
        explicacion: 'El vino era un eje cultural ligado a la espiritualidad, la filosofía y las festividades comunitarias.',
      ),
      PreguntaTest(
        pregunta: '¿Qué dios romano aparece frecuentemente en el arte vinícola?',
        opciones: ['Júpiter', 'Marte', 'Neptuno', 'Baco'],
        respuestaCorrecta: 3,
        explicacion: 'Baco es el equivalente romano de Dionisio, representando el vino, el teatro y la liberación de los sentidos.',
      ),
      PreguntaTest(
        pregunta: '¿Qué simbolizaba el vino en las naturalezas muertas (bodegones)?',
        opciones: ['El fin del mundo', 'El placer terrenal, la abundancia o la fugacidad', 'La falta de alimentos', 'Un anuncio publicitario antiguo'],
        respuestaCorrecta: 1,
        explicacion: 'El vino en los bodegones solía invitar a la reflexión sobre el disfrute de la vida y el paso del tiempo.',
      ),
      PreguntaTest(
        pregunta: '¿Cómo se interpreta el vino en el arte moderno?',
        opciones: ['Como algo exclusivo de la iglesia', 'Como símbolo de hedonismo, libertad y ocio', 'Solo como un producto químico', 'No se representa nunca'],
        respuestaCorrecta: 1,
        explicacion: 'En la actualidad, el vino en el arte refleja el estilo de vida, el placer sensorial y la cultura social.',
      ),
      PreguntaTest(
        pregunta: '¿Qué sentido artístico se explora más en la cultura del vino?',
        opciones: ['La sinestesia entre vista, olfato y gusto', 'Solo el oído (sonido del descorche)', 'El tacto de la botella fría', 'La lectura de libros de historia'],
        respuestaCorrecta: 0,
        explicacion: 'El vino es una obra de arte líquida que requiere la integración de múltiples sentidos para ser apreciada.',
      ),
    ],

    13: [
      PreguntaTest(
        pregunta: '¿Qué es el maridaje?',
        opciones: ['El proceso de hacer vino', 'La unión armónica entre un vino y una comida', 'La etiqueta de una botella', 'El tiempo de guarda en barrica'],
        respuestaCorrecta: 1,
        explicacion: 'El objetivo es que ambos elementos se potencien mutuamente creando una experiencia gastronómica superior al conjunto.',
      ),
      PreguntaTest(
        pregunta: '¿Cuál es el maridaje clásico para un pescado blanco al horno?',
        opciones: ['Tinto con mucha madera', 'Vino dulce muy denso', 'Blanco joven y fresco', 'Cerveza negra intensa'],
        respuestaCorrecta: 2,
        explicacion: 'La acidez y ligereza del blanco realzan el sabor suave del pescado sin anular sus matices marinos.',
      ),
      PreguntaTest(
        pregunta: '¿Qué maridaje se recomienda para una carne de buey a la brasa?',
        opciones: ['Blanco dulce', 'Tinto con cuerpo y crianza', 'Rosado muy pálido', 'Agua con gas'],
        respuestaCorrecta: 1,
        explicacion: 'Los taninos del vino tinto ayudan a limpiar la grasa de la carne mientras su estructura aguanta la intensidad.',
      ),
      PreguntaTest(
        pregunta: '¿Por qué el vino dulce marida bien con el queso azul?',
        opciones: ['Porque son del mismo color', 'Porque el queso azul no tiene sabor', 'Es una moda sin fundamento técnico', 'Por contraste entre el dulzor y la salinidad fuerte'],
        respuestaCorrecta: 3,
        explicacion: 'El azúcar del vino suaviza la potencia picante y salada del queso, creando un equilibrio delicioso en boca.',
      ),
      PreguntaTest(
        pregunta: '¿Qué debemos evitar en un maridaje?',
        opciones: ['Beber vino y comer a la vez', 'Que uno de los dos domine y anule al otro', 'Usar copas de cristal', 'Hablar durante la comida'],
        respuestaCorrecta: 1,
        explicacion: 'El maridaje ideal busca el equilibrio; ningún elemento debe sobresalir tanto que impida disfrutar del otro.',
      ),
    ],

    14: [
      PreguntaTest(
        pregunta: '¿Puede la música influir en cómo nos sabe el vino?',
        opciones: ['No, es imposible', 'Sí, los estudios demuestran que afecta la percepción', 'Solo si la música está muy alta', 'Solo en vinos muy caros'],
        respuestaCorrecta: 1,
        explicacion: 'El cerebro integra estímulos auditivos y gustativos, pudiendo resaltar notas ácidas, dulces o complejas según el ritmo.',
      ),
      PreguntaTest(
        pregunta: '¿Qué estilo musical se asocia a menudo con un vino Chardonnay elegante?',
        opciones: ['Rock metálico pesado', 'Reggaetón comercial', 'Jazz suave o música de cámara', 'Techno industrial'],
        respuestaCorrecta: 2,
        explicacion: 'La sofisticación y fluidez de estos géneros acompañan la textura cremosa y equilibrada del vino Chardonnay.',
      ),
      PreguntaTest(
        pregunta: '¿Qué tipo de música armoniza con la vivacidad de un espumoso?',
        opciones: ['Blues melancólico', 'Marchas militares', 'Música para dormir', 'Pop alegre o electrónica rítmica'],
        respuestaCorrecta: 3,
        explicacion: 'El ritmo constante y alegre de estas músicas refleja la energía y el dinamismo de las burbujas.',
      ),
      PreguntaTest(
        pregunta: '¿Cómo influye el tempo (velocidad) de la música en la cata?',
        opciones: ['La música rápida invita a beber más rápido', 'No influye en absoluto', 'La música lenta quita el sabor', 'Solo influye en el color visual'],
        respuestaCorrecta: 0,
        explicacion: 'Existe una correlación psicológica entre el ritmo ambiental y la cadencia con la que degustamos el vino.',
      ),
      PreguntaTest(
        pregunta: '¿Qué es el "maridaje sonoro"?',
        opciones: ['Cantar mientras se pisa la uva', 'El ruido que hace el corcho al salir', 'Elegir música que potencie las sensaciones del vino', 'Escuchar el sonido de las burbujas'],
        respuestaCorrecta: 2,
        explicacion: 'Es la búsqueda de una atmósfera auditiva que resuene con el carácter y la estructura del vino catado.',
      ),
    ],

    15: [
      PreguntaTest(
        pregunta: '¿Qué es el enoturismo?',
        opciones: ['Vender vino por internet', 'Viajar para conocer bodegas, viñedos y cultura vinícola', 'Estudiar para ser sumiller', 'Beber vino en un hotel de lujo'],
        respuestaCorrecta: 1,
        explicacion: 'Es una forma de turismo experiencial que conecta al visitante con el origen y la elaboración del producto.',
      ),
      PreguntaTest(
        pregunta: '¿Qué país es famoso mundialmente por sus "Châteaux" en Burdeos?',
        opciones: ['España', 'Francia', 'Francia', 'Argentina'],
        respuestaCorrecta: 1,
        explicacion: 'Francia es un referente histórico en arquitectura vinícola y clasificación de grandes viñedos de prestigio global.',
      ),
      PreguntaTest(
        pregunta: '¿Qué región argentina es el destino líder para el Malbec?',
        opciones: ['Salta', 'Patagonia', 'Buenos Aires', 'Mendoza'],
        respuestaCorrecta: 3,
        explicacion: 'Mendoza concentra la mayor producción de Malbec de alta calidad y una oferta enoturística de primer nivel.',
      ),
      PreguntaTest(
        pregunta: '¿Qué actividad es típica en una visita enoturística?',
        opciones: ['Comprar ropa de marca', 'Ver una película de cine', 'Aprender a conducir tractores', 'Paseo por el viñedo, visita a la bodega y cata'],
        respuestaCorrecta: 3,
        explicacion: 'El objetivo es comprender todo el proceso desde la tierra hasta la copa a través de la experiencia directa.',
      ),
      PreguntaTest(
        pregunta: '¿Por qué es importante el enoturismo para las regiones rurales?',
        opciones: ['Para que la gente no viva allí', 'Para dinamizar la economía y preservar la cultura local', 'Para construir edificios altos', 'Solo para vender botellas baratas'],
        respuestaCorrecta: 3,
        explicacion: 'Atrae inversión, genera empleo y protege el patrimonio vitivinícola y paisajístico de las zonas producto',
      ),
    ],

    16: [
      PreguntaTest(
        pregunta: '¿A quién se le suele servir una pequeña cantidad primero para probar?',
        opciones: ['A la persona de mayor edad', 'A quien ha pedido el vino para que dé el visto bueno', 'Al camarero para su control', 'Al invitado más importante'],
        respuestaCorrecta: 1,
        explicacion: 'El objetivo es que el cliente verifique que el vino no tiene defectos antes de servir a los demás.',
      ),
      PreguntaTest(
        pregunta: '¿Cuál es el orden correcto de servicio en una mesa?',
        opciones: ['Niños, mujeres y hombres', 'Invitados (mujeres primero), luego anfitrión', 'En el sentido de las agujas del reloj', 'A todos a la vez con una máquina'],
        respuestaCorrecta: 1,
        explicacion: 'Siguiendo el protocolo, se sirve primero a los invitados como cortesía y finalmente a quien invitó.',
      ),
      PreguntaTest(
        pregunta: '¿Cuánto se debe llenar una copa de vino tinto?',
        opciones: ['Hasta el borde superior', 'Solo unas gotas de muestra', 'Hasta la mitad exacta', 'Aproximadamente un tercio de su capacidad'],
        respuestaCorrecta: 3,
        explicacion: 'Dejar espacio vacío es vital para que los aromas se concentren en la copa y el vino respire.',
      ),
      PreguntaTest(
        pregunta: '¿Cómo se debe sujetar una copa de vino?',
        opciones: ['Por el cáliz con toda la mano', 'Por el tallo o la base', 'Metiendo el dedo dentro de la copa', 'Con las dos manos a la vez'],
        respuestaCorrecta: 1,
        explicacion: 'Sujetarla por el tallo evita calentar el líquido con la temperatura corporal de nuestra mano.',
      ),
      PreguntaTest(
        pregunta: '¿Qué debemos hacer si un vino tiene olor a corcho (moho)?',
        opciones: ['Beberlo rápido para que se pase', 'Pedir educadamente que cambien la botella', 'Añadirle azúcar para ocultar el olor', 'Echarle la culpa a la copa'],
        respuestaCorrecta: 1,
        explicacion: 'Es un defecto físico real que invalida la cata; cualquier establecimiento profesional cambiará la botella sin problema.',
      ),
    ],

    17: [
      PreguntaTest(
        pregunta: '¿Qué nos indica la "Añada" en la etiqueta?',
        opciones: [' El año en que se cosechó la uva', 'MesoEl año en que se vendió la botellapotamia', 'Cuántos años puede durar el vino', 'La fecha de fundación de la bodega'],
        respuestaCorrecta: 0,
        explicacion: 'Es un dato crucial para conocer la calidad de la cosecha según las condiciones climáticas de ese año.',
      ),
      PreguntaTest(
        pregunta: '¿Qué significa que un vino tenga Denominación de Origen (D.O.)?',
        opciones: ['Que es el vino más barato', 'Que cumple normas de calidad y procedencia específicas', 'Que solo se puede beber en esa ciudad', 'Que la botella es de diseño especial'],
        respuestaCorrecta: 1,
        explicacion: 'Certifica que el vino ha sido elaborado siguiendo controles estrictos y con uvas de una región protegida.',
      ),
      PreguntaTest(
        pregunta: '¿Dónde suele aparecer el grado alcohólico?',
        opciones: ['Es un secreto del fabricante', 'Obligatoriamente en la etiqueta o contraetiqueta', 'En el fondo de la botella', 'Solo se sabe probando el vino'],
        respuestaCorrecta: 1,
        explicacion: 'Es una información legal requerida que indica el porcentaje de alcohol etílico por volumen de líquido.',
      ),
      PreguntaTest(
        pregunta: '¿Qué información nos da la contraetiqueta normalmente?',
        opciones: ['No sirve para nada', 'El precio exacto en supermercados', 'Notas de cata, historia de la bodega o maridajes sugeridos', 'Un mapa de todas las bodegas del país'],
        respuestaCorrecta: 2,
        explicacion: 'Ayuda al consumidor a entender mejor el estilo del vino y cómo disfrutarlo de la mejor manera.',
      ),
      PreguntaTest(
        pregunta: '¿Por qué es importante fijarse en la variedad de uva?',
        opciones: ['Por curiosidad botánica', 'Define el perfil aromático y de sabor que vamos a encontrar', 'Para saber el color de la hoja', 'Para adivinar el precio'],
        respuestaCorrecta: 1,
        explicacion: 'Cada uva tiene características únicas; conocerlas nos permite elegir el estilo de vino que más nos gusta.',
      ),
    ],

    18: [
      PreguntaTest(
        pregunta: '¿Cuál es el peor enemigo del vino en su conservación?',
        opciones: ['El sonido de la música', 'Las oscilaciones bruscas de temperatura y la luz directa', 'El polvo en la botella', 'Guardarlo en un mueble de madera'],
        respuestaCorrecta: 1,
        explicacion: 'El calor extremo acelera el envejecimiento y la luz degrada los compuestos sensibles, arruinando el vino rápidamente.',
      ),
      PreguntaTest(
        pregunta: '¿Por qué las botellas con corcho natural se guardan tumbadas?',
        opciones: ['Para que no se caigan', 'Para que el vino humedezca el corcho y no entre aire', 'Por una cuestión de espacio en la estantería', 'Para que el sedimento suba al cuello'],
        respuestaCorrecta: 1,
        explicacion: 'Un corcho húmedo se mantiene expandido, garantizando un cierre hermético que protege al vino de la oxidación.',
      ),
      PreguntaTest(
        pregunta: '¿Qué es una cava climatizada?',
        opciones: ['Una nevera de comida normal', 'Un armario con luces de colores', 'Un tipo de vino espumoso', 'Un electrodoméstico que mantiene temperatura y humedad constantes'],
        respuestaCorrecta: 3,
        explicacion: 'UEs el lugar ideal para el almacenamiento doméstico, ya que imita las condiciones de una bodega profesional.',
      ),
      PreguntaTest(
        pregunta: '¿Se puede guardar un vino abierto por mucho tiempo?',
        opciones: ['Sí, dura meses como el primer día', 'No, el oxígeno empieza a estropearlo en 2 o 3 días', 'Solo si es un vino muy barato', 'Sí, si le volvemos a poner el corcho al revés'],
        respuestaCorrecta: 2,
        explicacion: 'El contacto con el aire oxida el vino, haciendo que pierda frescura y termine convirtiéndose en vinagre.',
      ),
      PreguntaTest(
        pregunta: '¿Qué función tiene la humedad en una bodega?',
        opciones: ['Evitar que los corchos se sequen y se vuelvan quebradizos', 'Enfriar el vino más rápido', 'Mantener las etiquetas mojadas', 'No tiene ninguna importancia técnica'],
        respuestaCorrecta: 0,
        explicacion: 'Una humedad de entre el 60% y el 80% es vital para la salud a largo plazo de los tapones naturales.',
      ),
    ],

    19: [
      PreguntaTest(
        pregunta: '¿En qué debemos fijarnos primero al elegir un vino en un restaurante?',
        opciones: ['En el diseño de la letra de la carta', 'En el tipo de comida que vamos a degustar', 'En pedir siempre el vino más caro para impresionar', 'En el nombre más difícil de pronunciar'],
        respuestaCorrecta: 1,
        explicacion: 'La comida marca el camino; elegir un vino que armonice con el plato asegura el éxito de la cena.',
      ),
      PreguntaTest(
        pregunta: '¿Es siempre el vino más caro el mejor?',
        opciones: ['Sí, el precio garantiza la calidad absoluta', 'Solo si es un vino importado', 'No necesariamente; hay excelentes vinos con gran relación calidad-precio', 'El precio no tiene nada que ver con la calidad'],
        respuestaCorrecta: 2,
        explicacion: 'Muchas veces pagamos marca o escasez; el conocimiento permite encontrar "joyas" a precios muy razonables.',
      ),
      PreguntaTest(
        pregunta: '¿Para qué sirve preguntar al sumiller?',
        opciones: ['Para que nos venda lo que no quiere nadie', 'Para recibir asesoramiento experto basado en nuestros gustos y presupuesto', 'Para demostrar que no sabemos nada', 'Solo para que nos traiga la cuenta'],
        respuestaCorrecta: 1,
        explicacion: 'El sumiller conoce su bodega y puede descubrirnos vinos nuevos que encajen perfectamente con nuestra comida.',
      ),
      PreguntaTest(
        pregunta: '¿Qué indica que un vino es "monovarietal"?',
        opciones: ['Que está elaborado principalmente con un solo tipo de uva', 'Que se ha hecho en una sola bodega', 'Que se vende en una sola tienda', 'Que solo tiene un aroma'],
        respuestaCorrecta: 0,
        explicacion: 'Estos vinos permiten apreciar de forma clara y pura la personalidad de una uva específica.',
      ),
      PreguntaTest(
        pregunta: '¿Qué factor influye en nuestra elección personal final?',
        opciones: ['La opinión de la mesa de al lado', 'Solo el anuncio de la televisión', 'El color del mantel del restaurante', 'Nuestra propia experiencia, gustos y curiosidad'],
        respuestaCorrecta: 3,
        explicacion: 'Al final, el mejor vino es aquel que a ti te gusta y te hace disfrutar del momento.',
      ),
    ],

    20: [
      PreguntaTest(
        pregunta: '¿Qué es un vino ecológico?',
        opciones: ['Un vino que no tiene alcohol', 'Elaborado sin pesticidas ni abonos químicos sintéticos', 'Que se vende sin botella de cristal', 'Que se cultiva solo con agua de lluvia'],
        respuestaCorrecta: 1,
        explicacion: 'Prioriza el respeto al medio ambiente y la biodiversidad en el viñedo mediante prácticas naturales y sostenibles.',
      ),
      PreguntaTest(
        pregunta: '¿Qué diferencia a un vino vegano?',
        opciones: ['No utiliza productos de origen animal en la clarificación', 'Está hecho solo con uvas verdes', 'No se puede beber con carne', 'Las viñas se plantan en huertos veganos'],
        respuestaCorrecta: 0,
        explicacion: 'En el proceso de limpieza del vino se sustituyen gelatinas animales o clara de huevo por proteínas vegetales.',
      ),
      PreguntaTest(
        pregunta: '¿Cómo ayuda la tecnología en la bodega moderna?',
        opciones: ['Para que el vino se haga solo sin humanos', 'Para controlar con precisión temperaturas, fermentación y riego', 'Para ponerle sabor artificial al vino', 'No ha cambiado nada en mil años'],
        respuestaCorrecta: 1,
        explicacion: 'La tecnología permite minimizar errores y garantizar que la calidad de la uva se mantenga intacta hasta la botella.',
      ),
      PreguntaTest(
        pregunta: '¿Qué es la viticultura biodinámica?',
        opciones: ['Cultivar uvas muy rápido con máquinas', 'Un enfoque holístico que considera al viñedo un organismo vivo conectado al cosmos', 'Un tipo de gimnasia para los viticultores', 'Usar drones para todo el proceso'],
        respuestaCorrecta: 1,
        explicacion: 'Sigue los ciclos lunares y utiliza preparados naturales para fortalecer la tierra y la salud de la planta.',
      ),
      PreguntaTest(
        pregunta: '¿Por qué es importante el envase sostenible?',
        opciones: ['Para que la botella pese más', 'Solo para ahorrar dinero a la bodega', 'Porque el cristal contamina el sabor', 'Para reducir la huella de carbono y el impacto ambiental'],
        respuestaCorrecta: 3,
        explicacion: 'El uso de botellas más ligeras y materiales reciclables es clave para la responsabilidad ecológica de la industria.',
      ),
    ],

    21: [
      PreguntaTest(
        pregunta: '¿Cuál es el primer paso para montar una bodega en casa?',
        opciones: ['Comprar mil botellas de golpe', 'Buscar un lugar fresco, oscuro y sin vibraciones', 'Comprar las copas más caras del mercado', 'Poner luces fluorescentes potentes'],
        respuestaCorrecta: 1,
        explicacion: 'La ubicación es lo más importante para asegurar que los vinos no se degraden antes de ser consumidos.',
      ),
      PreguntaTest(
        pregunta: '¿Qué significa la regla FIFO en la bodega?',
        opciones: ['Filtrar el vino antes de beberlo', '"Primero en entrar, primero en salir" (rotación de stock)', 'Frio intenso al final del día', 'Solo comprar vinos franceses'],
        respuestaCorrecta: 1,
        explicacion: 'Ayuda a gestionar el consumo para que las botellas más antiguas se beban antes de que pierdan facultades.',
      ),
      PreguntaTest(
        pregunta: '¿Para qué sirve llevar un cuaderno de cata?',
        opciones: ['Para recordar qué nos gustó de cada vino y su evolución', 'Para que la bodega parezca más profesional', 'Para dibujar las etiquetas', 'Solo para anotar el precio'],
        respuestaCorrecta: 0,
        explicacion: 'Registrar nuestras impresiones nos ayuda a aprender y a perfeccionar nuestro criterio a la hora de comprar.',
      ),
      PreguntaTest(
        pregunta: '¿Debemos guardar todos los vinos por muchos años?',
        opciones: ['Sí, el vino siempre mejora con el tiempo', 'No, la mayoría de vinos están hechos para ser consumidos en 1 o 2 años', 'Solo los vinos blancos se guardan', 'Solo los vinos que no tienen corcho'],
        respuestaCorrecta: 1,
        explicacion: 'Solo un porcentaje pequeño de vinos tiene estructura suficiente para mejorar positivamente con una guarda larga de décadas.',
      ),
      PreguntaTest(
        pregunta: '¿Qué herramienta es básica para abrir un vino correctamente?',
        opciones: ['Un martillo y un clavo', 'Meter el corcho hacia dentro con el dedo', 'Agitar la botella con fuerza', 'Un sacacorchos de calidad (de dos tiempos)'],
        respuestaCorrecta: 3,
        explicacion: 'Un buen sacacorchos permite extraer el tapón de forma limpia y segura sin romperlo ni agitar el vino.',
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
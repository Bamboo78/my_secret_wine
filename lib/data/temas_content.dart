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
        '''1. Introducción: Del origen mítico al brindis moderno
Desde las antiguas civilizaciones hasta nuestros días, el vino ha sido mucho más que una simple bebida. Es un símbolo que ha trascendido épocas, culturas y creencias, ocupando un lugar privilegiado tanto en los banquetes de reyes como en la mesa cotidiana.
El vino ha representado placer, celebración, poder, espiritualidad y arte. Ha sido protagonista en rituales religiosos, ofrendas a los dioses, pactos entre naciones y brindis entre amigos. A través de sus sabores, colores y aromas, el vino narra historias milenarias, conectando al ser humano con la tierra y con sus raíces culturales.
La historia del vino no se mide solo en años, sino en transformación: de uvas silvestres fermentadas accidentalmente a complejos caldos creados con precisión científica. Su evolución es un reflejo de la evolución de la humanidad misma.''',
        
        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidades que despiertan la pasión por el vino 
		Los egipcios y el vino: Ya en el año 3000 a.C., los antiguos egipcios producían vino tinto, que reservaban para las clases altas. Los jeroglíficos en tumbas muestran procesos de prensado, fermentación y almacenamiento. Lo usaban tanto en banquetes como en rituales religiosos, asociándolo con la vida eterna.
		El vino como regalo divino en Grecia: En la mitología griega, el vino era un regalo de Dionisio, el dios del vino, el éxtasis y la fertilidad. Las fiestas en su honor, las Dionisíacas, eran celebraciones de libertad sensorial y espiritual, donde el vino era el vínculo entre lo terrenal y lo divino.
		Los romanos y la democratización del vino: Los romanos perfeccionaron las técnicas de cultivo de la vid y almacenaje del vino. Lo llevaron a todos los rincones del Imperio, desde Hispania hasta la Galia, asegurando así su expansión por Europa. También fueron los primeros en escribir tratados sobre viticultura y en usar barricas para su conservación.
''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: La evolución del vino en tres etapas clave
• Mesopotamia: El inicio del cultivo de la vid
En torno al año 6000 a.C., en las zonas que hoy corresponden a Georgia, Armenia e Irán, ya se cultivaban uvas silvestres. Los pueblos mesopotámicos fueron pioneros en el cultivo controlado de la vid y probablemente los primeros en observar el proceso natural de fermentación. El vino, en esta etapa, era reservado para las élites y las ofrendas a los dioses.
• Grecia y Roma: El culto al vino y su expansión
Los griegos no solo adoraban a Dionisio; también fueron grandes comerciantes y exportadores de vino por el Mediterráneo. Introdujeron el uso de ánforas y técnicas de mezcla con agua y especias.
Los romanos heredaron este amor por el vino y lo convirtieron en un símbolo de civilización. Fundaron viñedos en todo el Imperio, adaptando las variedades de uva a los diferentes climas y suelos. Con ellos, el vino dejó de ser un producto exclusivo y se convirtió en parte del día a día de todas las clases sociales.
• Edad Media: El vino y los monasterios como guardianes del saber
Tras la caída del Imperio Romano, fueron los monasterios cristianos los que preservaron el conocimiento vinícola. Los monjes no solo elaboraban vino para uso litúrgico, sino que mejoraron técnicas de cultivo, selección de cepas y envejecimiento. En regiones como Borgoña y Champaña (Francia), los monasterios sentaron las bases de lo que hoy conocemos como enología moderna.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    2: TemaContent(
      contenido: [
        '''1. Todo vino nace de una planta resistente, sabia y generosa: la vid.
La historia del vino no podría escribirse sin su protagonista principal: la vid (Vitis vinifera). Esta planta milenaria ha acompañado a la humanidad desde tiempos ancestrales, dando fruto a una de las bebidas más antiguas y culturalmente ricas de la historia: el vino.
La vid no es solo una planta agrícola. Es un símbolo de equilibrio entre el esfuerzo humano y la generosidad de la naturaleza. Requiere paciencia, cuidado y sabiduría. A lo largo de los siglos, ha demostrado una asombrosa capacidad de adaptación: puede crecer en climas extremos, adaptarse a suelos pobres y, sin embargo, ofrecer cosechas de enorme calidad.
¿Qué hace tan especial a la vid?
		Su longevidad.
		Su sensibilidad al entorno.
		Su capacidad de transformar el paisaje en sabor.
Comprender la vid es el primer paso para entender el vino. La cepa, sus raíces, sus hojas, sus ciclos… todo en ella está conectado con el resultado final en la copa. Su comportamiento frente al clima, la composición del suelo y la mano del viticultor determinarán los aromas, la estructura y la personalidad del vino.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidades de la vid 
Una sola vid puede vivir más de 100 años…
Así es. Aunque su producción máxima se da en los primeros 25 a 40 años, una vid puede vivir más de un siglo. Algunas cepas, especialmente en regiones tradicionales como Europa, aún producen uvas de calidad a los 80 o 90 años. A estas se las conoce como "viñas viejas", y suelen dar vinos más complejos y concentrados.
La longevidad de una vid también influye en el carácter del vino:
		Cepas jóvenes: vinos frescos, afrutados, de perfil más ligero.
		Cepas viejas: vinos con mayor profundidad, concentración y estructura.
La vid se adapta como pocas especies.
Una de sus cualidades más fascinantes es su plasticidad, es decir, su capacidad de adaptarse a distintas condiciones climáticas y geográficas. Dependiendo de dónde crezca, la misma variedad de uva puede cambiar por completo su perfil aromático y gustativo.
Esto significa que:
		Una uva Chardonnay cultivada en un clima fresco puede ofrecer notas cítricas y florales.
		La misma uva en un clima cálido puede dar sabores de frutas tropicales y mayor volumen en boca.
Cada cepa es una pequeña exploradora que traduce el mundo en sabor.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica – Factores que dan identidad al vino
Para que un vino tenga carácter, tres factores deben alinearse: clima, suelo y variedad.
1. Clima: la maduración de la uva depende del sol
El clima define la cantidad de sol y lluvia que recibe la vid. Esto influye directamente en:
		El grado de azúcar (y por lo tanto el nivel de alcohol).
		La acidez (más presente en climas fríos).
		La estructura aromática.
Ejemplo práctico:
		Clima frío: Riesling en Alemania – alta acidez, notas cítricas, menor graduación alcohólica.
		Clima cálido: Syrah en Australia – mayor cuerpo, frutas maduras, alcohol elevado.
2. Suelo (terroir): el alma del vino
El término francés “terroir” no tiene traducción exacta. Se refiere a la combinación del suelo, clima y trabajo humano en un lugar determinado.
Los suelos pueden ser:
		Calcáreos: vinos elegantes, con buena acidez.
		Volcánicos: vinos minerales, complejos.
		Arenosos: vinos más ligeros y aromáticos.
		Arcillosos: vinos potentes y estructurados.
El terroir da identidad al vino. Un vino con “expresión de terroir” transmite la historia del lugar donde nació.
3. Variedad: el alma de los aromas y el cuerpo
Cada variedad de uva (o cepa) tiene un perfil único:
		Cabernet Sauvignon: estructurado, taninos firmes, aromas a pimiento y frutas negras.
		Tempranillo: frutos rojos, cuero, especias.
		Albariño: cítricos, flores blancas, mineralidad.
La elección de la variedad debe ser adecuada al entorno. De lo contrario, el vino puede perder armonía.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),

    3: TemaContent(
      contenido: [
        '''1. Introducción: Del campo a la copa
El vino es el resultado de un proceso donde la naturaleza y el ser humano se entrelazan en perfecta armonía. Desde la elección de la uva hasta el momento en que el líquido descansa en la copa, cada fase influye en su carácter final.Podemos decir que el vino es una obra de arte líquida, moldeada por decisiones técnicas, intuiciones sensoriales y la paciencia del tiempo.
Todo comienza en el viñedo, el corazón de la calidad. Allí, el viticultor cuida la vid durante todo el año, buscando el equilibrio entre el sol, el agua y la madurez del fruto.Después llega el momento crucial de la vendimia, donde cada racimo es seleccionado con precisión. A partir de ahí, la uva inicia un viaje transformador que combina química, biología y pasión.
El objetivo final es simple pero sublime: preservar la esencia de la uva y potenciar su expresión a través de un proceso controlado que mantenga su pureza, aroma y equilibrio.
''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: La magia de la fermentación
La fermentación es el corazón del proceso vinícola. En esta etapa ocurre la transformación del mosto (zumo de uva) en vino gracias a la acción de las levaduras naturales o seleccionadas.Estas levaduras, microorganismos invisibles pero poderosos, se alimentan del azúcar presente en la uva y lo transforman en alcohol y dióxido de carbono. Este fenómeno es pura alquimia biológica.
Durante la fermentación, se liberan también compuestos aromáticos que dan forma al bouquet del vino. Dependiendo del tipo de levadura, la temperatura y el tiempo, se obtienen vinos más frutales, florales o complejos.
🔍 Dato curioso: En muchas bodegas tradicionales, aún se usa la fermentación espontánea, confiando en las levaduras autóctonas del viñedo. Esto da lugar a vinos con una identidad más local y auténtica, reflejo directo del terroir.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Las etapas principales
El proceso de elaboración del vino se puede dividir en cuatro grandes etapas. Cada una requiere precisión, experiencia y una profunda comprensión del equilibrio entre naturaleza y técnica.

1. Vendimia
Es la recolección de las uvas en el punto óptimo de madurez.El momento exacto varía según el clima, la variedad y el estilo de vino deseado.
		Vendimia temprana: produce vinos más frescos y con mayor acidez.
		Vendimia tardía: da lugar a vinos más dulces y maduros.Una vendimia manual garantiza una selección más cuidadosa del fruto, evitando uvas dañadas que podrían alterar la fermentación.

2. Fermentación
Una vez estrujadas las uvas, el mosto entra en contacto con las levaduras.En los tintos, el mosto fermenta junto a los hollejos (pieles), lo que aporta color y taninos. En los blancos, se separan para preservar la frescura y limpieza aromática.La temperatura se controla cuidadosamente:
		Tintos: 25–30 °C
		Blancos: 16–20 °CAsí se regula la intensidad aromática y la extracción de componentes.

3. Crianza
La crianza es el reposo controlado del vino tras la fermentación, un periodo en el que el vino evoluciona, se afina y alcanza su equilibrio.Puede realizarse en barricas de madera, depósitos de acero inoxidable, o botella, según el estilo que el enólogo desee conseguir.
Su objetivo principal es afinar, redondear y complejizar el vino, logrando un equilibrio entre fruta, estructura y aromas terciarios.

Tipos de recipiente y su influencia
Barrica de roble
La madera es porosa y permite una microoxigenación lenta que suaviza los taninos y aporta aromas sutiles.Existen dos tipos principales de roble empleados en la enología moderna:
		Roble francés (Quercus sessilis o Quercus robur):Grano fino, poros más cerrados y aporte de oxígeno más lento.Proporciona aromas elegantes y delicados: vainilla suave, pan tostado, frutos secos, especias finas, y notas balsámicas.Ideal para vinos de alta gama o varietales más sutiles (Pinot Noir, Tempranillo elegante, Chardonnay).
		Roble americano (Quercus alba):Grano más grueso y mayor porosidad, lo que acelera la microoxigenación.Aporta aromas más marcados y dulces: coco, vainilla intensa, chocolate, café y caramelo.Se utiliza comúnmente en vinos más estructurados o potentes (Rioja, Cabernet Sauvignon, Syrah).

En resumen:El roble francés aporta sutileza y estructura.El roble americano, intensidad y redondez.Muchos enólogos combinan ambos tipos (crianza mixta) para lograr complejidad y equilibrio.

Depósitos de acero inoxidable
Cuando el vino se cría en acero, no hay interacción con el oxígeno ni con la madera.El resultado son vinos más frescos, frutales y nítidos, donde se preserva la expresión primaria de la uva.Se emplea principalmente en blancos jóvenes y rosados, o tintos ligeros donde se busca pureza varietal.

Tiempos de crianza: clasificación de los vinos
En España —y en muchos otros países que siguen el modelo tradicional— los términos Joven, Crianza, Reserva y Gran Reserva no son meros adjetivos comerciales, sino categorías reguladas por los Consejos Reguladores (como la D.O.Ca. Rioja o la D.O. Ribera del Duero).Estas categorías se definen por el tiempo mínimo que el vino pasa en barrica y botella antes de salir al mercado.
Vinos Tintos
		Joven:No pasa por barrica o lo hace menos de 6 meses.Enfocado en frescura, fruta y vivacidad. Ideal para consumir en su primer o segundo año.
		Crianza:Mínimo 24 meses de envejecimiento total, de los cuales al menos 6 meses en barrica (en Rioja, normalmente 12 meses). Equilibrio entre fruta y madera.
		Reserva:Mínimo 36 meses de envejecimiento, con al menos 12 meses en barrica. Aromas más complejos: cuero, vainilla, tabaco y especias.
		Gran Reserva:Mínimo 60 meses (5 años) de envejecimiento, con al menos 18 meses en barrica. Vinos de meditación, muy estructurados, con taninos suaves y larga persistencia.
Vinos Blancos y Rosados
Los tiempos suelen ser más cortos, ya que la madera tiene un efecto más rápido sobre su estructura:
		Crianza: 18 meses totales, con al menos 6 meses en barrica.
		Reserva: 24 meses totales, con al menos 6 meses en barrica.
		Gran Reserva: 48 meses totales, con al menos 6 meses en barrica.

La crianza no solo transforma el vino: lo educa.Durante su estancia en la barrica o en la botella, el vino aprende a equilibrar su carácter: suaviza sus aristas, adquiere profundidad y desarrolla una identidad más compleja.Comprender cómo el tipo de madera, el tamaño de la barrica y el tiempo afectan al resultado final es esencial para todo sommelier.
 “Cada día en barrica es una conversación silenciosa entre la madera y el vino; el enólogo solo escucha y decide cuándo esa conversación ha terminado.”

4. Embotellado
La última etapa, pero no menos importante.Antes de ser embotellado, el vino se filtra, estabiliza y clarifica, eliminando impurezas.Una vez en la botella, sigue evolucionando lentamente, desarrollando aromas terciarios (cuero, trufa, miel, tabaco) y ganando elegancia con el tiempo.
 Consejo del sommelier: en una cata, intenta visualizar el camino que ese vino recorrió. Cada nota aromática es una pista de su proceso de elaboración.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),

    4: TemaContent(
      contenido: [
        '''1. Introducción: Los tintos, alma y fuerza del vino
El vino tinto es, sin duda, la columna vertebral del mundo del vino. Representa intensidad, estructura, complejidad y, sobre todo, carácter.Su color profundo, sus taninos firmes y su riqueza aromática lo convierten en una experiencia que trasciende el simple gusto: es una conversación entre la tierra, el tiempo y el paladar.
A diferencia de los blancos o rosados, los vinos tintos no buscan solo frescura. Su objetivo es transmitir profundidad y permanencia. En ellos, la fruta madura se mezcla con notas de madera, especias, cuero, tabaco o cacao, resultado del contacto con la piel de la uva y, en muchos casos, de una crianza en barrica.
Un buen somelier debe comprender que el vino tinto es el puente entre la potencia y la elegancia. No todos los tintos son iguales: algunos son ligeros y jugosos, otros densos y envolventes. Su “cuerpo” depende del tipo de uva, del clima, de la técnica de vinificación y del tiempo de maduración.
El aprendizaje fundamental es entender que, detrás de cada vino tinto, hay una historia de equilibrio entre naturaleza y arte.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: El color del vino tinto proviene de la piel de la uva, no del jugo
Esta es una de las curiosidades más reveladoras para los futuros someliers.El zumo de la mayoría de las uvas, incluso las tintas, es incoloro o ligeramente dorado.El color del vino tinto proviene de los pigmentos naturales llamados antocianos, que se encuentran en la piel de la uva.
Durante la fermentación alcohólica, el mosto permanece en contacto con las pieles y semillas, en un proceso llamado maceración.Cuanto más prolongada es esta maceración, más color, tanino y cuerpo adquiere el vino.Por eso, un tinto joven, de maceración corta, será más suave y de tono cereza brillante, mientras que un vino reserva o gran reserva, de maceración larga y crianza extendida, mostrará tonos rubí profundos o incluso teja.
 Dato técnico:En variedades como Cabernet Sauvignon o Syrah, los pigmentos son intensos y estables, mientras que en Pinot Noir o Garnacha tienden a oxidarse antes, dando tonos más claros.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica
El servicio correcto del vino tinto es esencial para apreciar su riqueza. Cada detalle —temperatura, copa, aireación y maridaje— influye directamente en la experiencia sensorial.
 Temperatura de servicio
Debe servirse entre 16 y 18 °C, dependiendo del cuerpo del vino:
		Tintos ligeros (Pinot Noir, Garnacha joven): 15–16 °C
		Tintos con cuerpo (Cabernet, Tempranillo, Syrah): 17–18 °C
 Si el vino está demasiado caliente, el alcohol dominará. Si está muy frío, perderá aromas.
 Tipo de copa
Los tintos necesitan espacio para respirar.Las copas más adecuadas son:
		Bordeaux: altas y amplias, ideales para vinos estructurados (Cabernet Sauvignon, Tempranillo, Merlot).
		Burgundy: de boca ancha y cáliz redondeado, pensadas para vinos más delicados (Pinot Noir).
Una copa amplia permite que los aromas se oxigenen y expresen plenamente.
 Maridajes ideales
El vino tinto es un compañero natural de las comidas ricas en proteínas y grasas, que equilibran sus taninos:
		Carnes rojas (entrecot, cordero, solomillo).
		Embutidos ibéricos y curados.
		Quesos semicurados y curados.
		Pasta con salsas intensas (boloñesa, trufa, setas).
 Regla de oro: vinos potentes con platos potentes; vinos suaves con platos delicados.
 Variedades destacadas
El conocimiento de las variedades de uva es esencial para todo amante o profesional del vino.Cada uva es un mundo: expresa su identidad a través del clima, el suelo, la maduración y la mano del enólogo.Dominar sus características permite al sommelier anticipar aromas, estructuras, maridajes y tiempos de guarda.
A continuación, exploramos las cuatro cepas tintas más emblemáticas del mundo, verdaderos pilares del vino moderno:

 Cabernet Sauvignon – La nobleza estructurada
Originaria de Burdeos (Francia), es la uva tinta más reconocida y plantada del planeta.Su piel gruesa y su maduración tardía la hacen ideal para climas cálidos o templados, donde desarrolla una excelente concentración de taninos y color.
Características técnicas:
		Taninos: firmes y abundantes, responsables de su longevidad.
		Acidez: media-alta, que le aporta frescura y capacidad de envejecimiento.
		Cuerpo: alto, con textura robusta.
		Alcohol: moderado a elevado, dependiendo del clima.
 Perfil aromático:
		Fruta negra: cassis, grosella, mora.
		Notas vegetales: pimiento verde, hoja de tomate (características del pirazínico).
		Con la crianza: cedro, cacao, tabaco, cuero y vainilla.
 Zonas destacadas:
		Francia: Burdeos (Médoc, Pauillac, Margaux).
		España: Ribera del Duero y Navarra (en coupages).
		Chile: Maipo, Colchagua.
		EE. UU.: Napa Valley, Washington.
		Australia: Coonawarra, Margaret River.
 Maridaje ideal:
Carnes rojas asadas, cordero, platos de caza o estofados con reducción de vino.
 Tip de sommelier: decántalo antes de servir para domar sus taninos y liberar los aromas terciarios.

 Merlot – La suavidad elegante
También originaria de Burdeos, pero de carácter mucho más amable.Su nombre proviene de “merle” (mirlo en francés), por el color oscuro de sus uvas y su dulzura natural.Es una variedad de maduración temprana, ideal para equilibrar mezclas con Cabernet Sauvignon o brillar en solitario en climas templados.
 Características técnicas:
		Taninos: suaves y redondos.
		Acidez: media.
		Cuerpo: medio a alto, con textura aterciopelada.
		Alcohol: medio-alto.
Perfil aromático:
		Fruta roja y negra madura: ciruela, cereza, mora.
		Notas secundarias: chocolate, café, regaliz.
		Con crianza: vainilla, tostado, tabaco dulce.
 Zonas destacadas:
		Francia: Pomerol y Saint-Émilion (Burdeos derecho).
		Italia: Toscana (Super Tuscans).
		EE. UU.: California (Napa, Sonoma).
		Chile y Argentina: zonas frescas de altura.
Maridaje ideal:
Pastas con salsa de carne, aves asadas, risottos o carnes blancas con salsas suaves.
 Tip de sommelier: es una excelente opción para quienes inician en tintos, por su equilibrio entre fruta, cuerpo y suavidad.

 Tempranillo – El corazón de España
Uva autóctona y orgullo nacional. Su nombre proviene de “temprano”, por su maduración precoz respecto a otras variedades.Es la columna vertebral de los grandes vinos de Rioja y Ribera del Duero, y un emblema del equilibrio entre tradición y modernidad.
 Características técnicas:
		Taninos: medios, elegantes y redondos.
		Acidez: media a alta.
		Cuerpo: medio a pleno.
		Alcohol: medio-alto.
		Potencial de guarda: alto, especialmente en crianza y reserva.
 Perfil aromático:
		Fruta roja: fresa, cereza, frambuesa.
		Envejecimiento: cuero, tabaco, madera tostada, coco y vainilla (por uso frecuente de roble americano).
		En reservas y grandes reservas: notas terciarias de cacao, clavo, especias dulces y balsámicos.
Zonas destacadas:
		España: Rioja, Ribera del Duero, Toro, La Mancha, Navarra.
		Portugal: conocida como Tinta Roriz o Aragonez.
		Argentina y México: adaptaciones modernas con toques frutales.
 Maridaje ideal:
Carnes de caza, jamón ibérico, guisos de ternera o platos con setas.
 Tip de sommelier: los Tempranillos jóvenes son versátiles y frutales; los reservas aportan complejidad y profundidad gastronómica.

 Malbec – La pasión de Argentina
Aunque nació en Cahors (Francia), el Malbec encontró su máxima expresión en Argentina, donde se transformó en símbolo nacional.Su piel oscura y sus taninos dulces lo convierten en un vino de color intenso y textura envolvente.
 Características técnicas:
		Taninos: firmes pero suaves, de textura aterciopelada.
		Acidez: media.
		Cuerpo: alto.
		Alcohol: alto (por el clima soleado de Mendoza).
 Perfil aromático:
		Fruta negra: ciruela, mora, cereza negra.
		Florales: violeta.
		Con crianza: cacao, café, vainilla, cuero.
		En altitud (Mendoza, Uco): notas minerales y frescura sorprendente.
Zonas destacadas:
		Argentina: Mendoza (Luján de Cuyo, Valle de Uco).
		Francia: Cahors (Malbec más tánico y rústico).
		Chile: Valle del Colchagua.
		EE. UU.: California (Napa, Paso Robles).
 Maridaje ideal:
Carnes a la parrilla, costillas de ternera, empanadas criollas o quesos curados.
 Tip de sommelier: el Malbec es un vino que une potencia y sedosidad. Ideal para mostrar cómo el clima y la altitud transforman el carácter de una misma uva.

 Garnacha (Grenache) – La expresividad mediterránea
La Garnacha es una de las variedades más antiguas y extendidas de España.Originaria del noreste (Aragón y Cataluña), se ha adaptado perfectamente al clima cálido y seco del Mediterráneo. Es la base de grandes vinos en Campo de Borja, Cariñena, Calatayud, Priorat y Navarra.
 Características técnicas:
		Taninos: medios, suaves.
		Acidez: media.
		Cuerpo: medio-alto.
		Alcohol: alto (por su madurez natural).
 Perfil aromático:
		Fruta roja madura: fresa, frambuesa, cereza.
		Notas especiadas: pimienta, regaliz.
		En zonas cálidas: toques de hierbas mediterráneas, higo y mora.
		En vinos viejos o de viñas altas: toques minerales y balsámicos.
 Maridaje ideal:
Perfecta con guisos de cordero, embutidos, paellas de carne, platos de caza menor o quesos semicurados.
 Tip de sommelier: la Garnacha, cuando procede de viñas viejas, ofrece tintos sorprendentes por su equilibrio entre potencia y frescura.

 Mencía – El alma del noroeste atlántico
La Mencía es la joya del noroeste español, especialmente en Bierzo (León), Ribeira Sacra y Valdeorras (Galicia).Crece en zonas de clima fresco y suelos pizarrosos o graníticos, lo que le da un perfil elegante, perfumado y lleno de mineralidad.Su resurgir ha sido clave para el renacimiento del vino español moderno, enfocado en la finesse y la expresión del terruño.
Características técnicas:
		Taninos: finos, aterciopelados.
		Acidez: alta, aporta frescura.
		Cuerpo: medio.
		Alcohol: medio.
 Perfil aromático:
		Fruta roja fresca: cereza, frambuesa, grosella.
		Notas florales: violeta, peonía.
		Toques minerales y herbales: grafito, tomillo, laurel.
		Con crianza: pimienta negra, cacao ligero, humo.
Maridaje ideal:
Ideal para pescados azules a la parrilla, carnes blancas, arroces de montaña, setas o pulpo a la brasa.
 Tip de sommelier: la Mencía es un ejemplo perfecto de cómo un vino tinto puede ser ligero y complejo a la vez, con frescura atlántica y alma de montaña.
''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),

    5: TemaContent(
      contenido: [
        '''1. Introducción: Refrescantes, luminosos y ligeros
El vino blanco es sinónimo de luz, frescura y equilibrio.Representa la cara más delicada del mundo del vino: aromas vibrantes, texturas suaves y una acidez que despierta el paladar.A diferencia de los tintos, los vinos blancos no buscan fuerza o taninos, sino pureza, frescor y expresión aromática.
Su color puede ir desde el pálido amarillo verdoso de un joven Sauvignon Blanc hasta el dorado profundo de un Chardonnay fermentado en barrica.La intensidad aromática suele ser alta: flores, frutas, hierbas, miel o minerales, según la variedad y el método de vinificación.
El vino blanco enseña al somelier la importancia del detalle y la temperatura, porque su equilibrio es más sutil. Un grado de más o menos puede cambiar completamente su expresión.
 Lección esencial: el vino blanco no es “más simple” que el tinto; es simplemente más honesto con el clima, el tiempo y el momento.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: Algunos blancos envejecen en barrica, logrando aromas a vainilla y miel
Aunque la mayoría de los vinos blancos se disfrutan jóvenes, existen estilos que pasan por madera, igual que los tintos.En estos casos, el vino gana textura, complejidad y notas aromáticas terciarias.
		En barricas de roble francés, el vino adquiere toques de vainilla, miel, mantequilla, pan tostado o frutos secos.
		En roble americano, aparecen notas más dulces, como coco o caramelo.
Este tipo de envejecimiento requiere uvas con buena estructura y acidez, como el Chardonnay o el Godello, que soportan la crianza sin perder su identidad.
 Dato técnico: en muchos vinos blancos con crianza, la fermentación y el reposo en barrica se acompañan del “batonnage”, técnica que remueve las lías finas para dar más untuosidad y volumen en boca.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica
 Temperatura de servicio
El vino blanco debe servirse frío, entre 8 y 10 °C, para resaltar su frescura y sus aromas florales o frutales.
		Vinos ligeros y jóvenes: 7–9 °C.
		Vinos con crianza o cuerpo medio: 10–12 °C.
		Blancos envejecidos o fermentados en barrica: 12–14 °C.
 Si se sirve demasiado frío, se “cierra” y pierde aroma; si está caliente, su acidez puede resultar punzante.
 Tipo de copa
Usa copas alargadas y estrechas, conocidas como copas tipo “white wine” o “tulipa”.Su forma permite que los aromas se concentren y la temperatura se conserve mejor.Para blancos más complejos (como un Chardonnay con barrica), se recomienda una copa de cáliz un poco más ancho para favorecer la oxigenación.
 Maridaje ideal
El vino blanco es el compañero natural de la gastronomía marina.Su frescura y acidez limpian el paladar, realzan los sabores salinos y equilibran la grasa del pescado o del marisco.
Combinaciones clásicas:
		Pescados blancos a la plancha o al horno.
		Mariscos, ceviches y sushi.
		Ensaladas con frutas o quesos frescos.
		Arroces con mariscos o pasta ligera.
 Regla dorada: la acidez del vino debe igualar o superar la frescura del plato para lograr armonía.

 Variedades destacadas
El vino blanco es la expresión más luminosa de la vid. A diferencia de los tintos, donde la fuerza proviene del tanino y la estructura, en los blancos reina la pureza, la acidez y la precisión aromática.Cada variedad blanca cuenta una historia distinta: algunas nacen junto al mar y saben a sal, otras crecen en tierras cálidas y evocan frutas maduras y miel.Conocerlas es esencial para cualquier sommelier o amante del vino, ya que cada cepa exige un tipo de servicio, maridaje y conservación diferentes.
A continuación, exploraremos las seis variedades blancas más influyentes y representativas del mundo y de España, desde la versatilidad universal del Chardonnay hasta la sencillez tradicional del Airén.

 1. Chardonnay – La Reina de la Versatilidad
Nacida en la región francesa de Borgoña, el Chardonnay es una de las uvas más célebres y cultivadas del mundo.Su mayor virtud es la adaptabilidad: crece con elegancia en climas fríos, templados o cálidos, ofreciendo vinos completamente distintos según el terroir y la vinificación.
En regiones frías (Chablis, Champagne, Navarra), el Chardonnay da vinos frescos, tensos y minerales, con notas de manzana verde, limón y flores blancas.En climas cálidos (California, Australia, Penedès), se vuelve maduro y cremoso, mostrando fruta tropical, mantequilla y vainilla, especialmente si se cría en barrica.
La fermentación maloláctica y la crianza sobre lías otorgan su característica textura sedosa y redondez, mientras que el uso de roble francés añade notas de pan tostado, miel o frutos secos.
Aromas: manzana, pera, piña, mantequilla, pan tostado, vainilla.Zonas destacadas: Borgoña, Champagne, California, Australia, Navarra, Penedès.Maridaje: pescados grasos (salmón, lubina), pollo con crema, langostinos, pastas con salsas suaves.
 El Chardonnay enseña al alumno a entender la influencia del clima y la madera: en él se puede estudiar toda la alquimia del vino blanco.

 2. Sauvignon Blanc – La Frescura Verde
El Sauvignon Blanc es el vino blanco de los amantes de la frescura, la vivacidad y los aromas herbales.Originario del Valle del Loira (Francia), su nombre proviene de sauvage (“salvaje”), en alusión a su carácter vibrante y punzante.
En zonas frías como Sancerre o Marlborough (Nueva Zelanda), produce vinos muy aromáticos y nerviosos, con acidez marcada y notas cítricas, herbales o tropicales.En regiones más cálidas (Chile o Rueda), su perfil se suaviza y se llena de frutas maduras, pero siempre mantiene esa identidad “verde” que lo distingue.
Su frescor lo convierte en un vino ideal para el aperitivo, o para acompañar platos de mar con limón, ceviches o ensaladas.
Aromas: lima, pomelo, hierba recién cortada, maracuyá, grosella verde.Zonas destacadas: Valle del Loira, Nueva Zelanda, Chile, Rueda.Maridaje: ceviche, sushi, mariscos, quesos de cabra, ensaladas con vinagreta.
 El Sauvignon Blanc enseña la importancia de la acidez y la intensidad aromática: un vino que vibra y despierta los sentidos.

 3. Albariño – El Orgullo Gallego
Si existe un vino blanco que personifica el mar, ese es el Albariño.Originario de Rías Baixas (Galicia), crece bajo la influencia directa del Atlántico, lo que le confiere una frescura y mineralidad únicas.
Sus racimos pequeños y piel gruesa permiten obtener vinos aromáticos, vibrantes y salinos, perfectos para la cocina marina.El Albariño combina acidez brillante y cuerpo medio, con una textura que recuerda a la piedra húmeda y al aire del océano.
Su carácter elegante y su capacidad para reflejar el clima lo han convertido en un emblema español reconocido en todo el mundo.
Aromas: melocotón, albaricoque, cítricos, flores blancas, sal marina.Zonas destacadas: Rías Baixas, Ribeiro, Portugal (como Alvarinho).Maridaje: mariscos, ostras, pulpo a la gallega, pescados blancos, arroz con almejas.
 El Albariño enseña a degustar la mineralidad: un vino que sabe a viento, roca y mar.

 4. Verdejo – La Joya de Rueda
El Verdejo es una uva autóctona de Castilla y León, especialmente vinculada a la Denominación de Origen Rueda.Durante siglos fue un vino rústico y oxidativo, pero hoy se ha convertido en símbolo de modernidad y calidad.
El Verdejo combina frescura, cuerpo y personalidad.Elaborado joven, muestra aromas frutales y herbales; pero con crianza sobre lías, gana estructura, volumen y una textura cremosa.
Su rasgo más distintivo es una ligera nota de almendra amarga al final del trago, que equilibra su acidez y lo hace sumamente gastronómico.
Aromas: hinojo, manzana verde, melón, almendra amarga.Zonas destacadas: Rueda, Toro, Cigales.Maridaje: pescados grasos, arroces, ensaladas templadas, tapas y quesos semicurados.
 El Verdejo enseña equilibrio: ni ligero ni pesado, combina la vivacidad de un joven con la profundidad de un vino de guarda.

 5. Godello – Elegancia Mineral
El Godello es una de las joyas enológicas más elegantes del norte de España.Procede del Bierzo, Valdeorras y Ribeira Sacra, regiones donde el terreno pizarroso y el clima atlántico crean vinos de una pureza y textura inconfundibles.
A diferencia de otros blancos más ligeros, el Godello tiene cuerpo y profundidad, con una boca redonda y sedosa.Cuando se fermenta o cría sobre lías, desarrolla una gran complejidad aromática, capaz de competir con los grandes Chardonnay del mundo.
Su estilo combina mineralidad, cremosidad y frescura, convirtiéndolo en un vino ideal para paladares exigentes.
Aromas: pera, manzana, flores blancas, miel, pan tostado.Zonas destacadas: Valdeorras, Ribeira Sacra, Bierzo.Maridaje: pescados al horno, platos con mantequilla o crema, risottos, vieiras gratinadas.
 El Godello enseña la sutileza y el equilibrio entre mineralidad y textura: un blanco con alma de vino tinto.

 6. Airén – Tradición y Sencillez
El Airén es la uva blanca más cultivada de España y durante décadas fue la base de la viticultura de La Mancha.Aunque su perfil es discreto, su importancia histórica es enorme: fue la uva que alimentó la cultura del vino en las mesas españolas durante el siglo XX.
Produce vinos ligeros, neutros y refrescantes, perfectos para el consumo cotidiano o como base para destilados como el brandy.Cuando se trabaja con cuidado y en vendimias tempranas, puede ofrecer vinos frescos, con notas frutales y florales muy agradables.
Aromas: fruta blanca (manzana, pera), melón, flores secas.Zonas destacadas: Castilla-La Mancha, Valdepeñas, Cuenca.Maridaje: aperitivos, tapas suaves, mariscos, ensaladas frías, pescados blancos.
 El Airén enseña humildad: no todos los vinos buscan complejidad, algunos simplemente quieren refrescar y acompañar momentos sencillos.

 Conclusión técnica:Chardonnay aporta cuerpo; Sauvignon Blanc, frescura; Albariño, salinidad; Verdejo, equilibrio; Godello, elegancia; y Airén, sencillez.Estas seis variedades enseñan al alumno que el vino blanco es mucho más diverso de lo que parece.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    6: TemaContent(
      contenido: [
        '''1. Introducción: El punto medio entre la intensidad del tinto y la frescura del blanco
El vino rosado es el equilibrio hecho líquido.Combina la estructura ligera de un tinto con la frescura y vivacidad de un blanco, creando una experiencia versátil, elegante y moderna.
Durante años, el rosado fue subestimado, considerado un vino “fácil” o de verano. Sin embargo, hoy vive una auténtica revolución enológica y gastronómica, con elaboraciones cada vez más precisas, complejas y refinadas.Desde los rosados pálidos y secos de Provenza (Francia) hasta los más intensos de Navarra o Rioja, esta categoría ha conquistado el mundo por su versatilidad y capacidad de adaptación.
El color rosado no es solo una cuestión estética; es una declaración de estilo.Cada tono —del rosa pálido salmón al frambuesa brillante— cuenta una historia sobre la variedad de uva, el tiempo de maceración y el propósito del enólogo.
 El rosado enseña el arte del equilibrio: la delicadeza de un blanco con el alma de un tinto.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: Su color rosado se logra dejando la piel de la uva en contacto con el jugo solo unas horas
El secreto del color del vino rosado está en la maceración breve de los hollejos (pieles) con el mosto.Mientras que los vinos tintos fermentan durante días con la piel, el rosado sólo la mantiene en contacto durante 2 a 24 horas, dependiendo de la intensidad de color deseada.
Este breve contacto transfiere pigmentos naturales (antocianos) y una ligera cantidad de taninos, que aportan estructura sin perder frescura.El resultado es un vino ligero, aromático y visualmente cautivador.
Existen tres métodos principales de elaboración:
	1.	Saignée (sangrado): Se obtiene al “sangrar” una parte del mosto de una fermentación de vino tinto tras unas horas de maceración. Los rosados de este tipo suelen tener más cuerpo y color.
	2.	Prensado directo: Se prensa la uva tinta suavemente sin apenas maceración. Produce rosados pálidos, frescos y delicados, al estilo provenzal.
	3.	Ensamblaje (mezcla): Se mezcla una pequeña cantidad de vino tinto con vino blanco. Es un método poco común y generalmente reservado a espumosos (como el Champagne rosé).
 Dato técnico: los vinos rosados, al igual que los blancos, deben conservar su frescura. Por ello, suelen elaborarse en depósitos de acero inoxidable y embotellarse jóvenes.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica
 Temperatura de servicio
El rosado se disfruta mejor entre 10 y 12 °C.A esa temperatura muestra su equilibrio perfecto entre acidez y fruta.
		Rosados ligeros o provenzales: 8–10 °C
		Rosados estructurados o con crianza: 12–14 °C
 Si está demasiado frío, se pierde la expresión aromática; si está caliente, el alcohol domina.
 Tipo de copa
La copa ideal es la tipo universal o de vino blanco mediana, que permite mantener el frescor y concentrar los aromas frutales.Para rosados con crianza o de mayor cuerpo (como un rosado de Syrah o de Garnacha vieja), puede usarse una copa tipo Borgoña.
 Maridaje ideal
El rosado es un vino extremadamente versátil en la mesa.Combina bien con platos ligeros y también con preparaciones más especiadas o grasosas, gracias a su acidez refrescante y su sutil estructura tánica.
Maridajes recomendados:
		Tapas, embutidos, quesos suaves.
		Ensaladas mediterráneas o con frutas.
		Pastas con salsa de tomate o albahaca.
		Pescados azules o parrilladas de marisco.
		Pizza blanca o risotto de setas.
 El vino rosado es el comodín gastronómico: acompaña tanto una comida informal como una cena elegante.

 Variedades más representativas
1. Garnacha – La dulzura mediterránea
La Garnacha (Grenache en Francia) es la variedad reina de los rosados españoles.Produce vinos de color brillante, aromas intensos y textura redonda.Su perfil frutal —fresas, cerezas, pétalos de rosa— la hace ideal para rosados de corte joven y alegre.
		Zonas: Navarra, Campo de Borja, Cariñena, Rioja.
		Estilo: frutos rojos, goloso, seco pero amable.
		Maridaje: ensaladas con jamón, pollo a la parrilla, arroces, pizzas.
 La Garnacha es la sonrisa del vino rosado: luminosa, jugosa y amable.

2. Syrah – El rosado con carácter
La uva Syrah aporta cuerpo, intensidad aromática y un toque especiado al rosado.Su estructura la hace perfecta para elaborar rosados más gastronómicos o incluso con ligera crianza.
		Aromas: mora, frambuesa, pimienta negra, violetas.
		Zonas: Languedoc, Valle del Ródano, La Mancha, Jumilla.
		Estilo: más profundo, con volumen y final largo.
		Maridaje: pasta con salsa de tomate, carnes blancas, platos especiados.
 El rosado de Syrah demuestra que el rosado también puede tener músculo y carácter.

3. Pinot Noir – La elegancia sutil
La Pinot Noir, reina de Borgoña y Champagne, produce algunos de los rosados más finos y delicados del mundo.Su piel fina genera colores pálidos y elegantes, con aromas florales y frutales muy expresivos.
		Aromas: frambuesa, fresa silvestre, flor de cerezo.
		Zonas: Borgoña, Champagne, Oregon, Cataluña.
		Estilo: elegante, floral, con acidez viva y textura sedosa.
		Maridaje: sushi, carpaccio, mariscos o platos ligeros de verduras.
 El rosado de Pinot Noir enseña que la elegancia no necesita intensidad, solo armonía.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    7: TemaContent(
      contenido: [
        '''1. Introducción: Cada burbuja es una pequeña fiesta
Pocas cosas despiertan tanta emoción como el sonido de un corcho al salir o el brillo de un vino espumoso en la copa.El vino espumoso representa celebración, elegancia y alegría, pero también técnica, precisión y arte enológico.
Lo que hace único al espumoso es la presencia de gas carbónico natural (CO₂), generado por una segunda fermentación que atrapa las burbujas dentro de la botella o el depósito.Este proceso convierte un vino tranquilo en una sinfonía de frescura, textura y sonido.
Cada burbuja transporta aromas, eleva la percepción gustativa y acaricia el paladar. No hay otro vino que combine de forma tan perfecta sensación táctil, visual y aromática.
Los espumosos pueden ser desde ligeros y frutales, hasta complejos y tostados, dependiendo de su método de elaboración, su tiempo de crianza y su origen.
 El vino espumoso no solo se bebe: se escucha, se observa y se siente.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: Dom Perignon no inventó el champagne… ¡pero ayudó a perfeccionarlo!
Durante siglos, el fenómeno de las burbujas fue un misterio.En el siglo XVII, los vinos de la región de Champagne (Francia) sufrían fermentaciones espontáneas en primavera, lo que hacía que algunos corchos saltaran por la presión.
El monje benedictino Dom Pierre Pérignon (1638–1715) no inventó el champagne, pero fue un pionero en perfeccionar el método: seleccionó uvas de calidad, controló la mezcla de variedades y mejoró los tapones y botellas para resistir la presión.
Gracias a su trabajo y al desarrollo del método tradicional (o champenoise), el champagne se convirtió en símbolo de lujo y sofisticación.
🧴 Fun fact: una botella de champagne puede contener hasta 49 millones de burbujas.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica
 Tipos principales de vinos espumosos
	1.	Champagne (Francia)El más prestigioso y complejo. Se elabora en la región de Champagne mediante el método tradicional, con segunda fermentación en botella y un largo envejecimiento sobre lías.
	o	Variedades: Chardonnay, Pinot Noir, Pinot Meunier.
	o	Estilo: elegante, con notas de pan tostado, brioche, manzana y frutos secos.
	o	Tiempo mínimo de crianza: 15 meses (no vintage) y 36 meses (vintage).
	2.	Cava (España)Elaborado principalmente en Cataluña, aunque también en otras regiones españolas. Utiliza el método tradicional, igual que el Champagne.
	o	Variedades autóctonas: Macabeo, Xarel·lo, Parellada (y a veces Chardonnay o Pinot Noir).
	o	Estilo: más mediterráneo, con notas de manzana verde, almendra, cítricos y flores blancas.
	o	Tiempo mínimo de crianza: 9 meses (Cava), 18 (Reserva), 30 (Gran Reserva).
	3.	Prosecco (Italia)Procedente del noreste italiano (Veneto y Friuli), se elabora con la uva Glera y mediante el método Charmat o de tanque, donde la segunda fermentación ocurre en depósitos de acero inoxidable.
	o	Estilo: ligero, frutal, fresco y floral, con notas de pera, melón y flor blanca.
	o	Ideal para: aperitivos y cócteles como el famoso Bellini.
 En resumen:
		Champagne: elegancia y complejidad.
		Cava: equilibrio y tradición.
		Prosecco: frescura y ligereza.

 Temperatura de servicio
Los espumosos deben servirse muy fríos, entre 6 y 8 °C, para mantener la presión del gas y potenciar su frescura.Se enfrían en cubitera con hielo y agua durante unos 20 minutos antes de servir.
 A menor temperatura, más burbujas finas y elegantes; a mayor temperatura, más sensación de alcohol.

 Tipo de copa
El vino espumoso se sirve en copas tipo flauta o tulipa.
		Flauta: alta y estrecha, conserva mejor el gas y permite apreciar la subida continua de burbujas.
		Tulipa: más moderna y recomendada para espumosos de calidad, ya que su forma ligeramente más ancha en la base permite liberar los aromas complejos.
 Evitar las copas planas (“coupe”) tradicionales, ya que dispersan rápidamente las burbujas y los aromas.

 Maridaje ideal
Los espumosos son vinos extremadamente versátiles en la mesa. Su acidez y burbuja limpian el paladar, potenciando los sabores de la comida.
Maridajes recomendados:
		Brut Nature o Extra Brut: sushi, ostras, tartar de salmón, ceviche, tempura.
		Cava Reserva o Champagne Vintage: carnes blancas, quesos curados, foie gras.
		Demi-Sec o Prosecco dulce: postres ligeros, frutas frescas, tartas de crema.
 Un buen espumoso es el compañero perfecto para toda una comida, no solo para brindar.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    8: TemaContent(
      contenido: [
        '''1. Introducción: El broche de oro de la mesa
Los vinos dulces y generosos representan el arte del tiempo, la paciencia y la concentración del sabor.Son el último acto de una gran comida, el punto de equilibrio entre placer, aroma y dulzura.
Mientras que los vinos tranquilos buscan equilibrio entre acidez y fruta, los dulces se centran en la intensidad, la textura y la persistencia aromática.Un solo sorbo puede llenar la boca con sensaciones de miel, frutos secos, pasas o cacao.
Hay distintas formas de lograr un vino dulce:
		Por concentración natural del azúcar en la uva, como en los vinos de vendimia tardía o los afectados por la botrytis cinerea (noble podredumbre).
		Por adición de alcohol vínico durante la fermentación, que detiene el proceso y conserva azúcares residuales (como en el Oporto o Jerez).
		Por desecación de la uva, al sol o en paseras, para concentrar los azúcares (como en el Pedro Ximénez o Moscatel).
Los vinos dulces son historia líquida: muchos de ellos fueron símbolo de nobleza, medicina o incluso moneda de cambio en siglos pasados.
 En el universo del vino, los dulces y generosos son los guardianes del tiempo y la memoria.''',

        FichaTema(
          pregunta: '¿Cuántas variedades de uva existen?',
          respuesta: 'Más de 10,000 variedades, pero solo unas pocas decenas se cultivan para producir vinos de calidad.',
        ),

        '''2. Curiosidad: El sistema de criaderas y soleras
En Jerez de la Frontera, cuna de los vinos generosos españoles, se utiliza un sistema de envejecimiento único en el mundo: las criaderas y soleras.
Este método consiste en una estructura de barricas (botas) dispuestas en varios niveles.
		La solera es la fila inferior, que contiene el vino más viejo y del cual se realiza el embotellado.
		Encima se sitúan las criaderas, que contienen vinos progresivamente más jóvenes.
Cuando se saca una parte del vino de la solera, se repone con vino de la criadera superior, y así sucesivamente.Este sistema garantiza una mezcla continua de añadas, logrando vinos de consistencia, complejidad y longevidad excepcionales.
El vino de Jerez no envejece por años… envejece por generaciones.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica
 Tipos principales de vinos dulces y generosos
1. Moscatel – Dulzura floral y mediterránea
Elaborado con uvas Moscatel, esta variedad da vinos perfumados, frescos y alegres.
		Aromas: flor de azahar, miel, melocotón, albaricoque.
		Estilo: ligero, muy aromático, ideal como aperitivo o postre suave.
		Regiones: Málaga, Valencia, Alella.
		Maridaje: fruta fresca, repostería ligera, quesos semicurados.

2. Pedro Ximénez – La esencia del sol andaluz
El rey de los vinos dulces naturales españoles. Se elabora secando las uvas Pedro Ximénez al sol en paseras, lo que concentra los azúcares.
		Aromas: higo seco, pasas, miel, cacao, café, dátiles.
		Textura: densa, aterciopelada, casi licorosa.
		Regiones: Montilla-Moriles, Jerez.
		Maridaje: postres de chocolate, brownie, quesos azules, helado de vainilla.
 Un sorbo de Pedro Ximénez es como beber postre líquido.

3. Oporto – Fortaleza y elegancia del Douro
Originario de Portugal, el Oporto es un vino fortificado, es decir, con adición de aguardiente vínico que detiene la fermentación y conserva parte del azúcar natural.
		Tipos principales:
	o	Ruby: joven, afrutado y vibrante.
	o	Tawny: envejecido en madera, con notas de nuez, caramelo y vainilla.
	o	Vintage: elaborado solo en añadas excepcionales, gran capacidad de guarda.
		Maridaje: quesos fuertes, postres con frutos secos, tartas especiadas.

4. Jerez – Tradición, arte y carácter
Los vinos generosos de Jerez pueden ser secos o dulces, pero siempre intensos y complejos. Su tipología es amplia:
		Fino: seco, salino y ligero.
		Amontillado: intermedio, con notas de frutos secos y caramelo.
		Oloroso: potente, con cuerpo y aromas a nuez, cuero y especias.
		Cream o Medium: dulces, elaborados con mezcla de Oloroso y Pedro Ximénez.
 El Jerez es una sinfonía entre aire, madera y tiempo.

 Temperatura de servicio
La temperatura es esencial para resaltar los aromas y el equilibrio del dulzor:
		Vinos dulces ligeros (Moscatel, Dulce joven): 10–12 °C
		Vinos más densos o licorosos (PX, Oporto, Jerez): 12–14 °C
Servir demasiado frío adormece los aromas; demasiado caliente los hace empalagosos.

 Tipo de copa
Utilizar copas pequeñas o de licor, de forma tulipa, que concentren los aromas. Para vinos más densos como PX u Oporto, se pueden usar copas de degustación más cerradas para apreciar su complejidad.

 Maridaje ideal
El secreto del maridaje con vinos dulces es el contraste o la armonía de intensidades:
		Foie gras o quesos azules: contraste salado-dulce sublime.
		Postres de chocolate o caramelo: armonía por similitud.
		Frutas ácidas o exóticas: equilibran la densidad del vino.
 Regla de oro: el vino debe ser siempre más dulce que el postre.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    9: TemaContent(
      contenido: [
        '''1. Introducción: Catar no es beber, es descubrir
Catar un vino no consiste en beberlo, sino en analizarlo con los sentidos para comprender su origen, su estilo y su calidad. Cada vino encierra una historia: la del clima que lo vio nacer, el suelo donde creció la vid, la mano del viticultor y las decisiones del enólogo. El catador, con atención y sensibilidad, traduce esa historia en sensaciones.
Catar exige concentración, método y práctica. El objetivo es interpretar el vino de manera objetiva, identificando sus virtudes y defectos, su equilibrio y personalidad. Por eso, catar es un arte técnico con alma emocional.
Durante una cata, los sentidos trabajan en armonía:
		La vista analiza su aspecto.
		El olfato reconoce su carácter aromático.
		El gusto determina su estructura, equilibrio y final.
El buen catador desarrolla con el tiempo una memoria sensorial, capaz de asociar aromas, texturas y sabores con variedades de uva, regiones o estilos de elaboración.
Catar es aprender a mirar, oler y saborear con intención.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: El secreto de los profesionales
Una de las curiosidades más llamativas del mundo de la cata es que los catadores profesionales no tragan el vino durante las pruebas. Lo prueban, analizan su textura y sabor, y luego lo escupen en un recipiente especial llamado escupidera.
¿La razón? Mantener el paladar fresco y la mente clara. Durante una jornada de cata se pueden probar entre 20 y 100 vinos. Si se ingiriera cada muestra, el alcohol afectaría inevitablemente la percepción sensorial.
Escupir no es una falta de respeto: es un gesto profesional, símbolo de respeto por el vino y por el propio juicio crítico.
El catador sabio conserva la mente lúcida y el paladar despierto.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Los tres pasos esenciales
Catar un vino es una exploración guiada por tres fases: vista, olfato y gusto. Cada una revela una parte distinta de su identidad. Siguiendo este método, podrás analizar cualquier vino con precisión y elegancia.

1⃣ VISTA — «Lo que la copa te cuenta antes de olerla»
La fase visual es rápida, sencilla y muy informativa. No necesitas vocabulario técnico: sólo mirar con atención.
Qué comprobar (y por qué importa)
	1.	Limpidez y brillo
	o	Mira la copa con una luz buena (luz natural o una lámpara blanca).
	o	Un vino limpio y brillante suele estar en buen estado; un vino turbio o apagado puede estar estropeado o sin filtrar intencionalmente.
	2.	Color y matices
	o	Inclina la copa sobre un fondo blanco. Observa desde el centro hacia el borde.
	o	Tintos: van de púrpura/violáceo (muy joven) → rubí → granate → teja (más viejo).
	o	Blancos: van de amarillo verdoso (jóvenes) → amarillo paja → dorado (más maduros/criados).
	o	Rosados: van de rosa pálido → frambuesa.
	o	El color nos da pistas sobre la edad, el tipo de uva y si ha habido crianza en madera.
	3.	Concentración / densidad (lágrimas o piernas)
	o	Agita suavemente la copa y observa cómo bajan las gotas por las paredes (las “lágrimas”).
	o	Lágrimas abundantes y lentas pueden indicar mayor alcohol o glicerina (sensación de cuerpo). No es una regla absoluta, pero es informativa.
	4.	Cuerpo (estimación visual)
	o	A partir del color y de las lágrimas puedes intuir si será ligero, medio o corpulento.
Ejercicio práctico 1 (1 minuto)
Sirve 1/3 de copa y:
		Inclina la copa sobre una hoja blanca, mira color y borde.
		Agítala suavemente, observa las lágrimas. Anota: color, brillo, primeras impresiones.

2⃣ OLFATO — «El mapa aromático del vino»
El olfato es el sentido que más recuerdos y sensaciones evoca. Aquí “escuchas” lo que el vino tiene que decir.
Cómo hacerlo (técnica paso a paso)
	1.	Primer olfato (sin mover la copa)
	o	Acerca la nariz a la boca de la copa e inspira suavemente. Esto te da los aromas más volátiles (los más frágiles): fruta fresca, notas herbales, etc.
	2.	Segundo olfato (tras agitar la copa)
	o	Agita la copa con el brazo (no con la muñeca exageradamente). Esto oxigena el vino y libera más aromas. Vuelve a oler, ahora con respiraciones cortas y profundas.
	3.	Cómo inspirar
	o	Haz respiraciones cortas y controladas por la nariz, como pequeñas “sniffs” (no aspiraciones profundas permanentes). Repite varias veces hasta identificar familias aromáticas.
Qué buscar (familias de aromas)
		Aromas primarios (de la uva): frutas (cítricos, manzana, fresa), flores, hierbas.
		Aromas secundarios (fermentación): pan, levadura, yogur, notas lácticas.
		Aromas terciarios (crianza/envejecimiento): vainilla, cuero, tabaco, miel, frutos secos, especias, tostado.
Trucos para identificar aromas (para principiantes)
		Relaciona con objetos reales: en vez de “aroma a piracínico”, piensa “pimiento verde” o “hoja de tomate”.
		Usa referencia: huele frutas, café, pan tostado, flores; compáralos con el vino.
		Divide la nariz: intenta identificar primero la familia (fruta, floral, especia), luego particulariza (manzana -> manzana verde -> Granny Smith).
Ejercicio práctico 2 (5–10 minutos)
Prepara pequeñas muestras de aromas: limón, manzana, fresa, vainilla, madera, café. Huele cada una y luego huele el vino. Pregúntate: ¿se parece a alguno? Anota 2–3 aromas dominantes.

3⃣ GUSTO — «La confirmación y el equilibrio»
La fase gustativa te confirma lo que oliste y te enseña la estructura del vino: acidez, alcohol, taninos, dulzor, cuerpo y persistencia.
Cómo probar (técnica paso a paso)
	1.	Toma un sorbo pequeño (no tragues aún).
	2.	Distribuye el vino en la boca: ponlo entre dientes y paladar, mueve la lengua para que llegue a todas las zonas.
	3.	Aspira un poco de aire junto al vino (a modo de emulsionar): esto ayuda a liberar aromas en boca y permite percibir mejor el sabor.
	4.	Evalúa de inmediato: ataque, paso por boca y final (persistencia).
	5.	Escupe o traga: si estás en una cata de varias muestras, escupe; para una experiencia de mesa, traga.
Qué sentir y cómo describirlo
		Ataque: primera sensación (suave, fresco, caliente).
		Acidez: sensación de frescor en los laterales de la lengua y en la dentadura. Es la columna vertebral del vino blanco y rosado.
		Taninos (sólo en tintos): sensación de astringencia o sequedad en las encías y lengua; aportan estructura y longevidad.
		Cuerpo: sensación de peso o densidad (ligero, medio, pleno). Piensa en comparar con la leche semidesnatada vs. leche entera: uno más ligero, otro más cremoso.
		Alcohol: sensación de calor en la garganta; si está desequilibrado puede “quemar”.
		Dulzor: en vinos dulces; en secos casi no hay.
		Persistencia o final: cuánto tiempo permanece el sabor después de tragar (medido en segundos): corto (<5s), medio (5–10s), largo (>10s).
Cómo evaluar el equilibrio
Un vino equilibrado tiene acidez, alcohol, fruta, tanino (si corresponde) y, si existe, azúcar, en proporción armónica. Si uno domina claramente (ej. alcohol muy notorio o acidez cortante), el vino está desequilibrado.


Ejercicio práctico 3 (10 minutos)
Prueba un sorbo y anota:
		Ataque: (suave / vivo / potente)
		Acidez: (baja / media / alta)
		Taninos: (ninguno / suaves / firmes)
		Cuerpo: (ligero / medio / lleno)
		Final: (corto / medio / largo)
		¿Está equilibrado? Sí / No. ¿Por qué?

Consejos prácticos y errores comunes (para acelerarte el aprendizaje)
		No comas ajo, menta o comida muy aromática antes de catar. Limpia el paladar con agua o pan neutro.
		No fumes antes o durante la cata: enmascara aromas.
		Usa copas limpias y transparentes. Evita perfumes fuertes.
		Sirve cantidades pequeñas (1/3 de copa). Así podrás oler y probar mejor.
		No juzgues al primer olfato solo: deja que el vino respire 5–10 minutos si es tinto joven.
		Anota siempre: la memoria se entrena escribiendo.

 Mini-cheat-sheet para la cata 
Antes de empezar: copa limpia, luz, sin perfumes, temperatura adecuada. Orden: Vista → Olfato (sin agitar → con agitación) → Gusto (sorbo, mover, aspirar, evaluar). Checklist visual: brillo, color, lágrimas. Checklist olfativa: frutas / flores / fermentación / crianza. Checklist gustativa: ataque / acidez / taninos / cuerpo / final / equilibrio.

 Rutina de práctica semanal (para avanzar rápido)
		Semana 1–2: 3 vinos simples (blanco, rosado, tinto joven). Practica vista+olfato.
		Semana 3–4: añade 2 vinos con crianza (madera). Practica a identificar notas secundarias/terciarias.
		Semana 5: cata a ciegas (tapa la etiqueta) 3 vinos y anota. Comprueba después.
		Mantén un cuaderno de cata y repasa tus notas cada mes.

No necesitas nacer con “buen paladar” para aprender: solo atención, curiosidad y práctica. Cada copa es una lección: mira, huele, pregunta, anota y repite. Con el tiempo, reconocerás uvas, estilos y regiones —y lo harás con confianza.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    10: TemaContent(
      contenido: [
        '''1. Introducción: El poder de un grado
La temperatura del vino es tan importante como la uva, la crianza o la guarda. Un solo grado de diferencia puede alterar completamente aromas, sabores, cuerpo y percepción del alcohol.
		Vino demasiado frío: aromas apagados, sensación de falta de cuerpo, acidez excesiva.
		Vino demasiado cálido: aromas dominados por alcohol, sensación pesada y desequilibrada.
Servir un vino a la temperatura adecuada resalta su expresión auténtica, tanto si es un blanco fresco de verano como un tinto de guarda con cuerpo.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: el impacto sensorial
		Los blancos demasiado fríos (menos de 6–7 °C) pierden intensidad aromática y se sienten planos.
		Los tintos demasiado cálidos (más de 20 °C) parecen alcohólicos y pesados; los taninos se vuelven ásperos.
		Los espumosos muy fríos resaltan frescor y burbujas, pero ocultan matices finos.
		Los rosados y dulces tienen un rango intermedio: demasiado frío pierden fragancia y dulzor; demasiado caliente, se sienten densos.
 La temperatura controla la velocidad de volatilización de los compuestos aromáticos, la percepción de acidez y la sensación de alcohol en boca.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Guía básica por estilos
Para facilitar la práctica y la recomendación profesional, aquí tienes una tabla orientativa de temperaturas ideales según el tipo de vino:
Tipo de vino
Temperatura ideal
Observaciones
Tintos con cuerpo (Cabernet, Syrah, Rioja Reserva)
16–18 °C
Resalta fruta madura y taninos sin que el alcohol domine.
Tintos ligeros/jóvenes (Garnacha, Beaujolais)
14–16 °C
Frescura y vivacidad de la fruta.
Blancos secos y afrutados (Sauvignon Blanc, Albariño)
8–10 °C
Aromas cítricos y florales destacados, sensación fresca.
Blancos con crianza en barrica (Chardonnay)
10–12 °C
Notas de vainilla y mantequilla equilibradas con frescura.
Rosados (Garnacha, Pinot Noir)
10–12 °C
Color y fruta en equilibrio, sensación ligera y agradable.
Espumosos y Champagne
6–8 °C
Burbujeo activo, aromas vivos y sensación refrescante.
Vinos dulces y generosos (Pedro Ximénez, Moscatel)
10–14 °C
Aromas concentrados y textura glicérica resaltada.

Consejos prácticos
	1.	No meter un tinto en la nevera demasiado frío: perderá expresión aromática.
	2.	Sacar un blanco o rosado de la nevera 10 minutos antes de servir permite que abra sus aromas.
	3.	Los vinos espumosos deben estar bien fríos para que la efervescencia y frescor se mantengan.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    11: TemaContent(
      contenido: [
        '''1. Introducción: La magia de la forma
La copa no es solo un recipiente: es una extensión del vino, capaz de modificar aromas, sabores, temperatura y percepción del momento.
		Una copa adecuada dirige el vino hacia la zona correcta de la lengua, realza sus notas aromáticas y concentra su bouquet.
		El volumen y ancho del cáliz permite que el vino respire o mantenga sus burbujas.
		Incluso la altura y grosor del tallo influye en cómo lo sostienes, evitando calentar el vino con la mano.
 Elegir la copa correcta es como elegir la varita de un mago: cambia la experiencia por completo.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: el borde marca el sabor
El borde de la copa determina dónde entra el vino en la boca y qué receptores perciben primero:
		Borde ancho: el vino golpea más lengua, sensación más redonda y estructurada.
		Borde estrecho: dirige el vino hacia punta de lengua y paladar medio, resaltando acidez y aromas delicados.
Esto significa que un mismo vino puede sentirse distinto según la copa que uses. Por ejemplo: un Chardonnay joven en copa ancha puede parecer más redondo; en copa estrecha, más fresco y cítrico.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Copas por tipo de vino
1. Tintos – copa grande tipo Bordeaux
		Amplio cáliz que permite oxigenación.
		Aromas complejos y taninos expresados plenamente.
		Borde ligeramente ancho para apreciar fruta y estructura.
		Temperatura: 16–18 °C (tintura de cuerpo).
2. Blancos – copa más estrecha
		Conserva frescor y aromas delicados.
		Evita que el alcohol domine.
		Borde más estrecho dirige el vino hacia el centro de la lengua, resaltando acidez y mineralidad.
		Temperatura: 8–12 °C según estilo.
3. Rosados – copa universal mediana
		Tamaño intermedio para equilibrar aroma y frescor.
		Permite apreciar notas frutales y bouquet sin dispersar el vino.
		Temperatura: 10–12 °C.
4. Espumosos – flauta o tulipa
		Estrecha y alta para mantener las burbujas y concentrar aromas.
		Tulipa ligeramente más ancha permite apreciar mejor el bouquet de Champagne o Cava.
		Temperatura: 6–8 °C.
5. Vinos dulces – copa pequeña tipo licor
		Reducida para controlar la cantidad y concentrar aromas.
		Evita que el dulzor domine la percepción.
		Temperatura: 10–14 °C.
 Tip de sumiller: nunca uses copas sucias, grasientas o con aromas externos. Incluso una copa perfecta puede arruinar la experiencia si no está limpia.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    12: TemaContent(
      contenido: [
        '''1. Introducción: Cultura líquida
El vino no solo se bebe; inspira y crea. Pintores, escultores, escritores y músicos han capturado su esencia, desde lo cotidiano hasta lo divino.
		Más que bebida, el vino es símbolo de identidad cultural, unión social y expresión artística.
		Cada época refleja cómo el vino se percibía: sagrado, festivo, refinado o hedonista.
		Observar la historia del vino en el arte nos ayuda a comprender mejor su valor cultural y emocional.
 El vino es un hilo invisible que une paladar y creatividad.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: Dionisio, el primer influencer del vino
		En la Antigua Grecia, Dionisio era el dios del vino, la fertilidad y la fiesta.
		Aparece en esculturas, cerámicas y frescos rodeado de copas, uvas, músicos y danzantes.
		Su imagen transmite placer, celebración y la importancia social del vino.
		El arte clásico retrata el vino como medio de unión y ritual, donde beber era compartir y celebrar.
Dionisio muestra cómo el vino siempre ha sido mucho más que una bebida: es un vehículo de cultura y emoción.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: El vino a través del tiempo
1. Arte clásico
		Pinturas, frescos y esculturas de Grecia y Roma.
		Símbolos: copas, uvas, banquetes.
		Mensaje: comunidad, festividad, ritual religioso.
		Ejemplo: frescos de Pompeya mostrando cenas con vino.
2. Renacimiento
		Siglos XV–XVI: Italia, España, Francia.
		El vino como elegancia, nobleza y espiritualidad.
		Presente en bodegones, retratos y escenas religiosas (por ejemplo, la Última Cena: vino como sangre de Cristo).
		Estética: luz, equilibrio, detalle minucioso; transmite respeto y sofisticación.
3. Arte moderno y contemporáneo
		Siglo XIX–XX y actualidad: impresionismo, expresionismo, pop art.
		El vino como libertad, expresión y hedonismo.
		Obras muestran escenas de café, bares, bodegones expresivos o botellas abstractas.
		Mensaje: disfrutar, experimentar, vivir el momento.
 Cada época revela cómo cambian los valores sociales y emocionales del vino.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    13: TemaContent(
      contenido: [
        '''1. Introducción: El dúo perfecto
El maridaje es el arte de combinar un vino con un alimento de manera que ambos se realcen, como un dúo musical donde cada instrumento brilla sin opacar al otro.
		El vino y la comida se influyen mutuamente: la acidez, taninos, dulzor o cuerpo del vino interactúan con la grasa, sal y textura de los alimentos.
		Un maridaje equilibrado potencia sabores, suaviza elementos fuertes y hace que la experiencia gastronómica sea memorable.
 Maridar bien no es una regla rígida: es entender cómo cada sabor interactúa y se armoniza.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad:  Historia del maridaje
		El primer maridaje registrado data de hace más de 2.000 años: vino con queso.
		En culturas mediterráneas, vino y pan o vino y carne eran combinaciones naturales, nacidas de la disponibilidad y armonía de sabores.
		Esto demuestra que el maridaje no es una moda moderna, sino una herencia cultural y sensorial.
 El vino ha acompañado la historia del hombre, convirtiéndose en un compañero de comida, celebración y arte.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Reglas básicas para acertar
1. Blancos
		Aromas frescos y acidez ligera combinan perfectamente con pescado, sushi, mariscos y ensaladas.
		Ejemplo: Albariño con ceviche o Chardonnay con pescado al horno.
2. Tintos
		Vinos con cuerpo y taninos maridan bien con carnes rojas, guisos, estofados o quesos curados.
		Ejemplo: Cabernet Sauvignon con entrecot o Tempranillo con queso manchego.
3. Rosados
		Versátiles y frescos, ideales para pastas, ensaladas mediterráneas o platos ligeros.
		Ejemplo: Garnacha Rosado con pasta al pesto o ensalada de quinoa.
4. Espumosos
		Burbujeantes y refrescantes, acompañan aperitivos, mariscos o postres ligeros.
		Ejemplo: Cava Brut con ostras o Prosecco con fresas.
Consejos prácticos
	1.	Contraste vs. armonía: un vino ácido corta la grasa, un vino dulce suaviza lo picante.
	2.	Equilibrio: evita que un vino muy potente opaque un plato delicado.
	3.	Textura y temperatura: la densidad de la comida y la temperatura del vino afectan la percepción final.
 El maridaje no es solo ciencia, también es sensibilidad y experimentación.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    14: TemaContent(
      contenido: [
        '''1. Introducción: La música transforma la experiencia
La forma en que percibimos un vino no depende solo de su aroma o sabor: la música puede alterar su percepción, afectando cómo valoramos cuerpo, acidez y dulzor.
		Estudios científicos muestran que los estímulos auditivos influyen en los sentidos del gusto y olfato.
		Una misma copa de vino puede sentirse más elegante, más intensa o más ligera según el género musical que se escucha.
		Por eso, combinar vino y música es una forma de crear experiencias multisensoriales memorables.
 Vino y música no solo se disfrutan, se sienten juntos.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: ciencia y percepción
		Experimento: participantes cataban vinos mientras escuchaban música clásica, rock o silencio.
		Resultado: la música clásica resaltaba notas elegantes y complejas, mientras que música intensa o rápida podía hacer que los vinos parecieran más agresivos o frutales.
		Conclusión: la armonía musical influye directamente en cómo percibimos aroma, sabor y textura del vino.
 El cerebro integra estímulos sensoriales: el oído modifica la experiencia gustativa.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Guía de armonías
1. Jazz suave
		Vinos sugeridos: Chardonnay, Pinot Noir.
		Por qué: notas complejas y elegantes que combinan con melodías suaves y sofisticadas.
2. Blues
		Vinos sugeridos: Merlot.
		Por qué: cuerpo medio y sabor aterciopelado, que acompaña la intensidad emocional del blues.
3. Rock clásico
		Vinos sugeridos: Rioja, Malbec.
		Por qué: sabores potentes y robustos que coinciden con la energía y la fuerza de la música.
4. Pop alegre
		Vinos sugeridos: Rosados frescos.
		Por qué: notas ligeras y afrutadas, ideales para acompañar música vibrante y optimista.
5. Música electrónica
		Vinos sugeridos: Espumosos (Cava, Champagne, Prosecco).
		Por qué: ritmo y burbujas se complementan, creando sensaciones dinámicas y festivas.
Tip de sumiller: La música no solo realza el sabor, también influye en ritmo de consumo y temperatura percibida del vino.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    15: TemaContent(
      contenido: [
        '''1. Introducción: Viajar a través del vino
Recorrer rutas del vino es viajar con todos los sentidos: conocer sabores, aromas, paisajes, culturas y tradiciones en cada región vitivinícola.
		Cada región tiene variedades autóctonas, métodos de cultivo y técnicas de elaboración únicas.
		Explorar una ruta del vino es también aprender historia, gastronomía y patrimonio cultural.
		Viajar con la copa en la mano permite experimentar la relación entre el entorno, el clima y el vino.
 El vino es un pasaporte para descubrir el mundo.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad:  Rutas del vino oficiales
		Existen más de 70 rutas del vino reconocidas oficialmente en todo el mundo.
		Cada ruta ofrece visitas a bodegas, catas guiadas, museos del vino y experiencias gastronómicas.
		Las rutas no solo muestran el vino: enseñan paisajes, historia y cultura local, convirtiendo la cata en una experiencia inmersiva.
 Viajar por el vino es como leer un libro de historia con aroma y sabor.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Destinos imperdibles
Tip del sumiller viajero: Cada región refleja terroir, clima y cultura local, aprendiendo esto se entiende por qué el mismo tipo de uva tiene perfiles distintos según su origen.
1. Burdeos, Francia 🇫🇷
		Rutas destacadas: Médoc, Saint-Émilion, Pomerol.
		Característica: elegancia, tradición y vinos longevos.
		Variedades: Cabernet Sauvignon, Merlot, Cabernet Franc, Sauvignon Blanc.
		Paisaje: viñedos clásicos, castillos históricos y riberas del río Garona.
		Experiencia: catas en châteaux, visitas a bodegas familiares y tours de gastronomía local.
2. Borgoña, Francia 🇫🇷
		Rutas destacadas: Côte de Nuits, Côte de Beaune.
		Característica: vinos complejos y refinados, gran expresión de terroir.
		Variedades: Pinot Noir y Chardonnay.
		Paisaje: colinas, viñedos escalonados y pueblos medievales.
		Experiencia: degustaciones de vinos icónicos y visitas a mercados locales de productos artesanales.
3. La Rioja, España 🇪🇸
		Rutas destacadas: Rioja Alta, Rioja Alavesa, Rioja Oriental.
		Característica: templados y estructurados, catedrales del vino español.
		Variedades: Tempranillo, Garnacha, Mazuelo.
		Paisaje: viñedos en laderas, bodegas centenarias, arquitectura histórica.
		Experiencia: visitas a bodegas con crianza en roble y degustación de tapas tradicionales.
4. Ribera del Duero, España 🇪🇸
		Rutas destacadas: Peñafiel, Aranda de Duero, Vega Sicilia.
		Característica: tintos potentes con crianza en roble.
		Variedad principal: Tempranillo (Tinto Fino).
		Paisaje: riberas del Duero, castillos medievales y bodegas modernas.
		Experiencia: catas verticales, bodegas de diseño contemporáneo y tours históricos.
5. Galicia, España 🇪🇸
		Rutas destacadas: Rías Baixas, Ribeiro, Valdeorras.
		Característica: blancos frescos y minerales.
		Variedades: Albariño, Godello, Loureira.
		Paisaje: rías, viñedos en terrazas, costa atlántica y pueblos pesqueros.
		Experiencia: maridaje con mariscos locales y visitas a bodegas tradicionales.
6. Andalucía, España 🇪🇸
		Rutas destacadas: Jerez de la Frontera, Montilla-Moriles, Málaga.
		Característica: vinos generosos y dulces únicos.
		Variedades: Palomino, Pedro Ximénez, Moscatel.
		Paisaje: bodegas históricas y pueblos con patio andaluz.
		Experiencia: degustaciones de vinos generosos, visita a bodegas con soleras centenarias y tapas típicas.
7. Toscana, Italia 🇮🇹
		Rutas destacadas: Chianti Classico, Montalcino, Montepulciano.
		Característica: combinación de arte, paisaje y vinos equilibrados.
		Variedades: Sangiovese, Vernaccia, Merlot.
		Paisaje: colinas onduladas, pueblos medievales y olivares.
		Experiencia: catas de Chianti y Brunello, visitas a villas históricas y clases de cocina italiana.
8. Mendoza, Argentina 🇦🇷
		Rutas destacadas: Luján de Cuyo, Valle de Uco, Maipú.
		Característica: altitud, sol intenso y Malbec emblemático.
		Variedades: Malbec, Cabernet Sauvignon, Torrontés.
		Paisaje: Andes, viñedos a gran altura y bodegas modernas con arquitectura espectacular.
		Experiencia: degustaciones al aire libre, tours en bicicleta por viñedos y maridajes con asado argentino.
9. Valle del Loira, Francia 🇫🇷
		Rutas destacadas: Sancerre, Pouilly-Fumé, Chinon.
		Característica: vinos blancos elegantes y refrescantes, tintos ligeros.
		Variedades: Sauvignon Blanc, Chenin Blanc, Cabernet Franc.
		Paisaje: castillos, ríos y viñedos en pendientes suaves.
		Experiencia: catas en castillos históricos y rutas en barco por el río Loira.
10. Oporto y Douro, Portugal 🇵🇹
		Rutas destacadas: Peso da Régua, Pinhão, Vila Nova de Gaia.
		Característica: vinos generosos, dulces y fortificados.
		Variedades: Touriga Nacional, Tinta Roriz, Touriga Franca.
		Paisaje: terrazas de viñedos en el río Duero, pueblos tradicionales.
		Experiencia: visitas a bodegas de oporto y catas verticales de añadas históricas.
 Tip profesional: Las rutas permiten no solo catar vino, sino entender cómo el terroir, la altitud, la orientación y el clima afectan el carácter y estilo de cada vino.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    16: TemaContent(
      contenido: [
        '''1. Introducción: El vino une
El vino ha sido un hilo conductor de la humanidad desde tiempos antiguos:
		Está presente en celebraciones, ceremonias religiosas, matrimonios y reuniones familiares.
		Más allá del sabor, el vino crea conexiones emocionales y sociales, fomenta la conversación y refuerza la complicidad entre quienes lo disfrutan.
		Cada cultura tiene su manera de ritualizar el vino, pero todas coinciden en un principio: el vino es un símbolo de unión y disfrute compartido.
 Más que beber, el vino es un acto de encuentro.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad:  Historia del brindis
		En la Antigua Roma, el brindis tenía un propósito práctico: demostrar que el vino no estaba envenenado.
		Las copas se chocaban con fuerza, mezclando unas gotas de cada una.
		Con el tiempo, el gesto pasó a ser un símbolo de amistad, respeto y buena voluntad.
		Hoy, el brindis mantiene la esencia de compartir y celebrar, incluso en reuniones informales.
 Un simple choque de copas es mucho más que sonido: es confianza y comunión.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Claves del ritual moderno
1. Elegir el vino adecuado para la ocasión
		Eventos formales: espumosos, blancos elegantes o tintos de crianza.
		Reuniones informales: rosados, blancos frescos o tintos jóvenes.
		Cada vino marca el tono del encuentro y refuerza la atmósfera deseada.
2. Brindar con contacto visual
		Mirar a los ojos de los presentes refuerza la conexión y la sinceridad.
		Evita hacer el brindis rápido o distraído: el gesto transmite respeto y atención.
3. Servir con atención y respeto
		Temperatura correcta según tipo de vino.
		Copas limpias y llenadas hasta la mitad para permitir oxigenación.
		Servir despacio, prestando cuidado a cada invitado.
4. Compartir, conversar y disfrutar
		El vino no es solo líquido: es catalizador de experiencias y relatos.
		Promueve diálogo, historias y momentos memorables.
		Fomenta la empatía y la sociabilidad, convirtiendo un simple encuentro en un ritual único.
 Tip del sumiller social: Un vino bien elegido, servido con respeto y acompañado de conversación, transforma cualquier reunión en un recuerdo imborrable.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    17: TemaContent(
      contenido: [
        '''1. Introducción: La etiqueta como guía
La etiqueta de un vino es mucho más que un adorno: es una información esencial que permite conocer la historia del vino antes de abrir la botella.
		Nos indica origen, añada, variedad, bodega, graduación alcohólica y características especiales.
		Aprender a leerla correctamente nos ayuda a elegir mejor el vino según ocasión, maridaje y preferencia.
		Cada etiqueta es un mensaje del viticultor al consumidor, una invitación a descubrir su trabajo y terroir.
 Interpretar una etiqueta es como leer una carta escrita con aromas, tiempo y tierra.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: La historia de la etiqueta
		La primera etiqueta moderna apareció en el siglo XVIII, para identificar los vinos en la exportación.
		Originalmente solo incluía bodega y origen, pero hoy las etiquetas muestran información mucho más detallada:
	o	Denominación de origen
	o	Año de cosecha (añada)
	o	Variedad de uva
	o	Grado alcohólico y volumen
	o	Notas de cata o maridaje sugerido
 Leer una etiqueta correctamente nos permite anticipar la experiencia de degustación.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Desglosando la etiqueta
1. Denominación de origen
		Indica la región y el control de calidad.
		Ejemplos: Rioja, Burdeos, Napa Valley.
		Las denominaciones garantizan que el vino cumple con normas de producción y características típicas de esa región.
2. Añada
		Año en que se vendimió la uva.
		Indica la calidad ligada al clima de esa cosecha.
		Algunas regiones (como Rioja o Burdeos) tienen añadas más famosas que otras, afectando precio y perfil de sabor.
3. Bodega
		Nombre de la empresa o productor del vino.
		Da pistas sobre estilo, reputación y consistencia del producto.
		Algunas bodegas famosas tienen un estilo muy definido, por ejemplo: crianza en roble o vinos jóvenes frutales.
4. Variedad de uva
		Conocer la uva principal ayuda a anticipar sabor, cuerpo y aromas.
		Ejemplos: Tempranillo (Rioja), Malbec (Mendoza), Chardonnay (Borgoña).
5. Graduación alcohólica
		Expresada en % Vol.
		Indica intensidad, cuerpo y sensación de calor en boca.
		Vinos con más alcohol suelen ser más estructurados y persistentes.
6. Información complementaria
		Maridaje sugerido, tipo de crianza, notas de cata o certificado ecológico.
		Algunos vinos incluyen premios o medallas, indicativos de reconocimiento internacional.
Tip del sumiller: Antes de abrir una botella, leer la etiqueta permite anticipar la experiencia y elegir el momento adecuado para disfrutarlo.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    18: TemaContent(
      contenido: [
        '''1. Introducción: La importancia de conservar y servir
El vino es un ser vivo embotellado: continúa evolucionando después de salir de la bodega.
		Su sabor, aroma y textura pueden cambiar significativamente según cómo lo conservemos y sirvamos.
		Aprender buenas prácticas permite disfrutar de cada botella en su máximo esplendor, ya sea un tinto añejado o un blanco fresco.
		Malas condiciones pueden estropear el vino antes de abrirlo, perdiendo años de trabajo y cuidado de la viña.
 Conservar y servir correctamente es un acto de respeto hacia el vino y quienes lo disfrutan.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: El vino y su sensibilidad
		El vino es sensible a la luz, la temperatura y el oxígeno.
		En bodegas históricas, las botellas se almacenan horizontalmente, en cuevas oscuras y con temperatura constante, para preservar su calidad.
		Incluso los vinos listos para beber disfrutan de un servicio atento: desde el descorche hasta la copa.
 Cada botella guarda el tiempo del viñedo, y cada gesto de conservación lo protege.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Conservación y servicio
1. Posición de la botella
		Horizontal: las botellas con corcho se deben almacenar horizontalmente para mantener el corcho húmedo y evitar oxidación.
		Vertical: vinos de consumo rápido o con tapón sintético pueden guardarse de pie.
2. Luz
		Evitar luz directa, especialmente solar o fluorescente.
		La luz puede causar efecto “rayos UV”, alterando aromas y provocando envejecimiento prematuro (“cooked wine”).
3. Temperatura
		Ideal: 12–16 °C para tintos, 8–12 °C para blancos y rosados, 6–8 °C para espumosos.
		Cambios bruscos pueden estresar el vino, afectando aromas y estructura.
4. Humedad
		Mantener entre 60–75% para que los corchos no se sequen ni se formen mohos indeseados.
5. Descorche y aireación
		Abrir el vino con cuidado usando sacacorchos de calidad.
		Algunos vinos, especialmente los tintos de crianza, benefician de decantación para oxigenar y liberar aromas.
		Los blancos y espumosos jóvenes no requieren aireación prolongada.
6. Servicio
		Usar copas adecuadas para cada tipo de vino.
		Servir en cantidades moderadas (aprox. 1/3 de copa) para permitir oxigenación.
		Observar temperatura en copa antes de servir, ajustando si es necesario (por ejemplo, un blanco demasiado frío puede perder aromas).
 Tip profesional: El cuidado del vino desde la bodega hasta la copa marca la diferencia entre una experiencia memorable y un vino arruinado.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    19: TemaContent(
      contenido: [
        '''1. Introducción: La elección del vino
Elegir un vino puede parecer complicado, pero con estrategias simples y conocimiento básico, se puede acertar siempre:
		Un buen vino no depende solo del precio, sino de la ocasión, la comida, el paladar de los comensales y la relación calidad-precio.
		Aprender a leer la carta de vinos o la etiqueta de la botella nos da seguridad y confianza.
		La elección adecuada potencia la comida, la conversación y la experiencia gastronómica.
 Elegir vino es anticipar placer, no adivinarlo.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: El vino y el entorno
		En restaurantes, la temperatura y la conservación influyen en cómo se percibe el vino.
		En tiendas, muchas veces se elige por etiqueta o precio, sin conocer añada, bodega o estilo.
		Saber cómo interpretar la carta y la etiqueta permite seleccionar vinos de manera consciente y acertada.
 Un vino elegido con criterio se disfruta el doble.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Consejos para acertar
1. Define la ocasión
		Cena informal → vinos jóvenes, frescos y fáciles de beber.
		Comida especial → vinos con crianza o espumosos elegantes.
		Celebración → espumosos o vinos dulces de postre.
2. Considera el maridaje
		Blancos → pescados, mariscos, ensaladas, pastas ligeras.
		Tintos → carnes rojas, guisos, quesos curados.
		Rosados → cocina mediterránea, tapas, pasta.
		Espumosos → aperitivos, sushi, postres ligeros.
		Vinos dulces → postres, foie, quesos azules.
3. Lee la carta o etiqueta
		Observa denominación de origen, añada y bodega.
		Revisa grado alcohólico y variedad de uva.
		Busca notas de cata o maridaje sugerido que encajen con la comida y el paladar.
4. Ajusta al presupuesto
		No siempre el más caro es mejor.
		Busca relación calidad-precio: vinos de calidad media con buenas críticas o premios pueden sorprender.
		Pregunta al sommelier o dependiente por recomendaciones según presupuesto y ocasión.
5. Prueba y confía en tu paladar
		Si tienes la oportunidad, pide degustar una muestra antes de decidir.
		Tu gusto personal es tan importante como las recomendaciones.
		La experiencia acumula conocimiento: cuanto más pruebes, mejor elegirás.
 Tip profesional: Mantén siempre un equilibrio entre ocasión, comida, presupuesto y gusto personal. Esa es la clave del éxito.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    20: TemaContent(
      contenido: [
        '''1. Introducción: Un vistazo al futuro
El mundo del vino está cambiando: la sostenibilidad y la tecnología marcan la nueva era del sector vitivinícola.
		Los consumidores buscan vinos responsables con el medio ambiente y respetuosos con la salud.
		La innovación tecnológica permite controlar cada fase de la producción, desde la viña hasta la copa.
		Los vinos del futuro no solo serán sabrosos, sino también éticos y sostenibles, contribuyendo a un planeta más saludable.
 Cada sorbo puede ser un acto consciente y responsable.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: Tendencias sostenibles
		Los vinos ecológicos están libres de pesticidas sintéticos y fertilizantes químicos, priorizando la salud del suelo y la viña.
		Los vinos veganos evitan productos animales en clarificación y filtrado, como la clara de huevo o la gelatina.
		Los vinos biodinámicos siguen calendarios lunares y prácticas agrícolas holísticas, buscando armonía con la naturaleza.
		La tecnología permite optimizar el riego, la fermentación y la conservación, reduciendo desperdicio y energía.
 Cada etiqueta sostenible refleja un compromiso con la tierra y la calidad.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Tipos de vinos sostenibles
1. Vinos ecológicos
		Certificación oficial: indican ausencia de químicos sintéticos.
		Beneficios: respeto al suelo, reducción de residuos químicos, vinos más naturales.
		Ejemplos: Rioja ecológico, Ribera del Duero ecológica.
2. Vinos veganos
		Clarificación con productos vegetales como bentonita o carbón vegetal.
		Beneficios: aptos para dietas veganas, no afectan el sabor ni la calidad.
		Ejemplos: Sauvignon Blanc vegano de Rueda, Malbec vegano de Mendoza.
3. Vinos biodinámicos
		Producción basada en principios de Rudolf Steiner.
		Uso de compost preparados, calendario lunar y mínima intervención.
		Beneficios: mayor expresión del terroir, vinos vivos y equilibrados.
		Ejemplos: Champagne biodinámico, Syrah biodinámico del Valle del Ródano.
4. Tecnología aplicada al vino
		Sensores para controlar temperatura, humedad y maduración de la uva.
		Automatización de riego y vendimia para optimizar recursos.
		Fermentaciones monitorizadas con precisión para coherencia y calidad constante.
 Tip profesional: Buscar vinos sostenibles es apoyar un estilo de vida consciente sin renunciar a la calidad y el placer.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),
    
    21: TemaContent(
      contenido: [
        '''1. Introducción: El placer de tener tu propia bodega
Tener una bodega personal no solo es guardar vino, es crear una experiencia y un patrimonio líquido.
		Cada botella refleja un momento, un viaje o un descubrimiento.
		Una bodega bien organizada permite disfrutar de vinos en su punto óptimo, ya sea un tinto de guarda o un espumoso para celebrar.
		Con planificación, cualquier amante del vino puede tener su bodega profesional en casa, sin importar el espacio disponible.
 Una bodega personal es un refugio de aromas, recuerdos y conocimiento.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''2. Curiosidad: Historia de las bodegas domésticas
		Las bodegas en casa surgen de la pasión y la cultura del vino, no solo del lujo.
		Antiguamente, se almacenaban en sótanos frescos y oscuros; hoy se utilizan armarios climatizados, cavas y vinotecas inteligentes.
		Una bodega no es solo un lugar de almacenamiento: es un espacio de aprendizaje, conservación y disfrute sensorial.
 Cada botella cuenta una historia y se convierte en un tesoro cuando se cuida correctamente.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),

        '''3. Enseñanza práctica: Organización y conservación
1. Espacio y temperatura
		La temperatura ideal es constante: 12–16 °C para tintos, 8–12 °C para blancos y rosados, 6–8 °C para espumosos.
		Evitar luz directa y vibraciones.
		La humedad debe mantenerse entre 60–75% para que los corchos no se sequen.
2. Posición de las botellas
		Horizontal para vinos con corcho natural, manteniendo el corcho húmedo.
		Vertical para vinos de consumo rápido o con tapón sintético.
3. Clasificación
		Por tipo de vino: tintos, blancos, rosados, espumosos, dulces.
		Por variedad de uva o denominación de origen.
		Por año de añada o momento de consumo previsto.
4. Rotación de botellas
		Aplicar la regla “primero en entrar, primero en salir” (FIFO) para consumir los vinos jóvenes antes de que pierdan frescura.
		Mantener vinos de guarda en zonas más frescas y oscuras hasta que alcancen su punto óptimo.
5. Accesorios y herramientas
		Vinotecas climatizadas o armarios de madera ventilados.
		Sacacorchos profesional, decantadores y copas adecuadas.
		Etiquetas o registros para anotar fecha de compra, notas de cata y maridajes sugeridos.
 Tip profesional: Una bodega organizada facilita el disfrute, la conservación y la planificación de catas y celebraciones.''',

        FichaTema(
          pregunta: 'pregunta',
          respuesta: 'respuesta',
        ),
      ],
    ),    

    22: TemaContent(
      contenido: [
        '''

¡Has llegado al momento culminante de tu formación vinícola! Esta prueba final evaluará de manera integral todo lo que has aprendido durante el curso My Secret Wine.


CARACTERÍSTICAS DE LA PRUEBA:

• 21 preguntas cuidadosamente seleccionadas
• Una pregunta representativa de cada tema estudiado
• Tiempo límite: 30 segundos por pregunta
• Formato: opción múltiple con 4 alternativas



CRITERIOS DE EVALUACIÓN:

21 respuestas correctas:
🏆 PERFECTO - Experto en vinos

18-20 respuestas correctas:
🥈 APROBADO - Conocimientos sólidos  

Menos de 18 correctas:
📚 REPASO NECESARIO


CONSEJOS PARA EL ÉXITO:

• Revisa los contenidos de todos los temas
• Practica con las fichas giratorias
• Confía en tu conocimiento adquirido
• Lee cada pregunta con atención
• No te precipites, tienes tiempo suficiente


UNA VEZ APROBADA:

Al superar esta prueba final, desbloquearás el acceso exclusivo a la "Cata Guiada Final", donde pondrás en práctica todo tu conocimiento teórico en una experiencia sensorial completa.

¡Es tu momento de brillar como conocedor del vino! 🍷

''',
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
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/temas_content.dart';
import '../data/test_preguntas.dart';
import 'dart:math' as math;

// Colores temáticos de vino
class WineColors {
  static const Color redWine = Color(0xFF722F37); // Vino tinto
  static const Color whiteWine = Color(0xFFF7E7CE); // Vino blanco
}

class TemaDetallePage extends StatefulWidget {
  final String temaTitle;
  final int temaNumber;
  final AudioPlayer audioPlayer;
  final Function(int)? onTestCompleted; // Callback para cuando se completa un test

  const TemaDetallePage({
    super.key,
    required this.temaTitle,
    required this.temaNumber,
    required this.audioPlayer,
    this.onTestCompleted,
  });

  @override
  State<TemaDetallePage> createState() => _TemaDetallePageState();
}

class _TemaDetallePageState extends State<TemaDetallePage> with TickerProviderStateMixin {
  int preguntaActual = 0;
  int respuestasCorrectas = 0;
  Set<int> fichasVolteadas = {}; // Para rastrear qué fichas están volteadas
  bool isMusicPlaying = true; // Asumimos que la música está sonando al inicio
  Map<int, AnimationController> fichaControllers = {}; // Controladores de animación por ficha

  @override
  void dispose() {
    // Limpiar todos los controladores de animación
    for (var controller in fichaControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _toggleMusic() async {
    try {
      if (isMusicPlaying) {
        await widget.audioPlayer.pause();
        setState(() {
          isMusicPlaying = false;
        });
      } else {
        await widget.audioPlayer.resume();
        setState(() {
          isMusicPlaying = true;
        });
      }
    } catch (e) {
      debugPrint('Error al cambiar el estado de la música: $e');
    }
  }

  void _showOptionsDialog() { //popup con opciones
    showDialog(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      '¿Qué deseas hacer?',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.purple],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _toggleMusic();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => const LinearGradient(
                                  colors: [Colors.orange, Colors.purple],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds),
                                child: Icon(
                                  isMusicPlaying ? Icons.volume_up : Icons.volume_off,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                isMusicPlaying ? 'Silenciar música' : 'Activar música',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.purple],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'VOLVER AL TEMARIO',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final temaContent = TemasData.getTema(widget.temaNumber) ?? 
                       TemasData.getTemaPorDefecto(widget.temaNumber);
    
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            _extractTitleOnly(widget.temaTitle),
            style: const TextStyle(color: Colors.white),
          ),
        ), //título del appbar
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        actions: [
          
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.purple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: InkWell(
                  onTap: () {
                    _showOptionsDialog();
                  },
                  child: Center(
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.orange, Colors.purple],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ), // Botón de configurarción
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildContenidoConFichas(temaContent),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container( //botón de PRÁCTICA
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.purple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(2), // Padding para el borde gradiente
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _mostrarPractica();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Es hora de disfrutar',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para extraer el título sin la palabra "tema" pero manteniendo el número
  String _extractTitleOnly(String fullTitle) {
    if (fullTitle.contains('tema ') && fullTitle.contains(' - ')) {
      // Extraer número y título: "tema 1 - Título" -> "1 - Título"
      String withoutTema = fullTitle.replaceFirst('tema ', '');
      return withoutTema;
    }
    return fullTitle;
  }

  Widget _buildFichaTema(FichaTema ficha, int index) {
    bool estaVolteada = fichasVolteadas.contains(index);
    
    if (!fichaControllers.containsKey(index)) {
      fichaControllers[index] = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );
    }
    
    final AnimationController controller = fichaControllers[index]!;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            if (estaVolteada) {
              fichasVolteadas.remove(index);
            } else {
              fichasVolteadas.add(index);
            }
          });
          
          // Ejecutar animación de volteo
          if (estaVolteada) {
            await controller.reverse();
          } else {
            await controller.forward();
          }
        },
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            // Usar curva suave para la animación
            final animationValue = Curves.easeInOut.transform(controller.value);
            final isShowingFront = animationValue < 0.5;
            
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // Perspectiva
                ..rotateY(animationValue * math.pi),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isShowingFront 
                      ? [Colors.orange, Colors.purple]  
                      : [Colors.orange, Colors.purple], 
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    color: isShowingFront ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: isShowingFront
                    ? _buildPreguntaWidget(ficha.pregunta)
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(math.pi),
                        child: _buildRespuestaWidget(ficha.respuesta),
                      ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPreguntaWidget(String pregunta) { //preguntas de las fichas
    return Container(
      key: const ValueKey('pregunta'),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.help_outline,
            color: Colors.orange,
            size: 24,
          ),
          const SizedBox(height: 12),
          Text(
            pregunta,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRespuestaWidget(String respuesta) { //respuestas de las fichas
    return Container(
      key: const ValueKey('respuesta'),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            respuesta,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContenidoConFichas(TemaContent temaContent) {
    List<Widget> widgets = [];
    
    for (int i = 0; i < temaContent.contenido.length; i++) {
      var item = temaContent.contenido[i];
      
      if (item is String) {
        // Es texto normal
        widgets.add(
          Text(
            item,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        );
      } else if (item is FichaTema) {
        // Es una ficha
        widgets.add(_buildFichaTema(item, i));
      }
      
      // Agregar espacio entre elementos (excepto al final)
      if (i < temaContent.contenido.length - 1) {
        widgets.add(const SizedBox(height: 16));
      }
    }
    
    // Agregar el botón "INICIAR TEST" al final del contenido
    widgets.add(const SizedBox(height: 30)); // Espacio antes del botón
    widgets.add(
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.orange, Colors.purple],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: () {
            _iniciarTest();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Comprueba lo que sabes!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(width: 12),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  void _mostrarPractica() { //popup de práctica (vacío por ahora)
    showDialog(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  color: Colors.orange,
                  size: 60,
                ),
                const Text(
                  'Practica',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Sección de práctica en desarrollo...',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.purple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Cerrar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _iniciarTest() {
    final preguntas = TestPorTema.preguntasPorTema[widget.temaNumber] ?? [];
    if (preguntas.isEmpty) {
      _mostrarMensajeNoHayTest();
    } else {
      setState(() {
        preguntaActual = 0;
        respuestasCorrectas = 0;
      });
      _mostrarTest(preguntas);
    }
  }

  void _mostrarMensajeNoHayTest() { //popup de no hay test disponible en este tema
    showDialog(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.quiz,
                  color: Colors.orange,
                  size: 60,
                ),
                const Text(
                  'Test no disponible',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Aún no hay preguntas disponibles para este tema. ¡Pronto estará listo!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.purple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Entendido',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _mostrarTest(List<PreguntaTest> preguntas) {
    int? respuestaSeleccionada;
    
    showDialog( //preguntas del test
      context: context,
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.9),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            final pregunta = preguntas[preguntaActual];
            
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    
                    Row( // Header con progreso (sin aciertos)
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pregunta ${preguntaActual + 1}/${preguntas.length}',
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    
                    
                    Expanded( // Pregunta sin fondo
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            pregunta.pregunta,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                  
                    Expanded( // Opciones de respuesta a, b, c, d
                      flex: 3,
                      child: ListView.builder(
                        itemCount: pregunta.opciones.length,
                        itemBuilder: (context, index) {
                          final opcionLetras = ['   a)', '   b)', '   c)', '   d)'];
                          final isSelected = respuestaSeleccionada == index;
                          
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              gradient: isSelected 
                                ? const LinearGradient(
                                    colors: [Colors.orange, Colors.purple],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  )
                                : null,
                              border: isSelected ? null : Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: isSelected ? const EdgeInsets.all(2) : EdgeInsets.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(isSelected ? 8 : 10),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  setStateDialog(() {
                                    respuestaSeleccionada = index;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(isSelected ? 8 : 10),
                                  ),
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      opcionLetras[index],
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        pregunta.opciones[index],
                                        style: const TextStyle(fontSize: 16),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    
                    Container( // Botón SIGUIENTE
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: respuestaSeleccionada != null 
                          ? const LinearGradient(
                              colors: [Colors.orange, Colors.purple],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )
                          : null,
                        border: respuestaSeleccionada == null 
                          ? Border.all(color: Colors.white, width: 1)
                          : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(respuestaSeleccionada != null ? 9 : 8),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Solo proceder si hay una respuesta seleccionada
                            if (respuestaSeleccionada != null) {
                              bool esCorrecta = respuestaSeleccionada == pregunta.respuestaCorrecta;
                              if (esCorrecta) {
                                respuestasCorrectas++;
                              }
                              
                              _mostrarResultadoPregunta(context, esCorrecta, pregunta.explicacion, () {
                                if (preguntaActual < preguntas.length - 1) {
                                  setStateDialog(() {
                                    preguntaActual++;
                                    respuestaSeleccionada = null; // Reset para la siguiente pregunta
                                  });
                                } else {
                                  Navigator.of(context).pop();
                                  _mostrarResultadoFinal(preguntas.length);
                                }
                              });
                            }
                            // Si no hay respuesta seleccionada, no hacer nada
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(respuestaSeleccionada != null ? 9 : 8),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Siguiente',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _mostrarResultadoPregunta(BuildContext context, bool esCorrecta, String explicacion, VoidCallback onContinuar) { //resultado de cada respuesta
    showDialog(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  esCorrecta ? Icons.check_circle : Icons.cancel,
                  color: esCorrecta ? Colors.green : Colors.red,
                  size: 50,
                ),
                Text(
                  esCorrecta ? '¡Correcto!' : 'Incorrecto',
                  style: TextStyle(
                    color: esCorrecta ? Colors.green : Colors.red,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    explicacion,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.purple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onContinuar();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Continuar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _mostrarResultadoFinal(int totalPreguntas) {
    String mensaje;
    String emoji;
    bool testPasado = false;
    String copaState = 'empty'; // Estado de la copa: empty, half, full
    
    // Implementar los 3 casos según las respuestas correctas
    if (respuestasCorrectas == 5) {
      // Caso 1: 5/5 preguntas correctas - Copa llena + desbloquea tema
      mensaje = '¡Perfecto! Excelente conocimiento sobre el mundo del vino!';
      emoji = '🏆';
      testPasado = true;
      copaState = 'full';
    } else if (respuestasCorrectas == 4) {
      // Caso 2: 4/5 preguntas correctas - Copa medio llena + desbloquea tema
      mensaje = '¡Muy bien! Gran conocimiento sobre el mundo del vino!';
      emoji = '👍';
      testPasado = true;
      copaState = 'half';
    } else {
      // Caso 3: 3 o menos preguntas correctas - No desbloquea tema
      mensaje = 'Te invitamos a repasar el tema y volver a intentarlo.';
      emoji = '📚';
      testPasado = false;
      copaState = 'empty';
    }

    // Si el test se pasó exitosamente, desbloquear el siguiente tema y guardar estado de copa
    if (testPasado && widget.onTestCompleted != null) {
      widget.onTestCompleted!(widget.temaNumber);
      _saveGlassState(widget.temaNumber, copaState);
    }

    showDialog(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  emoji,
                  style: const TextStyle(fontSize: 80),
                ),
                const Text(
                  'Test finalizado.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    Text(
                      'Puntuación: $respuestasCorrectas/$totalPreguntas',
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                Text(
                  mensaje,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                // Mostrar botones diferentes según si pasó el test o no
                if (testPasado) ...[
                  // Caso 1 y 2: Test pasado - Solo botón "Volver al Temario"
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.purple],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Cerrar el diálogo y volver al temario
                          Navigator.of(context).pop(); // Cierra el diálogo
                          Navigator.of(context).pop(); // Vuelve al temario
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Volver al Temario',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  // Caso 3: Test no pasado - Botón "Repasar Tema"
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.purple],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Cerrar el diálogo del resultado y quedarse en el tema para repasar
                          Navigator.of(context).pop(); // Solo cierra el diálogo del resultado
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Repasar Tema',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Botón secundario para volver al temario
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Cerrar el diálogo y volver al temario
                        Navigator.of(context).pop(); // Cierra el diálogo
                        Navigator.of(context).pop(); // Vuelve al temario
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Volver al Temario',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  // Método para guardar el estado de la copa en SharedPreferences
  Future<void> _saveGlassState(int themeNumber, String state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('glass_state_$themeNumber', state);
  }
}
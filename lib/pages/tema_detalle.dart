import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'temas_content.dart';
import 'test_preguntas.dart';
import 'dart:math' as math;
import 'dart:async';
import '../main.dart';

class TemaDetallePage extends StatefulWidget {
  final String temaTitle;
  final int temaNumber;
  final AudioPlayer audioPlayer;
  final Function(int)? onTestCompleted; // Callback para cuando se completa un test
  final bool isGuestMode;

  const TemaDetallePage({
    super.key,
    required this.temaTitle,
    required this.temaNumber,
    required this.audioPlayer,
    this.onTestCompleted,
    this.isGuestMode = false,
  });

  @override
  State<TemaDetallePage> createState() => _TemaDetallePageState();
}

enum _FichaTipo { foto, cata, tips, generic }

class _TemaDetallePageState extends State<TemaDetallePage> with TickerProviderStateMixin {
  int preguntaActual = 0;
  int respuestasCorrectas = 0;
  Set<int> fichasVolteadas = {}; // Para rastrear qué fichas están volteadas
  bool isMusicPlaying = false; // La música no suena desde el inicio
  Map<int, AnimationController> fichaControllers = {}; // Controladores de animación por ficha
  bool testAttempted = false; // Para saber si el test ya fue intentado
  int testAttempts = 0; // Número de intentos realizados (máximo 2)
  bool testPassed = false; // Si el test ya fue aprobado

  @override
  void initState() {
    super.initState();
    _loadTestProgress();
  }

  @override
  void dispose() {
    // Limpiar todos los controladores de animación
    for (var controller in fichaControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  // Obtener colores según el tema
  Color _getBackgroundColor() => globalThemeNotifier.value ? Colors.black : Colors.white;
  Color _getTextColor() => globalThemeNotifier.value ? Colors.white : Colors.black;
  Color _getBorderColor() => globalThemeNotifier.value ? Colors.white : Colors.black;

  Future<void> _toggleMusic() async {
    try {
      if (isMusicPlaying) {
        await widget.audioPlayer.pause();
        setState(() {
          isMusicPlaying = false;
        });
      } else {
        // Configurar la fuente de audio si es la primera vez
        await widget.audioPlayer.setSource(AssetSource('audio/background.mp3'));
        await widget.audioPlayer.setReleaseMode(ReleaseMode.loop);
        await widget.audioPlayer.resume();
        setState(() {
          isMusicPlaying = true;
        });
      }
    } catch (e) {
      // Error al cambiar el estado de la música - mostrar información
      debugPrint('Error con la música: $e');
      // Resetear el estado en caso de error
      if (mounted) {
        setState(() {
          isMusicPlaying = false;
        });
        // Mostrar mensaje al usuario
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al reproducir música: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _showOptionsDialog() { //popup con opciones
    _showDialogWithFade(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) => Dialog(
          backgroundColor: Colors.transparent,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: _getBackgroundColor(),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _getBorderColor(), width: 2),
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribución uniforme
                  children: [
                    Text(
                      '¿Qué deseas hacer?',
                      style: TextStyle(color: _getTextColor(), fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.purple],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(2), // Padding para el borde gradiente
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getBackgroundColor(),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _toggleMusic();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _getBackgroundColor(),
                            foregroundColor: _getTextColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isMusicPlaying ? Icons.volume_up : Icons.volume_off,
                                color: _getTextColor(),
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                isMusicPlaying ? 'Silenciar música' : 'Activar música',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Más separación entre botones
                    // Botón de cambiar contraste
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.purple],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(2), // Padding para el borde gradiente
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getBackgroundColor(),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              toggleGlobalTheme();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _getBackgroundColor(),
                            foregroundColor: _getTextColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                globalThemeNotifier.value ? Icons.light_mode : Icons.dark_mode,
                                color: _getTextColor(),
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                globalThemeNotifier.value ? 'Tema claro' : 'Tema oscuro',
                                style: const TextStyle(fontSize: 16),
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
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(2), // Padding para el borde gradiente
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getBackgroundColor(),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _showExitConfirmationDialog();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _getBackgroundColor(),
                            foregroundColor: _getTextColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.close,
                                color: _getTextColor(),
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text('Cerrar aplicación', style: TextStyle(fontSize: 16, color: _getTextColor())),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final temaContent = TemasData.getTema(widget.temaNumber) ?? 
                       TemasData.getTemaPorDefecto(widget.temaNumber);
    
    return ValueListenableBuilder<bool>(
      valueListenable: globalThemeNotifier,
      builder: (context, isDark, child) {
        return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            _extractTitleOnly(widget.temaTitle),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: _getTextColor(),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ), //título del appbar
        centerTitle: true,
        backgroundColor: _getBackgroundColor(),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 22.0, bottom: 10.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop(); // Volver al temario
            },
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.orange, Colors.purple],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 48,
              ),
            ),
          ),
        ), // Botón de volver al temario
        actions: [
          
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 22.0, bottom: 10.0),
            child: InkWell(
              onTap: () {
                _showOptionsDialog();
              },
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Colors.orange, Colors.purple],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
          ), // Botón de configuración
        ],
      ),
      backgroundColor: _getBackgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: _getBackgroundColor(),
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: _getBorderColor(), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _getBackgroundColor(),
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

              SizedBox( //botón DEMUESTRA LO QUE SABES
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.purple],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
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
                      onPressed: () => _mostrarPractica(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getBackgroundColor(),
                        foregroundColor: _getTextColor(),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        testPassed
                            ? 'Test aprobado'
                            : (testAttempts >= 2
                                ? 'Intentos agotados'
                                : (testAttempted
                                    ? 'Vuelve a intentarlo!'
                                    : 'Demuestra lo que sabes!')),
                        style: TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.bold, 
                          color: _getTextColor(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
      },
    );
  }

  // Método para extraer el título sin la palabra "tema" pero manteniendo el número
  String _extractTitleOnly(String fullTitle) {
    if (fullTitle.contains('tema ') && fullTitle.contains(' ')) {
      // Extraer número y título: "tema 1 - Título" -> "1 - Título"
      String withoutTema = fullTitle.replaceFirst('tema ', '');
      return withoutTema;
    }
    return fullTitle;
  }

  _FichaTipo _fichaTipoFromIndex(int fichaIndexWithinTema) {
    switch (fichaIndexWithinTema) {
      case 0:
        return _FichaTipo.foto;
      case 1:
        return _FichaTipo.cata;
      case 2:
        return _FichaTipo.tips;
      default:
        return _FichaTipo.generic;
    }
  }

  String _fotoAssetPathForTema() {
    // Convención: añade una imagen por tema en assets/images/tema_<n>.png
    // Ejemplo: assets/images/tema_1.png
    return 'assets/images/tema_${widget.temaNumber}.png';
  }

  Widget _buildFichaFront(_FichaTipo tipo) {
    switch (tipo) {
      case _FichaTipo.foto:
        return Container(
          key: const ValueKey('ficha_foto_front'),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              _fotoAssetPathForTema(),
              height: 110,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/app_icon.png',
                  height: 180,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        );
      case _FichaTipo.cata:
        return _buildFichaLabelFront('CATA');
      case _FichaTipo.tips:
        return _buildFichaLabelFront('TIPS');
      case _FichaTipo.generic:
        return _buildFichaLabelFront('FICHA');
    }
  }

  Widget _buildFichaLabelFront(String label) {
    return Container(
      key: const ValueKey('ficha_label_front'),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.style,
            color: _getTextColor(),
            size: 30,
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              color: globalThemeNotifier.value ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFichaTema(FichaTema ficha, int index, int fichaIndexWithinTema) {
    final tipo = _fichaTipoFromIndex(fichaIndexWithinTema);
    bool estaVolteada = fichasVolteadas.contains(index);
    const double fichaFixedHeight = 180;
    
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
        child: SizedBox(
          height: fichaFixedHeight,
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
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: globalThemeNotifier.value
                            ? Colors.white.withValues(alpha: 0.5)
                            : Colors.black.withValues(alpha: 0.5),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isShowingFront
                          ? (globalThemeNotifier.value ? Colors.black : Colors.white)
                          : (globalThemeNotifier.value ? Colors.white : Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: isShowingFront
                        ? _buildFichaFront(tipo)
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
            style: TextStyle(
              color: globalThemeNotifier.value ? Colors.black : Colors.white,
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
    final List<Widget> widgets = [];
    var fichaIndexWithinTema = 0;

    for (int i = 0; i < temaContent.contenido.length; i++) {
      final item = temaContent.contenido[i];

      if (item is String) {
        if (widgets.isNotEmpty) {
          widgets.add(const SizedBox(height: 16));
        }
        widgets.add(
          Text(
            item,
            style: TextStyle(
              color: _getTextColor(),
              fontSize: 16,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        );
      } else if (item is FichaTema) {
        // Mantener índice estable para los controladores de animación.
        if (widgets.isNotEmpty) {
          widgets.add(const SizedBox(height: 16));
        }
        widgets.add(_buildFichaTema(item, i, fichaIndexWithinTema));
        fichaIndexWithinTema++;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }



  void _mostrarPractica() { // Iniciar test directamente
    if (testPassed) {
      _mostrarMensajeTestRestringido(
        titulo: 'Test ya aprobado',
        mensaje: 'Este test ya está aprobado, no puede repetirse. Puedes volver al temario cuando quieras.',
      );
      return;
    }
    if (testAttempts >= 2) {
      _mostrarMensajeTestRestringido(
        titulo: 'Intentos agotados',
        mensaje: 'Has agotado los 2 intentos disponibles para este tema. Puedes repasar el contenido y volver al temario.',
      );
      return;
    }

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

  void _mostrarMensajeTestRestringido({
    required String titulo,
    required String mensaje,
  }) {
    _showDialogWithFade(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _getBorderColor(), width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  mensaje,
                  style: TextStyle(color: _getTextColor(), fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.purple],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _getBackgroundColor(),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getBackgroundColor(),
                        foregroundColor: _getTextColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Entendido',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _getTextColor(),
                        ),
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

  void _mostrarMensajeNoHayTest() { //popup de no hay test disponible en este tema
    _showDialogWithFade(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _getBorderColor(), width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Test no disponible',
                  style: TextStyle(color: _getTextColor(), fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Aún no hay preguntas disponibles para este tema. ¡Pronto estará listo!',
                  style: TextStyle(color: _getTextColor(), fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.purple],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _getBackgroundColor(),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getBackgroundColor(),
                        foregroundColor: _getTextColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Entendido',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor()),
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
    double tiempoRestante = 30.0; // 30 segundos
    Timer? timer;
    
    _showDialogWithFade( //preguntas del test
      context: context,
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.9),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            final pregunta = preguntas[preguntaActual];
            
            // Iniciar temporizador si no existe
            timer ??= Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
                if (!context.mounted) {
                  t.cancel();
                  return;
                }
                if (tiempoRestante > 0) {
                  setStateDialog(() {
                    tiempoRestante -= 0.1;
                  });
                } else {
                  t.cancel();
                  // Tiempo agotado, evaluar respuesta y mostrar resultado
                  bool esCorrecta = false;
                  if (respuestaSeleccionada != null) {
                    esCorrecta = respuestaSeleccionada == pregunta.respuestaCorrecta;
                    if (esCorrecta) {
                      respuestasCorrectas++;
                    }
                  }
                  
                  // Si no hay respuesta seleccionada, se considera incorrecta
                  _mostrarResultadoPregunta(context, esCorrecta, pregunta.explicacion, () {
                    Navigator.of(context).pop(); // Cerrar dialog del test
                    if (preguntaActual < preguntas.length - 1) {
                      preguntaActual++;
                      tiempoRestante = 30.0;
                      timer = null;
                      _mostrarTest(preguntas);
                    } else {
                      _mostrarResultadoFinal(preguntas.length);
                    }
                  });
                }
              });
            
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: _getBackgroundColor(),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _getBorderColor(), width: 2),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    
                    Row( // Header con progreso (sin aciertos)
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pregunta ${preguntaActual + 1}/${preguntas.length}',
                          style: TextStyle(color: _getTextColor(), fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    
                    
                    Expanded( // Pregunta sin fondo
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              pregunta.pregunta,
                              style: TextStyle(
                                color: _getTextColor(),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            // Barra de tiempo (30 segundos)
                            Container(
                              width: double.infinity,
                              height: 16,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.orange, Colors.purple],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: (tiempoRestante * 100 / 30).round(),
                                    child: Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: _getTextColor(),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 100 - (tiempoRestante * 100 / 30).round(),
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  )
                                : null,
                              border: isSelected ? null : Border.all(color: _getBorderColor(), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: isSelected ? const EdgeInsets.all(2) : EdgeInsets.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                color: _getBackgroundColor(),
                                borderRadius: BorderRadius.circular(isSelected ? 8 : 10),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  setStateDialog(() {
                                    respuestaSeleccionada = index;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _getBackgroundColor(),
                                  foregroundColor: _getTextColor(),
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
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )
                          : null,
                        border: respuestaSeleccionada == null 
                          ? Border.all(color: _getBorderColor(), width: 1)
                          : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getBackgroundColor(),
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
                                timer?.cancel(); // Cancelar timer actual
                                if (preguntaActual < preguntas.length - 1) {
                                  Navigator.of(context).pop();
                                  preguntaActual++;
                                  tiempoRestante = 30.0; // Reiniciar tiempo
                                  timer = null; // Reset timer
                                  _mostrarTest(preguntas); // Mostrar siguiente pregunta
                                } else {
                                  Navigator.of(context).pop();
                                  _mostrarResultadoFinal(preguntas.length);
                                }
                              });
                            }
                            // Si no hay respuesta seleccionada, no hacer nada
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _getBackgroundColor(),
                            foregroundColor: _getTextColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(respuestaSeleccionada != null ? 9 : 8),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Siguiente',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor()),
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
    _showDialogWithFade(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _getBorderColor(), width: 2),
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
                    style: TextStyle(
                      color: _getTextColor(),
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
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _getBackgroundColor(),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onContinuar();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getBackgroundColor(),
                        foregroundColor: _getTextColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Continuar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor()),
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

  Future<void> _mostrarResultadoFinal(int totalPreguntas) async {
    String mensaje;
    bool testPasado = false;
    String copaState = 'empty'; // Estado de la copa: empty, half, full
    
    // Lógica específica para la Última Prueba (tema 22)
    if (widget.temaNumber == 22) {
      // Última Prueba: 21 preguntas, una de cada tema
      if (respuestasCorrectas == 21) {
        // Caso 1: 21/21 preguntas correctas - Copa llena
        mensaje = '¡PERFECTO! Has demostrado un conocimiento excepcional del mundo del vino. ¡Eres un verdadero experto!';
        testPasado = true;
        copaState = 'full';
        _savePruebaFinalAprobada(); // Guardar que se aprobó la Última Prueba
      } else if (respuestasCorrectas >= 18) {
        // Caso 2: 18-20 preguntas correctas - Copa medio llena + aprobado
        mensaje = '¡Excelente! Has aprobado la Última Prueba con $respuestasCorrectas aciertos de 21. ¡Gran conocimiento vinícola!';
        testPasado = true;
        copaState = 'half';
        _savePruebaFinalAprobada(); // Guardar que se aprobó la Última Prueba
      } else {
        // Caso 3: Menos de 18 aciertos - No aprobado
        mensaje = 'Has obtenido $respuestasCorrectas aciertos de 21. Necesitas mínimo 18 para aprobar. ¡Repasa y vuelve a intentarlo!';
        testPasado = false;
        copaState = 'empty';
      }
    } else {
      // Lógica para temas regulares (1-22)
      if (respuestasCorrectas == 5) {
        // Caso 1: 5/5 preguntas correctas - Copa llena + desbloquea tema
        mensaje = '¡Perfecto! Excelente conocimiento sobre el mundo del vino!';
        testPasado = true;
        copaState = 'full';
      } else if (respuestasCorrectas == 4) {
        // Caso 2: 4/5 preguntas correctas - Copa medio llena + desbloquea tema
        mensaje = '¡Muy bien! Gran conocimiento sobre el mundo del vino!';
        testPasado = true;
        copaState = 'half';
      } else {
        // Caso 3: 3 o menos preguntas correctas - No desbloquea tema
        mensaje = 'Te invitamos a repasar el tema y volver a intentarlo.';
        testPasado = false;
        copaState = 'empty';
      }
    }

    // Siempre guardar el estado de la copa (indica que el test fue intentado)
    _saveGlassState(widget.temaNumber, copaState);

    // Registrar intento y, si procede, marcar como aprobado.
    final prefs = await SharedPreferences.getInstance();
    final attemptsKey = 'test_attempts_${widget.temaNumber}';
    final passedKey = 'test_passed_${widget.temaNumber}';
    final currentAttempts = prefs.getInt(attemptsKey) ?? 0;
    final newAttempts = currentAttempts + 1;
    await prefs.setInt(attemptsKey, newAttempts);
    if (testPasado) {
      await prefs.setBool(passedKey, true);
    }
    if (!mounted) return;
    
    // Actualizar el estado local para que el botón cambie inmediatamente
    setState(() {
      testAttempts = newAttempts;
      testPassed = testPassed || testPasado;
      testAttempted = testAttempts > 0 && !testPassed;
    });
    
    // Si el test se pasó exitosamente, desbloquear el siguiente tema
    if (testPasado && widget.onTestCompleted != null) {
      widget.onTestCompleted!(widget.temaNumber);
    }

    _showDialogWithFade(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _getBorderColor(), width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  testPasado 
                    ? (widget.isGuestMode
                        ? '¡Felicidades!\nHas superado el test'
                        : (widget.temaNumber == 22 
                            ? '¡Felicidades!\nHas desbloqueado la Cata Guiada Final'
                            : '¡Felicidades!\nHas desbloqueado el tema ${widget.temaNumber + 1}'))
                    : 'Test finalizado.',
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: testPasado ? 24 : 28,
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
                  widget.isGuestMode && testPasado
                    ? 'Recuerda que esta es una versión de prueba. Para guardar tu progreso y desbloquear el siguiente tema, únete al club.'
                    : mensaje,
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                // Mostrar botones diferentes según si pasó el test o no
                if (testPasado) ...[
                  const SizedBox(height: 20),
                  // Botón "Volver al Temario"
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.purple],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _getBackgroundColor(),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Cerrar el diálogo y volver al temario
                          Navigator.of(context).pop(); // Cierra el diálogo
                          Navigator.of(context).pop(); // Vuelve al temario
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _getBackgroundColor(),
                          foregroundColor: _getTextColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Volver al Temario',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor()),
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
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _getBackgroundColor(),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Cerrar el diálogo del resultado y quedarse en el tema para repasar
                          Navigator.of(context).pop(); // Solo cierra el diálogo del resultado
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _getBackgroundColor(),
                          foregroundColor: _getTextColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: _getTextColor(),
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Repasar tema',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  Container( // Botón secundario para volver al temario
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
                        backgroundColor: _getBackgroundColor(),
                        foregroundColor: _getTextColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Volver al temario',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor()),
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

  // Método para guardar que se aprobó la Última Prueba
  Future<void> _savePruebaFinalAprobada() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('prueba_final_aprobada', true);
  }

  // Mostrar diálogo de confirmación para cerrar la aplicación
  void _showExitConfirmationDialog() {
    _showDialogWithFade(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _getBorderColor(), width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '¿Seguro que quieres cerrar la aplicación?',
                  style: TextStyle(color: _getTextColor(), fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.orange, Colors.purple],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _getBackgroundColor(),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _getBackgroundColor(),
                              foregroundColor: _getTextColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              'Cancelar',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor()),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.orange, Colors.purple],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _getBackgroundColor(),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              SystemNavigator.pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _getBackgroundColor(),
                              foregroundColor: _getTextColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              'Salir',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor()),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _loadTestProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final attemptsKey = 'test_attempts_${widget.temaNumber}';
    final passedKey = 'test_passed_${widget.temaNumber}';
    final loadedAttempts = prefs.getInt(attemptsKey) ?? 0;
    var loadedPassed = prefs.getBool(passedKey) ?? false;
    // Compatibilidad: en el tema 22 antes solo se persistía 'prueba_final_aprobada'.
    if (!loadedPassed && widget.temaNumber == 22) {
      loadedPassed = prefs.getBool('prueba_final_aprobada') ?? false;
    }
    if (!mounted) return;
    setState(() {
      testAttempts = loadedAttempts;
      testPassed = loadedPassed;
      testAttempted = testAttempts > 0 && !testPassed;
    });
  }

  // Función helper para showDialog con transición de fade
  Future<T?> _showDialogWithFade<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Color? barrierColor,
    bool barrierDismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.8),
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
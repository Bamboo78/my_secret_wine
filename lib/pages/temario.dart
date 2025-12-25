import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tema_detalle.dart';
import 'cataguiadafinal.dart';
import '../widgets/wine_glass_svg.dart';
import '../main.dart';

class TemarioPage extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final bool isGuestMode;

  const TemarioPage(
      {super.key, required this.audioPlayer, this.isGuestMode = false});

  @override
  State<TemarioPage> createState() => _TemarioPageState();
}

class _TemarioPageState extends State<TemarioPage>
    with TickerProviderStateMixin {
  bool isMusicPlaying = false; // La música no suena desde el inicio
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;
  Set<int> unlockedThemes = {
    1
  }; // Conjunto de temas desbloqueados, inicialmente solo el 1
  Map<int, String> glassStates =
      {}; // Estados de las copas por tema: empty, half, full
  bool pruebaFinalAprobada = false; // Estado de si se aprobó la Última Prueba
  int? _newlyUnlockedTheme; // Tema recién desbloqueado para animación
  int?
      _pendingUnlockTheme; // Tema pendiente de desbloquear al volver a la pantalla

  final List<String> _temaTitles = [
    '1 - Historia del vino.\nDel mito a la copa.',
    '2 - La vid y sus secretos.',
    '3 - Proceso de elaboración.',
    '4 - Tinto. Cuerpo y carácter.',
    '5 - Blanco. Frescura y elegancia.',
    '6 - Rosado. Equilibrio y versatilidad.',
    '7 - Espumoso. Magia en las burbujas.',
    '8 - Dulce. Placer en cada sorbo.',
    '9 - La cata paso a paso.',
    '10 - La temperatura perfecta.',
    '11 - La copa perfecta.',
    '12 - Historia del arte y vino.',
    '13 - Maridajes que enamoran.',
    '14 - Vino y música.\nArmonía perfecta.',
    '15 - Rutas del vino del mundo.',
    '16 - El vino como ritual social.',
    '17 - Cómo leer la etiqueta.',
    '18 - Conservación y servicio.',
    '19 - Cómo elegir el vino.',
    '20 - Vinos del futuro.\nSostenibilidad y tecnología.',
    '21 - Cómo crear tu bodega en casa.',
    'Última prueba.\nDemuestra lo aprendido.',
  ];

  @override
  void initState() {
    super.initState();

    // Inicializar controladores de animación
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    // Configurar animaciones
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    // Animación de pulso: 3 ciclos completos en 1 segundo
    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOutSine,
    )); // Inicializar todas las copas como vacías por defecto
    for (int i = 1; i <= 22; i++) {
      glassStates[i] = 'empty';
    }
    _loadUnlockedThemes(); // Cargar temas desbloqueados desde SharedPreferences
    _loadGlassStates(); // Cargar estados de copas desde SharedPreferences
    _loadPruebaFinalState(); // Cargar estado de la Última Prueba

    // Iniciar animaciones de entrada
    _startEntryAnimations();

    if (widget.isGuestMode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showGuestModeWarning();
      });
    }
  }

  void _startEntryAnimations() {
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  // Cargar temas desbloqueados desde SharedPreferences
  Future<void> _loadUnlockedThemes() async {
    if (widget.isGuestMode) {
      setState(() {
        unlockedThemes = {11, 13, 19};
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    List<String> unlockedList = prefs.getStringList('unlocked_themes') ?? ['1'];
    setState(() {
      unlockedThemes = unlockedList.map((e) => int.tryParse(e) ?? 1).toSet();
      unlockedThemes.add(1); // Asegurar que tema 1 siempre esté desbloqueado
      unlockedThemes.add(22); // Desbloquear tema 22 para desarrollo
    });
  }

  // Cargar estados de copas desde SharedPreferences
  Future<void> _loadGlassStates() async {
    if (widget.isGuestMode) {
      setState(() {
        for (int i = 1; i <= 22; i++) {
          glassStates[i] = 'empty';
        }
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Solo actualizar los estados que están guardados, mantener 'empty' como defecto
      for (int i = 1; i <= 22; i++) {
        String? savedState = prefs.getString('glass_state_$i');
        glassStates[i] = savedState ?? 'empty';
        // Si no hay estado guardado, mantener 'empty' (ya inicializado en initState)
      }
    });
  }

  // Cargar estado de la Última Prueba desde SharedPreferences
  Future<void> _loadPruebaFinalState() async {
    if (widget.isGuestMode) {
      setState(() {
        pruebaFinalAprobada = false;
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pruebaFinalAprobada = prefs.getBool('prueba_final_aprobada') ?? false;
    });
  }

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
      // Error al controlar la música - mostrar información
      debugPrint('Error con la música en temario: $e');
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

  // Obtener colores según el tema
  Color _getBackgroundColor() =>
      globalThemeNotifier.value ? Colors.black : Colors.white;
  Color _getTextColor() =>
      globalThemeNotifier.value ? Colors.white : Colors.black;
  Color _getBorderColor() =>
      globalThemeNotifier.value ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: globalThemeNotifier,
      builder: (context, isDark, child) {
        return Scaffold(
          appBar: AppBar(
            leading: widget.isGuestMode
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 16.0, bottom: 16.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.orange, Colors.purple],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ).createShader(bounds),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                    ),
                  )
                : null,
            leadingWidth: widget.isGuestMode ? 70 : null,
            title: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'My Secret Wine',
                style: GoogleFonts.greatVibes(
                  color: _getTextColor(),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: _getBackgroundColor(),
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 8.0, top: 16.0, bottom: 16.0),
                child: InkWell(
                  onTap: () {
                    _showDialogWithFade(
                      context: context,
                      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                decoration: BoxDecoration(
                                  color: _getBackgroundColor(),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: _getBorderColor(), width: 2),
                                ),
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly, // Distribución uniforme
                                  children: [
                                    Text(
                                      '¿Qué deseas hacer?',
                                      style: TextStyle(
                                          color: _getTextColor(), fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 40),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.orange,
                                            Colors.purple
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(
                                          2), // Padding para el borde gradiente
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _getBackgroundColor(),
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _toggleMusic();
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                _getBackgroundColor(),
                                            foregroundColor: _getTextColor(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                            ),
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                isMusicPlaying
                                                    ? Icons.volume_up
                                                    : Icons.volume_off,
                                                color: _getTextColor(),
                                                size: 24,
                                              ),
                                              const SizedBox(width: 12),
                                              Text(
                                                isMusicPlaying
                                                    ? 'Silenciar música'
                                                    : 'Activar música',
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height:
                                            20), // Más separación entre botones
                                    // Botón de cambiar contraste
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.orange,
                                            Colors.purple
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(
                                          2), // Padding para el borde gradiente
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _getBackgroundColor(),
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              toggleGlobalTheme();
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                _getBackgroundColor(),
                                            foregroundColor: _getTextColor(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                            ),
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                globalThemeNotifier.value
                                                    ? Icons.light_mode
                                                    : Icons.dark_mode,
                                                color: _getTextColor(),
                                                size: 24,
                                              ),
                                              const SizedBox(width: 12),
                                              Text(
                                                globalThemeNotifier.value
                                                    ? 'Tema claro'
                                                    : 'Tema oscuro',
                                                style: const TextStyle(
                                                    fontSize: 16),
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
                                          colors: [
                                            Colors.orange,
                                            Colors.purple
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(
                                          2), // Padding para el borde gradiente
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _getBackgroundColor(),
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Cierra el popup actual
                                            // Muestra popup de confirmación
                                            _showDialogWithFade(
                                              context: context,
                                              barrierColor:
                                                  const Color.fromRGBO(
                                                      0, 0, 0, 0.8),
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.3,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          _getBackgroundColor(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color:
                                                              _getBorderColor(),
                                                          width: 2),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            30),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          '¿Estás seguro?',
                                                          style: TextStyle(
                                                              color:
                                                                  _getTextColor(),
                                                              fontSize: 20),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        const SizedBox(
                                                            height: 30),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    colors: [
                                                                      Colors
                                                                          .orange,
                                                                      Colors
                                                                          .purple
                                                                    ],
                                                                    begin: Alignment
                                                                        .bottomCenter,
                                                                    end: Alignment
                                                                        .topCenter,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(2),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        _getBackgroundColor(),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(9),
                                                                  ),
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(); // Cancelar
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          _getBackgroundColor(),
                                                                      foregroundColor:
                                                                          _getTextColor(),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(9),
                                                                      ),
                                                                      elevation:
                                                                          0,
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              12),
                                                                    ),
                                                                    child: Text(
                                                                        'Cancelar',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                _getTextColor())),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 16),
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    colors: [
                                                                      Colors
                                                                          .orange,
                                                                      Colors
                                                                          .purple
                                                                    ],
                                                                    begin: Alignment
                                                                        .bottomCenter,
                                                                    end: Alignment
                                                                        .topCenter,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(2),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        _getBackgroundColor(),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      _showExitConfirmationDialog();
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          _getBackgroundColor(),
                                                                      foregroundColor:
                                                                          _getTextColor(),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(9),
                                                                      ),
                                                                      elevation:
                                                                          0,
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              12),
                                                                    ),
                                                                    child: Text(
                                                                        'Salir',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                _getTextColor())),
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
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                _getBackgroundColor(),
                                            foregroundColor: _getTextColor(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                            ),
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.close,
                                                color: _getTextColor(),
                                                size: 24,
                                              ),
                                              const SizedBox(width: 12),
                                              Text(
                                                'Cerrar la aplicación',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: _getTextColor()),
                                              ),
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
                        );
                      },
                    );
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.orange, Colors.purple],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ).createShader(bounds),
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: _getBackgroundColor(),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: 22,
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: _fadeController,
                            builder: (context, child) {
                              return TweenAnimationBuilder<double>(
                                duration:
                                    Duration(milliseconds: 300 + (index * 100)),
                                tween: Tween(begin: 0.0, end: 1.0),
                                builder: (context, value, child) {
                                  return Transform.translate(
                                    offset: Offset(0, 20 * (1 - value)),
                                    child: Opacity(
                                      opacity: value,
                                      child: child,
                                    ),
                                  );
                                },
                                child: _buildTemarioItem(
                                    context, _temaTitles[index]),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  // Botón CATA GUIADA FINAL - bloqueado hasta aprobar Última Prueba
                  padding: const EdgeInsets.all(16.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: pruebaFinalAprobada
                          ? const LinearGradient(
                              colors: [Colors.orange, Colors.purple],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )
                          : LinearGradient(
                              colors: [
                                _getBackgroundColor(),
                                _getBackgroundColor()
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                      border: pruebaFinalAprobada
                          ? Border.all(color: Colors.transparent, width: 0)
                          : Border.all(color: _getBorderColor(), width: 1),
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
                          if (pruebaFinalAprobada) {
                            Navigator.push(
                              context,
                              _createSmoothRoute(const ContactoPage()),
                            );
                          } else {
                            _mostrarDialogoContactoBloqueado();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _getBackgroundColor(),
                          foregroundColor: _getTextColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 30),
                        ),
                        child: Row(
                          children: [
                            pruebaFinalAprobada
                                ? const WineGlassSvgGradient(
                                    state: WineGlassState.full,
                                    size: 32,
                                  )
                                : Image.asset(
                                    'assets/icons/vacia.png',
                                    width: 32,
                                    height: 32,
                                  ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Cata guiada final',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: _getTextColor(),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    pruebaFinalAprobada
                                        ? 'Del análisis al disfrute'
                                        : 'Antes tendrás que aprobar todo.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: pruebaFinalAprobada
                                          ? FontWeight.bold
                                          : FontWeight.bold,
                                      color: globalThemeNotifier.value
                                          ? const Color.fromARGB(
                                              255, 255, 255, 255)
                                          : const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            pruebaFinalAprobada
                                ? const WineGlassSvgGradient(
                                    state: WineGlassState.full,
                                    size: 32,
                                  )
                                : Image.asset(
                                    'assets/icons/vacia.png',
                                    width: 32,
                                    height: 32,
                                  ),
                          ],
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

  Widget _buildTemarioItem(BuildContext context, String title) {
    int temaNumber;
    if (title.startsWith('Última prueba')) {
      temaNumber = 22;
    } else if (title.contains(' - ')) {
      String numeroStr = title.split(' - ')[0];
      temaNumber = int.tryParse(numeroStr) ?? 1;
    } else if (title.toUpperCase().startsWith('TEMA ')) {
      String numeroStr = title.split(' ')[1];
      temaNumber = int.tryParse(numeroStr) ?? 1;
    } else {
      temaNumber = 1;
    }
    bool isUnlocked = _isTemaUnlocked(temaNumber);
    bool isNewlyUnlocked = temaNumber == _newlyUnlockedTheme;

    Widget content = AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        gradient: isUnlocked
            ? const LinearGradient(
                colors: [Colors.orange, Colors.purple],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
            : LinearGradient(
                colors: [_getBackgroundColor(), _getBackgroundColor()],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
        border: isUnlocked
            ? Border.all(color: Colors.transparent, width: 0)
            : Border.all(color: _getBorderColor(), width: 1),
        borderRadius: BorderRadius.circular(10),
        // La sombra se maneja externamente si es nuevo desbloqueo
        boxShadow: isNewlyUnlocked ? [] : [],
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(9),
        ),
        child: ElevatedButton(
          onPressed: () {
            int temaNumber = 1;
            if (title.startsWith('Última prueba')) {
              temaNumber = 22;
            } else if (title.contains(' - ')) {
              String numeroStr = title.split(' - ')[0];
              temaNumber = int.tryParse(numeroStr) ?? 1;
            } else if (title.toUpperCase().startsWith('TEMA ')) {
              String numeroStr = title.split(' ')[1];
              temaNumber = int.tryParse(numeroStr) ?? 1;
            }

            if (_isTemaUnlocked(temaNumber)) {
              // Tema desbloqueado: navegar normalmente
              Navigator.push(
                context,
                _createSmoothRoute(TemaDetallePage(
                  temaTitle: title,
                  temaNumber: temaNumber,
                  audioPlayer: widget.audioPlayer,
                  onTestCompleted:
                      _unlockNextTheme, // Callback para desbloquear siguiente tema
                  isGuestMode: widget.isGuestMode,
                )),
              ).then((_) async {
                // Actualizar el estado cuando se regrese de TemaDetallePage
                // Recargamos tanto el estado de aprobación de la Última Prueba
                // como los estados de las copas para asegurar que el icono
                // de la Última Prueba (tema 22) se actualice correctamente.
                await _loadPruebaFinalState();
                await _loadGlassStates();

                // Aplicar cualquier desbloqueo pendiente con animación
                _applyPendingUnlock();
              });
            } else {
              // Tema bloqueado: mostrar mensaje
              _showLockedThemeDialog(context, temaNumber);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _getBackgroundColor(),
            foregroundColor: _getTextColor(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          ),
          child: Row(
            children: [
              SizedBox(
                // Número del tema en grande
                width: 40,
                child: Text(
                  _extractTemaNumber(title),
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Textos complementarios
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _extractTemaTitle(title),
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            title == 'Última Prueba' ? 'Montserrat' : null,
                      ),
                    ),
                  ],
                ),
              ),
              // Icono de copa de vino solo para temas desbloqueados
              if (isUnlocked) ...[
                const SizedBox(width: 12),
                _getWineGlassIcon(temaNumber),
              ] else ...[
                const SizedBox(width: 12),
                Icon(
                  Icons.lock,
                  color: _getTextColor().withValues(alpha: 0.5),
                  size: 24,
                ),
              ],
            ],
          ),
        ),
      ),
    );

    if (isNewlyUnlocked) {
      return Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange
                            .withValues(alpha: 0.5 * _pulseAnimation.value),
                        blurRadius: 4 + (8 * _pulseAnimation.value),
                        spreadRadius: 0 + (2 * _pulseAnimation.value),
                      ),
                      BoxShadow(
                        color: Colors.purple
                            .withValues(alpha: 0.5 * _pulseAnimation.value),
                        blurRadius: 4 + (8 * _pulseAnimation.value),
                        spreadRadius: 0 + (2 * _pulseAnimation.value),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          content,
        ],
      );
    }

    return content;
  }

  String _extractTemaNumber(String title) {
    if (title.startsWith('Última prueba')) {
      return '22';
    }
    if (title.contains(' - ')) {
      return title.split(' - ')[0];
    }
    if (title.toUpperCase().startsWith('TEMA ')) {
      String numeroStr = title.split(' ')[1];
      return numeroStr;
    }
    return '1';
  }

  String _extractTemaTitle(String title) {
    if (title.startsWith('Última prueba')) {
      return 'Última Prueba';
    }
    if (title.contains(' - ')) {
      return title.split(' - ')[1];
    }
    return title;
  }

  bool _isTemaUnlocked(int temaNumber) {
    // Verificar si el tema está en el conjunto de temas desbloqueados
    return unlockedThemes.contains(temaNumber);
  }

  // Método para desbloquear el siguiente tema cuando se complete un test
  Future<void> _unlockNextTheme(int completedThemeNumber) async {
    if (widget.isGuestMode) return;

    final prefs = await SharedPreferences.getInstance();
    int nextTheme = completedThemeNumber + 1;

    // Solo desbloquear si el tema siguiente existe (máximo 22 temas)
    if (nextTheme <= 22) {
      // NO actualizar el estado inmediatamente para permitir la animación al volver
      // Guardamos el tema pendiente para desbloquearlo cuando la UI se actualice
      _pendingUnlockTheme = nextTheme;

      // Guardar en SharedPreferences
      List<String> unlockedList =
          unlockedThemes.map((e) => e.toString()).toList();
      if (!unlockedList.contains(nextTheme.toString())) {
        unlockedList.add(nextTheme.toString());
      }
      await prefs.setStringList('unlocked_themes', unlockedList);

      // Recargar estados de copas para reflejar cambios
      await _loadGlassStates();
    }
  }

  // Aplicar el desbloqueo pendiente con animación
  void _applyPendingUnlock() {
    if (_pendingUnlockTheme != null) {
      int themeToUnlock = _pendingUnlockTheme!;

      setState(() {
        unlockedThemes.add(themeToUnlock);
        _newlyUnlockedTheme = themeToUnlock;
        _pendingUnlockTheme = null;
      });

      // Iniciar la animación de pulso
      _pulseController.reset();
      _pulseController.forward().then((_) {
        if (mounted) {
          setState(() {
            if (_newlyUnlockedTheme == themeToUnlock) {
              _newlyUnlockedTheme = null;
            }
          });
        }
      });
    }
  }

  Widget _getWineGlassIcon(int temaNumber) {
    String state = glassStates[temaNumber] ?? 'empty';

    switch (state) {
      case 'full':
        // Copa llena - 5/5 preguntas correctas
        return const WineGlassSvgGradient(
          state: WineGlassState.full,
          size: 32,
        );
      case 'half':
        // Copa medio llena - 4/5 preguntas correctas
        return const WineGlassSvgGradient(
          state: WineGlassState.half,
          size: 32,
        );
      case 'empty':
      default:
        // Copa vacía - Test no completado o menos de 4 correctas
        return Image.asset(
          'assets/icons/vacia.png',
          width: 32,
          height: 32,
        );
    }
  }

  void _showLockedThemeDialog(BuildContext context, int temaNumber) {
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
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _getBorderColor(), width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.lock,
                  color: globalThemeNotifier.value
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 0, 0, 0),
                  size: 60,
                ),
                Text(
                  'Tema bloqueado',
                  style: TextStyle(
                      color: _getTextColor(),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Para poder acceder al contenido debes finalizar el tema ${temaNumber - 1} anterior',
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
                      color: Colors.black,
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
                            color: _getTextColor()),
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

  void _mostrarDialogoContactoBloqueado() {
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
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _getBorderColor(), width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.lock,
                  color: globalThemeNotifier.value
                      ? Colors.grey[400]
                      : Colors.grey[600],
                  size: 60,
                ),
                Text(
                  'Contenido bloqueado',
                  style: TextStyle(
                      color: _getTextColor(),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Debes aprobar el test de la Última Prueba para desbloquear el contenio.',
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
                      color: Colors.black,
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
                            color: _getTextColor()),
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
                  '¿Estás seguro que quieres cerrar la aplicación?',
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
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _getTextColor()),
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
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _getTextColor()),
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

  void _showGuestModeWarning() {
    _showDialogWithFade(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _getBorderColor(), width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Versión de prueba',
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Estás accediendo a una versión limitada. Podrás ver algunos temas de ejemplo, pero para disfrutar de la experiencia completa y guardar tu progreso, debes unirte al club.',
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 30),
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
                        'Volver',
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

  // Función para crear transiciones suaves entre páginas
  Route<T> _createSmoothRoute<T extends Object?>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
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
      transitionDuration: const Duration(milliseconds: 800),
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

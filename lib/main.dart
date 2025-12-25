import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/temario.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ValueNotifier global para el tema
final ValueNotifier<bool> globalThemeNotifier = ValueNotifier<bool>(true); // true = dark theme

// Función global para cambiar tema
Future<void> toggleGlobalTheme() async {
  final prefs = await SharedPreferences.getInstance();
  globalThemeNotifier.value = !globalThemeNotifier.value;
  await prefs.setBool('is_dark_theme', globalThemeNotifier.value);
}

// Función global para mostrar diálogos con transición de fade
Future<T?> showFadeDialog<T>({
  required BuildContext context,
  required Widget child,
  Color? barrierColor,
  bool barrierDismissible = true,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.8),
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class SplashScreen extends StatefulWidget {
  final AudioPlayer audioPlayer;
  
  const SplashScreen({super.key, required this.audioPlayer});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(audioPlayer: widget.audioPlayer)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/icons/app_icon.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  
  await SystemChrome.setPreferredOrientations([ // Configurar orientaciones preferidas (solo vertical)
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MySecretWineApp());
}

class MySecretWineApp extends StatefulWidget {
  const MySecretWineApp({super.key});

  @override
  State<MySecretWineApp> createState() => _MySecretWineAppState();
}

class _MySecretWineAppState extends State<MySecretWineApp> with WidgetsBindingObserver {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _audioPlayer = AudioPlayer();
    _loadGlobalTheme();
    // La música no inicia automáticamente
  }

  // Cargar tema global desde SharedPreferences
  Future<void> _loadGlobalTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('is_dark_theme') ?? true;
    globalThemeNotifier.value = isDark;
  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _audioPlayer.pause();
    }
    // No reanudamos la música automáticamente al volver
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Secret Wine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          labelLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          labelMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
      ),
      home: SplashScreen(audioPlayer: _audioPlayer),
    );
  }
}

class HomePage extends StatefulWidget {
  final AudioPlayer audioPlayer;
  
  const HomePage({super.key, required this.audioPlayer});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  bool isButtonEnabled = false;
  bool isPasswordVisible = false;
  bool isMusicPlaying = false;

  @override
  void initState() {
    super.initState();
    // Ya no necesitamos cargar tema local, usamos el global
  }

  // Obtener colores según el tema
  Color _getBackgroundColor() => globalThemeNotifier.value ? Colors.black : Colors.white;
  Color _getTextColor() => globalThemeNotifier.value ? Colors.white : Colors.black;
  Color _getBorderColor() => globalThemeNotifier.value ? Colors.white : Colors.black;

  void validateInput() {
    final email = emailController.text;
    final code = codeController.text;
    if (generateCode(email) == code) {
      setState(() {
        isButtonEnabled = true;
      });
    } else {
      setState(() {
        isButtonEnabled = false;
      });
    }
  }

  Future<void> _toggleTheme() async {
    await toggleGlobalTheme();
    setState(() {}); // Refrescar la UI
  }

  Future<void> _toggleMusic() async {
    try {
      if (isMusicPlaying) {
        await widget.audioPlayer.pause();
        setState(() {
          isMusicPlaying = false;
        });
      } else {
        await widget.audioPlayer.setSource(AssetSource('audio/background.mp3'));
        await widget.audioPlayer.setReleaseMode(ReleaseMode.loop);
        await widget.audioPlayer.resume();
        setState(() {
          isMusicPlaying = true;
        });
      }
    } catch (e) {
      // Error al cambiar el estado de la música - mostrar información
      debugPrint('Error con la música en home: $e');
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

  void _showOptionsDialog() {
    showFadeDialog(
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      child: Dialog(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      padding: const EdgeInsets.all(2),
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
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getBackgroundColor(),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _toggleTheme();
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
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getBackgroundColor(),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            showFadeDialog(
                              context: context,
                              barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
                              child: Dialog(
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
                                          '¿Estás seguro?',
                                          style: TextStyle(color: _getTextColor(), fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 30),
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
                                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                                    ),
                                                    child: Text('Cancelar', style: TextStyle(fontSize: 14, color: _getTextColor())),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
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
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      _showExitConfirmationDialog(context, _getBackgroundColor, _getTextColor, _getBorderColor);
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: _getBackgroundColor(),
                                                      foregroundColor: _getTextColor(),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(9),
                                                      ),
                                                      elevation: 0,
                                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                                    ),
                                                    child: Text('Salir', style: TextStyle(fontSize: 14, color: _getTextColor())),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            );
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
    return ValueListenableBuilder<bool>(
      valueListenable: globalThemeNotifier,
      builder: (context, isDark, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: _getBackgroundColor(),
            automaticallyImplyLeading: false,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
            child: InkWell(
              onTap: () {
                _showOptionsDialog();
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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/icons/app_icon.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'My Secret Wine',
              style: GoogleFonts.greatVibes(
                color: _getTextColor(),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '"La primera app que te enseñará todos los secretos del vino"',
              style: TextStyle(
                color: _getTextColor(),
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.purple],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: _getBackgroundColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                ),
                child: ElevatedButton(
                  onPressed: () {

                    _showDialogWithFade( //popup de unirse al club
                      context: context,
                      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.9,
                            decoration: BoxDecoration(
                              color: _getBackgroundColor(),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.fromBorderSide(BorderSide(color: _getBorderColor(), width: 2)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  
                                  const SizedBox(height: 10),
                                  Text(
                                    'Bienvenido a esta app dedicada a descubrir el fascinante mundo del vino. A través de nuestro curso interactivo aprenderás sobre variedades, regiones, maridajes y técnicas de cata. Con contenido claro, ejercicios prácticos y recomendaciones personalizadas, podrás desarrollar tu paladar y disfrutar el vino con mayor conocimiento y confianza, paso a paso, desde cualquier lugar.',
                                    style: TextStyle(color: _getTextColor(), fontSize: 14, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Apuntarte a este curso te permitirá comprender mejor el vino, reconocer aromas y sabores, descubrir regiones vitivinícolas y aprender a elegir la botella ideal para cada ocasión. Además, tendrás acceso a contenidos exclusivos, asesoramiento personalizado y actividades prácticas. Al finalizar, disfrutarás de una cata guiada donde pondrás en práctica todo lo aprendido y compartirás la experiencia con otros aficionados.',
                                    style: TextStyle(color: _getTextColor(), fontSize: 14, fontWeight: FontWeight.bold),
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
                                        onPressed: () async {
                                          try {
                                            final Uri url = Uri.parse('https://www.lachicadeamarillo.com/collections/all');
                                            bool canLaunch = await canLaunchUrl(url);
                                            if (canLaunch) {
                                              await launchUrl(url, mode: LaunchMode.externalApplication);
                                            } else {
                                              await launchUrl(url);
                                            }
                                          } catch (e) {
                                            debugPrint('Error launching URL: $e');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _getBackgroundColor(),
                                          foregroundColor: _getTextColor(),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                        ),
                                        child: Text('Únete al club!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor())),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
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
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                        ),
                                        child: Text('Volver', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor())),
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
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getBackgroundColor(),
                    foregroundColor: _getTextColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text('Únete al club!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor())),
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
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: _getBackgroundColor(),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      _createSmoothRoute(TemarioPage(
                        audioPlayer: widget.audioPlayer,
                        isGuestMode: true,
                      )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getBackgroundColor(),
                    foregroundColor: _getTextColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text('Voy a tomar una copa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor())),
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
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: _getBackgroundColor(),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: ElevatedButton(
                onPressed: () {
                  _showDialogWithFade(
                    context: context,
                    barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setDialogState) {
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () async {
                                          try {
                                            final Uri url = Uri.parse('https://www.lachicadeamarillo.com/collections/all');
                                            bool canLaunch = await canLaunchUrl(url);
                                            debugPrint('Popup 2 - Can launch URL: $canLaunch');
                                            if (canLaunch) {
                                              bool launched = await launchUrl(url, mode: LaunchMode.externalApplication);
                                              debugPrint('Popup 2 - URL launched: $launched');
                                            } else {
                                              debugPrint('Popup 2 - Cannot launch URL, trying fallback');
                                              await launchUrl(url);
                                            }
                                          } catch (e) {
                                            debugPrint('Popup 2 - Error launching URL: $e');
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () async {
                                        try {
                                          final Uri url = Uri.parse('https://www.lachicadeamarillo.com/collections/all');
                                          bool canLaunch = await canLaunchUrl(url);
                                          debugPrint('Popup 2 Icon - Can launch URL: $canLaunch');
                                          if (canLaunch) {
                                            bool launched = await launchUrl(url, mode: LaunchMode.externalApplication);
                                            debugPrint('Popup 2 Icon - URL launched: $launched');
                                          } else {
                                            debugPrint('Popup 2 Icon - Cannot launch URL, trying fallback');
                                            await launchUrl(url);
                                          }
                                        } catch (e) {
                                          debugPrint('Popup 2 Icon - Error launching URL: $e');
                                        }
                                      },
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: _getBackgroundColor(),
                                        backgroundImage: const AssetImage('assets/icons/app_icon.png'),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: emailController,
                                  onChanged: (value) => validateInput(),
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  decoration: InputDecoration(
                                    hintText: 'email',
                                    hintStyle: TextStyle(color: globalThemeNotifier.value ? Colors.grey[400] : Colors.grey[600], fontFamily: 'Montserrat'),
                                    filled: true,
                                    fillColor: _getBackgroundColor(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: _getBorderColor()),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.purple, width: 2),
                                    ),
                                  ),
                                  style: TextStyle(color: _getTextColor()),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: codeController,
                                  onChanged: (value) => validateInput(),
                                  obscureText: !isPasswordVisible,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  decoration: InputDecoration(
                                    hintText: 'Contraseña',
                                    hintStyle: TextStyle(color: globalThemeNotifier.value ? Colors.grey[400] : Colors.grey[600], fontFamily: 'Montserrat'),
                                    filled: true,
                                    fillColor: _getBackgroundColor(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: _getBorderColor()),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.purple, width: 2),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: ShaderMask(
                                        shaderCallback: (bounds) => const LinearGradient(
                                          colors: [Colors.orange, Colors.purple],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ).createShader(bounds),
                                        child: Icon(
                                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                          color: Colors.white,
                                          size: 28, // Más grande
                                        ),
                                      ),
                                      onPressed: () {
                                        setDialogState(() {
                                          isPasswordVisible = !isPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  style: TextStyle(color: _getTextColor()),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: isButtonEnabled 
                                      ? const LinearGradient(
                                          colors: [Colors.orange, Colors.purple],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        )
                                      : null,
                                    border: isButtonEnabled 
                                      ? null 
                                      : Border.all(color: _getBorderColor(), width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: isButtonEnabled ? const EdgeInsets.all(2) : EdgeInsets.zero,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _getBackgroundColor(),
                                      borderRadius: BorderRadius.circular(isButtonEnabled ? 8 : 10),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: isButtonEnabled
                                          ? () {
                                              Navigator.push(
                                                context,
                                                _createSmoothRoute(TemarioPage(audioPlayer: widget.audioPlayer)),
                                              );
                                            }
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: _getTextColor(),
                                        disabledForegroundColor: globalThemeNotifier.value ? Colors.grey[600] : Colors.grey[400],
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(isButtonEnabled ? 8 : 10),
                                        ),
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                      ),
                                      child: Text(
                                        'Entrar', 
                                        style: TextStyle(
                                          fontSize: 16, 
                                          fontWeight: FontWeight.bold,
                                          color: globalThemeNotifier.value ? Colors.white : Colors.black,
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
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: _getBackgroundColor(),
                    foregroundColor: _getTextColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text('Ya soy parte del brindis', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _getTextColor())),
                ),
              ),
            ),
          ],
        ),
        ),
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


String generateCode(String email) {
  const secret = 'mi_secret_v1_2025';
  const charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final normalized = email.trim().toLowerCase();
  final hmac = Hmac(sha256, utf8.encode(secret.trim()));
  final digest = hmac.convert(utf8.encode(normalized)).bytes;
  final buffer = StringBuffer();
  for (int i = 0; i < 6; i++) {
    final idx = digest[i] % charset.length;
    buffer.write(charset[idx]);
  }
  return buffer.toString();
}

// Función para mostrar diálogo de confirmación para cerrar la aplicación
void _showExitConfirmationDialog(BuildContext context, Color Function() getBackgroundColor, Color Function() getTextColor, Color Function() getBorderColor) {
  showGeneralDialog(
    context: context,
    barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: getBackgroundColor(),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: getBorderColor(), width: 2),
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '¿Estás seguro que quieres cerrar la aplicación?',
                style: TextStyle(color: getTextColor(), fontSize: 18),
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
                          color: getBackgroundColor(),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getBackgroundColor(),
                            foregroundColor: getTextColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Cancelar',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: getTextColor()),
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
                          color: getBackgroundColor(),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            SystemNavigator.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getBackgroundColor(),
                            foregroundColor: getTextColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Salir',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: getTextColor()),
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
      ),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
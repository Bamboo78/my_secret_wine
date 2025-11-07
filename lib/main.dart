import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/temario.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

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
    _startBackgroundAudio();
  }

  Future<void> _startBackgroundAudio() async { // Reproducir desde assets en bucle
    try {
      
      await _audioPlayer.setSource(AssetSource('audio/background.mp3'));
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.resume();
    } catch (e) {
      
      
      // Error al iniciar audio de fondo - manejado silenciosamente
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _audioPlayer.pause();
    } else if (state == AppLifecycleState.resumed) {
      _audioPlayer.resume();
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            const SizedBox(height: 40),
            Text(
              'My Secret Wine',
              style: GoogleFonts.greatVibes(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '"La primera app que te enseñará todos los secretos del vino"',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.purple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: ElevatedButton(
                  onPressed: () {

                    showDialog( //popup de unirse al club
                      context: context,
                      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.9,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 2)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            try {
                                              final Uri url = Uri.parse('https://www.lachicadeamarillo.com/');
                                              bool canLaunch = await canLaunchUrl(url);
                                              debugPrint('Popup 1 - Can launch URL: $canLaunch');
                                              if (canLaunch) {
                                                bool launched = await launchUrl(url, mode: LaunchMode.externalApplication);
                                                debugPrint('Popup 1 - URL launched: $launched');
                                              } else {
                                                debugPrint('Popup 1 - Cannot launch URL, trying fallback');
                                                await launchUrl(url);
                                              }
                                            } catch (e) {
                                              debugPrint('Popup 1 - Error launching URL: $e');
                                            }
                                          },
                                          child: const Text(
                                            'Si aún no tienes tu código de acceso, visita la web...        La Chica de Amarillo.',
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 255, 255, 255),
                                              fontSize: 16,
                                              decoration: TextDecoration.underline,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () async {
                                          try {
                                            final Uri url = Uri.parse('https://www.lachicadeamarillo.com/');
                                            bool canLaunch = await canLaunchUrl(url);
                                            debugPrint('Popup 1 Icon - Can launch URL: $canLaunch');
                                            if (canLaunch) {
                                              bool launched = await launchUrl(url, mode: LaunchMode.externalApplication);
                                              debugPrint('Popup 1 Icon - URL launched: $launched');
                                            } else {
                                              debugPrint('Popup 1 Icon - Cannot launch URL, trying fallback');
                                              await launchUrl(url);
                                            }
                                          } catch (e) {
                                            debugPrint('Popup 1 Icon - Error launching URL: $e');
                                          }
                                        },
                                        child: const CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage('assets/icons/app_icon.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Bienvenido a esta app dedicada a descubrir el fascinante mundo del vino. A través de nuestro curso interactivo aprenderás sobre variedades, regiones, maridajes y técnicas de cata. Con contenido claro, ejercicios prácticos y recomendaciones personalizadas, podrás desarrollar tu paladar y disfrutar el vino con mayor conocimiento y confianza, paso a paso, desde cualquier lugar.',
                                    style: TextStyle(color: Colors.white, fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 15),
                                  const Text(
                                    'Apuntarte a este curso te permitirá comprender mejor el vino, reconocer aromas y sabores, descubrir regiones vitivinícolas y aprender a elegir la botella ideal para cada ocasión. Además, tendrás acceso a contenidos exclusivos, asesoramiento personalizado y actividades prácticas. Al finalizar, disfrutarás de una cata guiada donde pondrás en práctica todo lo aprendido y compartirás la experiencia con otros aficionados.',
                                    style: TextStyle(color: Colors.white, fontSize: 14),
                                    textAlign: TextAlign.center,
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
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                        ),
                                        child: const Text('Volver', style: TextStyle(fontSize: 16)),
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
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Únete al club', style: TextStyle(fontSize: 16)),
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
                  showDialog(
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
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white, width: 2),
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
                                            final Uri url = Uri.parse('https://www.lachicadeamarillo.com/');
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
                                        child: const Text(
                                          'Si aún no tienes tu código de acceso, visita la web La Chica de Amarillo...',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            decoration: TextDecoration.underline,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () async {
                                        try {
                                          final Uri url = Uri.parse('https://www.lachicadeamarillo.com/');
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
                                      child: const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                                        backgroundImage: AssetImage('assets/icons/app_icon.png'),
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
                                    hintStyle: const TextStyle(color: Colors.black),
                                    filled: true,
                                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.purple, width: 2),
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.black),
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
                                    hintStyle: const TextStyle(color: Colors.black),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.purple, width: 2),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: ShaderMask(
                                        shaderCallback: (bounds) => const LinearGradient(
                                          colors: [Colors.orange, Colors.purple],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
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
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: isButtonEnabled 
                                      ? const LinearGradient(
                                          colors: [Colors.orange, Colors.purple],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        )
                                      : null,
                                    border: isButtonEnabled 
                                      ? null 
                                      : Border.all(color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: isButtonEnabled ? const EdgeInsets.all(2) : EdgeInsets.zero,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(isButtonEnabled ? 8 : 10),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: isButtonEnabled
                                          ? () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => TemarioPage(audioPlayer: widget.audioPlayer)),
                                              );
                                            }
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: Colors.white,
                                        disabledForegroundColor: Colors.white,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(isButtonEnabled ? 8 : 10),
                                        ),
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                      ),
                                      child: const Text(
                                        'Entrar', 
                                        style: TextStyle(
                                          fontSize: 16, 
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
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
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Ya soy parte del brindis', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
        ),
        ),
      ),
    );
  }
}


String generateCode(String email) {
  const secret = 'mi_secret_v1_2025';
  const charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final normalized = email.trim().toLowerCase();
  final hmac = Hmac(sha256, utf8.encode(secret));
  final digest = hmac.convert(utf8.encode(normalized)).bytes;
  final buffer = StringBuffer();
  for (int i = 0; i < 6; i++) {
    final idx = digest[i] % charset.length;
    buffer.write(charset[idx]);
  }
  return buffer.toString();
}
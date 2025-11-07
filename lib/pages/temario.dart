import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tema_detalle.dart';
import '../widgets/wine_glass_svg.dart';

class TemarioPage extends StatefulWidget {
  final AudioPlayer audioPlayer;
  
  const TemarioPage({super.key, required this.audioPlayer});

  @override
  State<TemarioPage> createState() => _TemarioPageState();
}

class _TemarioPageState extends State<TemarioPage> {
  bool isMusicPlaying = true; // Asumimos que la música está sonando al inicio
  Set<int> unlockedThemes = {1}; // Conjunto de temas desbloqueados, inicialmente solo el 1
  Map<int, String> glassStates = {}; // Estados de las copas por tema: empty, half, full

  @override
  void initState() {
    super.initState();
    // Inicializar todas las copas como vacías por defecto
    for (int i = 1; i <= 23; i++) {
      glassStates[i] = 'empty';
    }
    _loadUnlockedThemes(); // Cargar temas desbloqueados desde SharedPreferences
    _loadGlassStates(); // Cargar estados de copas desde SharedPreferences
  }

  // Cargar temas desbloqueados desde SharedPreferences
  Future<void> _loadUnlockedThemes() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> unlockedList = prefs.getStringList('unlocked_themes') ?? ['1'];
    setState(() {
      unlockedThemes = unlockedList.map((e) => int.tryParse(e) ?? 1).toSet();
      unlockedThemes.add(1); // Asegurar que tema 1 siempre esté desbloqueado
    });
  }

  // Cargar estados de copas desde SharedPreferences
  Future<void> _loadGlassStates() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Solo actualizar los estados que están guardados, mantener 'empty' como defecto
      for (int i = 1; i <= 23; i++) {
        String? savedState = prefs.getString('glass_state_$i');
        glassStates[i] = savedState ?? 'empty';
              // Si no hay estado guardado, mantener 'empty' (ya inicializado en initState)
      }
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
        await widget.audioPlayer.resume();
        setState(() {
          isMusicPlaying = true;
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al controlar la música: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Secret Wine',
          style: GoogleFonts.tangerine(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
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
                                border: Border.all(color: Colors.white, width: 2), // Borde blanco
                              ),
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribución uniforme
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
                                padding: const EdgeInsets.all(2), // Padding para el borde gradiente
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
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20), // Más separación entre botones
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
                                padding: const EdgeInsets.all(2), // Padding para el borde gradiente
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Cierra el popup actual
                                      // Muestra popup de confirmación
                                      showDialog(
                                        context: context,
                                        barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.8,
                                              height: MediaQuery.of(context).size.height * 0.3,
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
                                                    '¿Estás seguro?',
                                                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                                                                Navigator.of(context).pop(); // Cancelar
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
                                                              child: const Text('Cancelar', style: TextStyle(fontSize: 14)),
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
                                                              begin: Alignment.centerLeft,
                                                              end: Alignment.centerRight,
                                                            ),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          padding: const EdgeInsets.all(2),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Colors.black,
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            child: ElevatedButton(
                                                              onPressed: () {
                                                                // Cerrar la aplicación
                                                                SystemNavigator.pop();
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
                                                              child: const Text('Salir', style: TextStyle(fontSize: 14)),
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
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                    ),
                                    child: const Text('Cerrar la aplicación', style: TextStyle(fontSize: 16)),
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
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: 23,
                itemBuilder: (context, index) {
                  if (index == 22) {
                    return _buildTemarioItem(context, 'tema 23 - Prueba Final');
                  }
                  return _buildTemarioItem(context, 'tema ${index + 1} - Título del tema');
                },
            ),
          ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemarioItem(BuildContext context, String title) {
    int temaNumber = _extractTemaNumber(title) != '1' ? int.tryParse(_extractTemaNumber(title)) ?? 1 : 1;
    bool isUnlocked = _isTemaUnlocked(temaNumber);
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        gradient: isUnlocked ? const LinearGradient(
          colors: [Colors.orange, Colors.purple],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ) : null,
        border: isUnlocked ? null : Border.all(color: Colors.white, width: 1),
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
            int temaNumber = 1;
            if (title.startsWith('tema ')) {
              String numeroStr = title.split(' ')[1];
              temaNumber = int.tryParse(numeroStr) ?? 1;
            }
            
            if (_isTemaUnlocked(temaNumber)) {
              // Tema desbloqueado: navegar normalmente
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TemaDetallePage(
                    temaTitle: title,
                    temaNumber: temaNumber,
                    audioPlayer: widget.audioPlayer,
                    onTestCompleted: _unlockNextTheme, // Callback para desbloquear siguiente tema
                  ),
                ),
              );
            } else {
              // Tema bloqueado: mostrar mensaje
              _showLockedThemeDialog(context, temaNumber);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12), // Espaciado adicional desde el borde izquierdo
              // Número del tema en grande
              SizedBox(
                width: 40,
                child: Text(
                  _extractTemaNumber(title),
                  style: const TextStyle(
                    color: Colors.white,
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
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getComplementaryText(title),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Icono de copa de vino solo para temas desbloqueados
              if (isUnlocked) ...[
                const SizedBox(width: 12),
                _getWineGlassIcon(temaNumber),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _extractTemaNumber(String title) {
    if (title.startsWith('tema ')) {
      String numeroStr = title.split(' ')[1];
      return numeroStr;
    }
    return '1';
  }

  String _extractTemaTitle(String title) {
    if (title.contains(' - ')) {
      return title.split(' - ')[1];
    }
    return title;
  }

  String _getComplementaryText(String title) {
    // Aquí puedes personalizar el texto complementario para cada tema
    if (title.contains('23')) {
      return 'Evaluación final de conocimientos';
    }
    return 'Conceptos fundamentales sobre vinos';
  }

  bool _isTemaUnlocked(int temaNumber) {
    // Verificar si el tema está en el conjunto de temas desbloqueados
    return unlockedThemes.contains(temaNumber);
  }

  // Método para desbloquear el siguiente tema cuando se complete un test
  Future<void> _unlockNextTheme(int completedThemeNumber) async {
    final prefs = await SharedPreferences.getInstance();
    int nextTheme = completedThemeNumber + 1;
    
    // Solo desbloquear si el tema siguiente existe (máximo 23 temas)
    if (nextTheme <= 23) {
      // Actualizar el conjunto local
      setState(() {
        unlockedThemes.add(nextTheme);
      });
      
      // Guardar en SharedPreferences
      List<String> unlockedList = unlockedThemes.map((e) => e.toString()).toList();
      await prefs.setStringList('unlocked_themes', unlockedList);
      
      // Recargar estados de copas para reflejar cambios
      await _loadGlassStates();
      
      // Mostrar mensaje de congratulación
      if (mounted) {
        _showThemeUnlockedDialog(nextTheme);
      }
    }
  }

  // Mostrar dialog de congratulación por desbloquear nuevo tema
  void _showThemeUnlockedDialog(int newThemeNumber) {
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
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 60,
                ),
                const Text(
                  '¡Felicitaciones!',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Has desbloqueado el tema $newThemeNumber',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
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

  Widget _getWineGlassIcon(int temaNumber) {
    String state = glassStates[temaNumber] ?? 'empty';
    
    switch (state) {
      case 'full':
        // Copa llena (púrpura) - 5/5 preguntas correctas
        return const WineGlassSvgIcon(
          state: WineGlassState.full,
          size: 32,
          color: Colors.purple,
        );
      case 'half':
        // Copa medio llena (naranja) - 4/5 preguntas correctas
        return const WineGlassSvgIcon(
          state: WineGlassState.half,
          size: 32,
          color: Colors.orange,
        );
      case 'empty':
      default:
        // Copa vacía (blanca) - Test no completado o menos de 4 correctas
        return const WineGlassSvgIcon(
          state: WineGlassState.empty,
          size: 32,
          color: Colors.white,
        );
    }
  }

  void _showLockedThemeDialog(BuildContext context, int temaNumber) {
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
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.lock,
                  color: WineColors.whiteWine,
                  size: 60,
                ),
                const Text(
                  'Tema bloqueado',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Para poder acceder al contenido debes finalizar el tema ${temaNumber - 1} anterior',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
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
}
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class ContactoPage extends StatefulWidget {
  const ContactoPage({super.key});

  @override
  State<ContactoPage> createState() => _ContactoPageState();
}

class _ContactoPageState extends State<ContactoPage> {
  bool isMusicPlaying = false;

  void _toggleMusic() {
    setState(() {
      isMusicPlaying = !isMusicPlaying;
    });
    // Aquí puedes añadir la lógica real para reproducir/pausar música
  }

  // Obtener colores según el tema
  Color _getBackgroundColor() => globalThemeNotifier.value ? Colors.black : Colors.white;
  Color _getTextColor() => globalThemeNotifier.value ? Colors.white : Colors.black;
  Color _getBorderColor() => globalThemeNotifier.value ? Colors.white : Colors.black;

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'contacto@mysecretwine.com',
      query: 'subject=Consulta sobre My Secret Wine',
    );
    
    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      }
    } catch (e) {
      // Error al abrir email
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+34 123 456 789',
    );
    
    try {
      if (await canLaunchUrl(phoneLaunchUri)) {
        await launchUrl(phoneLaunchUri);
      }
    } catch (e) {
      // Error al abrir teléfono
    }
  }

  Future<void> _launchWebsite() async {
    final Uri websiteLaunchUri = Uri.parse('https://www.lachicadeamarillo.com/');
    
    try {
      if (await canLaunchUrl(websiteLaunchUri)) {
        await launchUrl(websiteLaunchUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Error al abrir website
    }
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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: globalThemeNotifier,
      builder: (context, isDark, child) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '! Felicidades !',
                style: TextStyle(color: _getTextColor(), fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
            centerTitle: true,
            backgroundColor: _getBackgroundColor(),
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop(); // Volver atrás
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
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
                child: InkWell(
                  onTap: () {
                    _showDialogWithFade(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
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
                                    // Botón de música
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
                                    // Botón de tema
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
                                    // Botón de cerrar aplicación
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
                                            Navigator.of(context).pop(); // Cierra el popup actual
                                            // Muestra popup de confirmación
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
                                                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                                                    ),
                                                                    child: Text('Cancelar', style: TextStyle(fontSize: 16, color: _getTextColor())),
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
                                                                    borderRadius: BorderRadius.circular(9),
                                                                  ),
                                                                  child: ElevatedButton(
                                                                    onPressed: () {
                                                                      Navigator.of(context).pop();
                                                                      Navigator.of(context).popUntil((route) => route.isFirst);
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
                                                                    child: Text('Salir', style: TextStyle(fontSize: 16, color: _getTextColor())),
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
                                            backgroundColor: _getBackgroundColor(),
                                            foregroundColor: _getTextColor(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(9),
                                            ),
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(vertical: 16),
                                          ),
                                          child: Text('Salir', style: TextStyle(fontSize: 16, color: _getTextColor())),
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
              ),
            ],
          ),
          backgroundColor: _getBackgroundColor(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                  'Has completado exitosamente la Última Prueba de My Secret Wine. \n\nAhora puedes contactarnos para obtener más información o resolver cualquier consulta.',
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 80),
                
                
                // Email
                _buildContactItem(
                  icon: Icons.email,
                  title: 'Email',
                  subtitle: 'contacto@mysecretwine.com',
                  onTap: _launchEmail,
                ),
                
                const SizedBox(height: 24),
                
                // Teléfono
                _buildContactItem(
                  icon: Icons.phone,
                  title: 'Teléfono',
                  subtitle: '+34 123 456 789',
                  onTap: _launchPhone,
                ),
                
                const SizedBox(height: 24),
                
                // Website
                _buildContactItem(
                  icon: Icons.web,
                  title: 'Sitio Web',
                  subtitle: 'www.lachicadeamarillo.com',
                  onTap: _launchWebsite,
                ),
                
              ],
            ),
          ),
          ),
        );
      },
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColor().withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: _getTextColor(),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: _getTextColor().withValues(alpha: 0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: _getTextColor().withValues(alpha: 0.5),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
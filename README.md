# My Secret Wine 🍷

Una aplicación Flutter multiplataforma para Android e iOS dedicada a los amantes del vino. Descubre, guarda y gestiona tus vinos favoritos de manera elegante y sencilla.

## ✨ Características

- 📱 **Multiplataforma**: Disponible para Android e iOS
- 🍷 **Lista de Vinos**: Explora y descubre nuevos vinos
- ❤️ **Favoritos**: Marca tus vinos preferidos
- 👤 **Perfil**: Personaliza tu experiencia
- 🎨 **Diseño Elegante**: Interfaz moderna con Material Design 3
- 🌙 **Modo Oscuro**: Soporte completo para tema oscuro

## 🚀 Primeros Pasos

### Prerrequisitos

Asegúrate de tener instalado:

- [Flutter](https://flutter.dev/docs/get-started/install) (versión 3.10.0 o superior)
- [Dart](https://dart.dev/get-dart) (viene incluido con Flutter)
- [Android Studio](https://developer.android.com/studio) para desarrollo Android
- [Xcode](https://developer.apple.com/xcode/) para desarrollo iOS (solo en macOS)

### Instalación

1. **Clona el repositorio**

   ```bash
   git clone <tu-repositorio>
   cd my_secret_wine
   ```

2. **Instala las dependencias**

   ```bash
   flutter pub get
   ```

3. **Verifica la configuración**

   ```bash
   flutter doctor
   ```

4. **Ejecuta la aplicación**

   ```bash
   flutter run
   ```

## 🏗️ Estructura del Proyecto

```text
my_secret_wine/
├── lib/
│   └── main.dart              # Punto de entrada principal
├── test/
│   └── widget_test.dart       # Pruebas de widgets
├── android/                   # Configuración específica de Android
├── ios/                       # Configuración específica de iOS
├── assets/
│   ├── images/               # Imágenes de la aplicación
│   └── icons/                # Iconos personalizados
├── pubspec.yaml              # Dependencias y configuración
└── README.md                 # Este archivo
```

## 🛠️ Comandos Útiles

### Desarrollo

```bash
# Ejecutar en modo debug
flutter run

# Ejecutar en modo release
flutter run --release

# Hot reload durante el desarrollo
# Presiona 'r' en la terminal mientras la app está ejecutándose

# Ejecutar pruebas
flutter test

# Analizar código
flutter analyze

# Formatear código
flutter format .
```

### Construcción

```bash
# Construir APK para Android
flutter build apk

# Construir App Bundle para Android
flutter build appbundle

# Construir para iOS
flutter build ios
```

## 📦 Dependencias Principales

- **flutter**: Framework principal
- **cupertino_icons**: Iconos de iOS
- **http**: Cliente HTTP para API calls
- **shared_preferences**: Almacenamiento local
- **flutter_rating_bar**: Sistema de puntuación

### Dependencias de Desarrollo

- **flutter_test**: Framework de pruebas
- **flutter_lints**: Reglas de linting para Dart/Flutter

## 🎨 Temas y Diseño

La aplicación utiliza Material Design 3 con:

- **Color principal**: Vino tinto (#8B0000)
- **Soporte completo para modo oscuro**
- **Navegación por pestañas**: Vinos, Favoritos, Perfil
- **Diseño responsivo** para diferentes tamaños de pantalla

## 🧪 Pruebas

Ejecuta las pruebas con:

```bash
flutter test
```

Las pruebas incluyen:

- Pruebas unitarias de widgets
- Verificación de navegación
- Validación de la interfaz de usuario

## 📱 Compatibilidad

- **Android**: API 21+ (Android 5.0+)
- **iOS**: iOS 12.0+
- **Orientaciones**: Retrato y paisaje

## 🔧 Configuración de VS Code

Tareas configuradas:

- **Flutter Run**: Ejecutar la aplicación en modo debug
- **Flutter Test**: Ejecutar todas las pruebas
- **Flutter Analyze**: Analizar el código

Extensiones recomendadas:

- Flutter
- Dart

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver `LICENSE` para más detalles.

## 🤝 Contribuir

1. Haz fork del proyecto
2. Crea tu rama de feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📞 Soporte

Si tienes alguna pregunta o problema:

- Abre un [issue](../../issues) en GitHub
- Revisa la [documentación de Flutter](https://flutter.dev/docs)

---

¡Disfruta explorando el mundo del vino! 🍷✨

# My Secret Wine 🍷

**My Secret Wine** es una aplicación educativa interactiva diseñada para guiarte en el fascinante mundo del vino. Desde su historia milenaria hasta la creación de tu propia bodega en casa, esta app te ofrece un curso completo estructurado en 22 temas esenciales.

## ✨ Características Principales

- � **Curso Estructurado**: 22 temas educativos que cubren historia, viticultura, elaboración, tipos de vino, cata y maridaje.
- � **Progresión Gamificada**: Desbloquea nuevos temas a medida que apruebas los tests de cada lección.
- 🧠 **Aprendizaje Interactivo**: Contenido teórico enriquecido con fichas de repaso y curiosidades.
- 📝 **Evaluación Continua**: Tests al final de cada tema para asegurar la comprensión.
- 🏆 **Prueba Final**: Un desafío integral en el tema 22 para demostrar todo lo aprendido.
- 🥂 **Recompensa Exclusiva**: Desbloquea una "Cata Guiada Final" al superar el curso.
- 🎵 **Experiencia Inmersiva**: Música de fondo relajante para acompañar tu lectura.
- 🎨 **Personalización**: Modo claro y oscuro, y control de música.
- 📊 **Seguimiento de Progreso**: Visualiza tus avances con indicadores de copas de vino (vacía, media, llena).

## 📚 Contenido del Curso

El temario está diseñado para llevarte de principiante a experto:

1. **Historia del vino**: Del mito a la copa.
2. **La vid y sus secretos**: Entendiendo la materia prima.
3. **Proceso de elaboración**: Del campo a la botella.
4. **Vino Tinto**: Cuerpo y carácter.
5. **Vino Blanco**: Frescura y elegancia.
6. **Vino Rosado**: Equilibrio y versatilidad.
7. **Vino Espumoso**: Magia en las burbujas.
8. **Vino Dulce**: Placer en cada sorbo.
9. **La cata paso a paso**: Aprende a degustar.
10. **La temperatura perfecta**: El servicio ideal.
11. **La copa perfecta**: Importancia del cristal.
12. **Historia del arte y vino**: Cultura líquida.
13. **Maridajes que enamoran**: El arte de combinar.
14. **Vino y música**: Armonía perfecta.
15. **Rutas del vino del mundo**: Viajes enológicos.
16. **El vino como ritual social**: Compartir y celebrar.
17. **Cómo leer la etiqueta**: Entiende lo que compras.
18. **Conservación y servicio**: Cuida tus botellas.
19. **Cómo elegir el vino**: Consejos de compra.
20. **Vinos del futuro**: Sostenibilidad y tecnología.
21. **Cómo crear tu bodega en casa**: Tu colección personal.
22. **Última prueba**: Demuestra lo aprendido.

## � Tecnologías Utilizadas

- **Flutter & Dart**: Framework principal para desarrollo multiplataforma.
- **audioplayers**: Reproducción de música de fondo ambiental.
- **shared_preferences**: Persistencia de datos local para guardar tu progreso (temas desbloqueados, puntuaciones).
- **google_fonts**: Tipografía elegante para una mejor experiencia de lectura.
- **flutter_svg**: Renderizado de gráficos vectoriales de alta calidad.

## 📱 Instalación y Ejecución

1. **Clona el repositorio**

   ```bash
   git clone <tu-repositorio>
   cd my_secret_wine
   ```

2. **Instala las dependencias**

   ```bash
   flutter pub get
   ```

3. **Ejecuta la aplicación**

   ```bash
   flutter run
   ```

## �️ Comandos de Desarrollo

- `flutter run`: Ejecutar en modo debug.
- `flutter build apk --release`: Generar instalable para Android.

## � Autenticación y Acceso

La aplicación cuenta con un sistema de acceso exclusivo mediante un código único vinculado al correo electrónico del usuario.

### Funcionamiento del Login

1. **Email**: El usuario introduce su dirección de correo electrónico.
2. **Código de Acceso**: Se debe introducir una contraseña de 6 caracteres generada específicamente para ese email.
3. **Validación**: La app verifica localmente que el código coincida con el algoritmo de generación.

### Algoritmo de Generación de Códigos

El código se genera utilizando un hash **HMAC-SHA256**:

- **Secreto**: `mi_secret_v1_2025`
- **Entrada**: Email normalizado (minúsculas y sin espacios).
- **Salida**: Una cadena alfanumérica de 6 caracteres.

Este mecanismo asegura que cada usuario tenga una clave única y personal para acceder al contenido del curso.

Si quieres generar un código nuevo:

1. Abre el archivo `generate_code.dart`.

2. Escribe en la terminal:

   ```bash
   dart run generate_code.dart "tu@email.com"
   ```

3. Cambia `tu@email.com` por el tuyo y pulsa enter.


## �📄 Licencia

Este proyecto es de uso educativo y personal.

---
¡Disfruta aprendiendo y conviértete en un experto en vinos con...

**My Secret Wine**! 🍷✨

import 'package:flutter/material.dart';

void main() {
  runApp(const MySecretWineApp());
}

class MySecretWineApp extends StatelessWidget {
  const MySecretWineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Secret Wine',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B0000), // Vino tinto
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B0000),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const WineHomePage(),
    );
  }
}

class WineHomePage extends StatefulWidget {
  const WineHomePage({super.key});

  @override
  State<WineHomePage> createState() => _WineHomePageState();
}

class _WineHomePageState extends State<WineHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    WineListPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Secret Wine'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wine_bar),
            label: 'Vinos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Página de lista de vinos
class WineListPage extends StatelessWidget {
  const WineListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.wine_bar,
            size: 100,
            color: Color(0xFF8B0000),
          ),
          SizedBox(height: 20),
          Text(
            '¡Bienvenido a My Secret Wine!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Descubre y guarda tus vinos favoritos',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Página de favoritos
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.favorite,
            size: 100,
            color: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            'Tus Vinos Favoritos',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Aquí aparecerán los vinos que marques como favoritos',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Página de perfil
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Text(
            'Mi Perfil',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Configura tu perfil y preferencias',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
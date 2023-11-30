import 'package:bottom_nav_bar/presentation/views/home_view.dart';
import 'package:bottom_nav_bar/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Variable para dar seguimiento al index del bottom navigation bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Vistas disponibles ========================================
    final views = [const HomeView(), const SearchView()];

    return Scaffold(
      // Views ===================================================
      body: IndexedStack(
        index: selectedIndex,
        children: views,
      ),
      //body: views[selectedIndex], // no mantiene el estado

      // BottomNavigationBar =====================================
      bottomNavigationBar: BottomNavigationBar(
        // Op. Colorear el fondo del BottomNavigationBar
        //type: BottomNavigationBarType.shifting,
        elevation: 0,
        // Cambiar index al hacer clic
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        // Pasar el valor del nuevo Index
        // (Debido a que se usan un State)
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            activeIcon: const Icon(Icons.search),
            label: 'Search',
            backgroundColor: colors.secondary,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '/screen/screen.dart';
import '../constant.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(key: PageStorageKey('HomeScreen')),
    FavouritesScreen(key: PageStorageKey('HomeScreen')),
    StationsScreen(key: PageStorageKey('StationScreen')),
    PlaylistScreen(key: PageStorageKey('PlaylistScreen')),
    ProfileScreen(key: PageStorageKey('ProfileScreen')),
  ];
  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Favourites': Icons.favorite,
    'Station': Icons.radio,
    'Playlist': Icons.playlist_add,
    'Profile': Icons.person
  };
  var _currentIndex = 2;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xff26252B),
              elevation: 3,
              items: _icons
                  .map((title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                        icon: Icon(icon, size: 30.0),
                        label: title,
                      )))
                  .values
                  .toList(),
              currentIndex: _currentIndex,
              selectedItemColor: kAccentColor,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              unselectedItemColor: kPrimaryColor,
              onTap: (index) => setState(() => _currentIndex = index)),
        ));
  }
}

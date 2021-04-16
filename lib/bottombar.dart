import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomBarIndexProvider = StateProvider((_) => 0);

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('BottomBar/build');
    return Consumer(
      builder: (context, watch, child) {
        final selectIndex = watch(bottomBarIndexProvider);
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: selectIndex.state,
          selectedItemColor: Colors.amber[800],
          onTap: (indx) => selectIndex.state = indx,
        );
      },
    );
  }
}

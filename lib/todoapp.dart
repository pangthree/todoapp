import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottombar.dart';
import 'toolbar.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('TodoApp/build');
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Todo App'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(32),
            child: ListView(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'hint?',
                    labelText: 'What do you want to do?',
                  ),
                  onSubmitted: (value) {
                    
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Toolbar(),
                ),
                for (var i = 0; i < 10; i++) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                    child: Material(
                      elevation: 1,
                      child: ListTile(
                        title: Text('$i'),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}

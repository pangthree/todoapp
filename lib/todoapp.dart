import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/todo.dart';

import 'bottombar.dart';
import 'toolbar.dart';

final todoListProvider = StateNotifierProvider((_) => TodoList([
      Todo(id: '1', description: 'Hello, todo!'),
    ]));

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
            child: Consumer(builder: (context, watch, child) {
              final todoList = watch(todoListProvider);
              return ListView(children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'What do you want to do?',
                  ),
                  onSubmitted: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Toolbar(),
                ),
                for (final todo in todoList) ...[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                    child: Material(
                      elevation: 1,
                      child: ListTile(
                        title: Text('${todo.description}'),
                      ),
                    ),
                  ),
                ],
              ]);
            }),
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}

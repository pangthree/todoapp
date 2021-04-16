import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final toolbarTypeProvider = StateProvider((_) => ToolbarType.all);

enum ToolbarType { all, active, completed }

class Toolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final toolbarType = watch(toolbarTypeProvider);

        TextStyle toolbarStyle(ToolbarType type) {
          return type == toolbarType.state
              ? TextStyle(color: Colors.deepPurpleAccent)
              : TextStyle(color: Colors.black38);
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  toolbarType.state = ToolbarType.all;
                },
                child: Text(
                  'All',
                  style: toolbarStyle(ToolbarType.all),
                )),
            TextButton(
                onPressed: () {
                  toolbarType.state = ToolbarType.active;
                },
                child: Text(
                  'Active',
                  style: toolbarStyle(ToolbarType.active),
                )),
            TextButton(
                onPressed: () {
                  toolbarType.state = ToolbarType.completed;
                },
                child: Text(
                  'Completed',
                  style: toolbarStyle(ToolbarType.completed),
                )),
          ],
        );
      },
    );
  }
}

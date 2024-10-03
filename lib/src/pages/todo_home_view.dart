import 'package:flutter/material.dart';
import 'package:todo_001/src/pages/add_new_todo_view.dart';
import 'package:todo_001/src/pages/todo_active_list_view.dart';
import 'package:todo_001/src/pages/todo_all_list_view.dart';
import 'package:todo_001/src/pages/todo_completed_list_view.dart';

class TodoHomeView extends StatefulWidget {
  const TodoHomeView({super.key});

  @override
  State<TodoHomeView> createState() => _TodoHomeViewState();
}

class _TodoHomeViewState extends State<TodoHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Todo'),
            bottom: const TabBar(
              tabs: [
                Tab(child: Text('All')),
                Tab(child: Text('Active')),
                Tab(child: Text('Completed')),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TodoAllListView(),
              TodoActiveListView(),
              TodoCompletedListView(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewTodoView(),
                ),
              );
            },
            child: const Icon(Icons.note_alt_rounded),
          ),
        ),
      ),
    );
  }
}

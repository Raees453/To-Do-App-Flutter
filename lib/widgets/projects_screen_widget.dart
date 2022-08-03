import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/add_to_do_widget.dart';

class ProjectScreenWidget extends StatelessWidget {
  const ProjectScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mary\'s Projects',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                getChipOf('All', () {
                  print('All Pressed');
                }, context),
                getChipOf('To Do', () {
                  print('To Do');
                }, context),
                getChipOf('In Progress', () {
                  print('In Progress');
                }, context),
                getChipOf('Done', () {
                  print('Done');
                }, context),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => _onPressed(context),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }

  getChipOf(text, onPressed, context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Chip(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8.0),
          label: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }

  _onPressed(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (_) => AddToDoWidget(),
    );
  }
}

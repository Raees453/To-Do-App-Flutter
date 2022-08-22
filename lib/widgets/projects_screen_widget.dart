import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/task_widget.dart';

class ProjectScreenWidget extends StatefulWidget {
  const ProjectScreenWidget({Key? key}) : super(key: key);

  @override
  State<ProjectScreenWidget> createState() => _ProjectScreenWidgetState();
}

class _ProjectScreenWidgetState extends State<ProjectScreenWidget> {
  var date = DateTime.now();
  bool _dateChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  getChipOf('All 10', () {
                    print('All Pressed');
                  }, context),
                  getChipOf('To Do 3', () {
                    print('To Do');
                  }, context),
                  getChipOf('In Progress 1', () {
                    print('In Progress');
                  }, context),
                  getChipOf('Done 6', () {
                    print('Done');
                  }, context),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _statusWidget(
              'To Do',
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ),
            const SizedBox(height: 10),
            _listProjects(),
            const SizedBox(height: 30),
            _statusWidget(
              'In Progress',
              // Color.fromRGBO(250, 215, 143, 1),
              Theme.of(context).colorScheme.secondary.withOpacity(0.8),
            ),
            const SizedBox(height: 10),
            _listProjects(),
            const SizedBox(height: 30),
            _statusWidget(
              'Done',
              Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
            ),
            const SizedBox(height: 10),
            _listProjects(),
          ],
        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
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

  _listProjects() {
    return ListView.builder(
      itemCount: 2,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (_, index) => TaskWidget(),
    );
  }

  _onPressed(context) async {
    final titleController = TextEditingController();
    final subtitleController = TextEditingController();

    await showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoTextField(
              placeholder: 'Title',
              padding: const EdgeInsets.all(8.0),
              controller: titleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoTextField(
              placeholder: 'Subtitle',
              padding: const EdgeInsets.all(8.0),
              controller: subtitleController,
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              await showCupertinoModalPopup(
                context: context,
                builder: (_) => SizedBox(
                  height: 200,
                  child: SafeArea(
                    top: false,
                    child: CupertinoDatePicker(
                      backgroundColor: Theme.of(context).bottomAppBarColor,
                      mode: CupertinoDatePickerMode.date,
                      minimumDate: DateTime.now(),
                      dateOrder: DatePickerDateOrder.dmy,
                      maximumDate: DateTime(DateTime.now().year + 1),
                      onDateTimeChanged: (_) {
                        setState(() {
                          date = _;
                          _dateChanged = !_dateChanged;
                        });
                      },
                    ),
                  ),
                ),
              );

              print('Date: ${date}');
            },
            child: Text(_dateChanged ? date.toString() : 'Select Date'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ],
        title: const Text('Add To Do'),
        message: const Text('Provide required details to add'),
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  _statusWidget(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

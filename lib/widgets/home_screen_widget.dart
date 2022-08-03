import 'package:flutter/material.dart';
import 'package:to_do_app/utils/utils.dart';
import 'package:to_do_app/widgets/progress_to_do_widget.dart';
import 'package:to_do_app/widgets/to_do_widget.dart';
import 'package:to_do_app/widgets/today_task_widget.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Utils.pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hello, Mary',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    _getIconButton(context, true),
                  ],
                ),
                const SizedBox(height: 15),
                const TodayTaskWidget(),
                const SizedBox(height: 25),
                _headingTask(context, 'To Do', 3),
                const SizedBox(height: 15),
                _listToDoTasks(),
                const SizedBox(height: 25),
                _headingTask(context, 'In Progress', 7),
                const SizedBox(height: 5),
                _listProgressToDoTasks(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getIconButton(context, bool hasNotification) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        if (hasNotification)
          Positioned(
            top: 10,
            right: 11,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              radius: 4,
            ),
          ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: 30,
          ),
        ),
      ],
    );
  }

  _headingTask(context, String heading, int num) {
    return Row(
      children: [
        Text(
          heading,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 229, 244, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '${num}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }

  _listToDoTasks() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => const ToDoWidget(),
      ),
    );
  }

  _listProgressToDoTasks() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 7,
      primary: false,
      itemBuilder: (_, index) => ProgressToDoWidget(),
    );
  }
}

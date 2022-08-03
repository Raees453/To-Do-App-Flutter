import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(235, 236, 250, 1),
        borderRadius: BorderRadius.circular(Utils.borderRadius),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Superapp',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Redesign Home Screen'.substring(0, 20),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                radius: 7,
              ),
              SizedBox(width: 10),
              Text('till 10th May 2021'),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Approve Add Banner',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 4,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(
                  Icons.calendar_today,
                  size: 15,
                ),
                SizedBox(width: 10),
                Text('till Oct November Dec 2022'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

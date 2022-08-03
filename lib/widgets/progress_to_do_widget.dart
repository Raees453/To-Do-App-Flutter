import 'package:flutter/material.dart';
import 'package:to_do_app/utils/utils.dart';

class ProgressToDoWidget extends StatefulWidget {
  ProgressToDoWidget({Key? key}) : super(key: key);

  @override
  State<ProgressToDoWidget> createState() => _ProgressToDoWidgetState();
}

class _ProgressToDoWidgetState extends State<ProgressToDoWidget> {
  final taskStatusList = ['To Do', 'In Progress', 'Done'];

  String value = 'To Do';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Utils.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Flexible(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sam\'s Project',
                    style: TextStyle(
                      color: Color.fromRGBO(175, 174, 174, 1),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Create three add banners'.substring(0, 22) + ' ...',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '2 hours',
                    style: TextStyle(
                      color: Color.fromRGBO(175, 174, 174, 0.9),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: DropdownButton(
                value: value,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: taskStatusList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                underline: const SizedBox(),
                isDense: false,
                elevation: 3,
                alignment: Alignment.centerRight,
                onChanged: (String? newValue) {
                  setState(() {
                    value = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

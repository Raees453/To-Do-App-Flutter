import 'package:flutter/material.dart';

import '../utils/utils.dart';

class TodayTaskWidget extends StatelessWidget {
  const TodayTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(Utils.borderRadius),
        ),
        padding: const EdgeInsets.all(Utils.pagePadding),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 240, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    '2/7 tasks',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/group.png',
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }
}

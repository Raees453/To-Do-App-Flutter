import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddToDoWidget extends StatelessWidget {
  AddToDoWidget({Key? key}) : super(key: key);

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            createTextField(
              text: 'Title',
              label: 'Title',
              prefixIcon: const Icon(Icons.title),
            ),
            SizedBox(height: 10),
            createTextField(
              text: 'Title',
              label: 'Title',
              prefixIcon: const Icon(Icons.title),
            ),
            const SizedBox(height: 15),
            StatefulBuilder(
              builder: (_, setState) => GestureDetector(
                onTap: () async {
                  setState(() => _isSelected = !_isSelected);

                  String date = (await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                  ))
                      .toString();
                  print('Date: $date');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 2,
                      color: _isSelected
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(175, 174, 174, 1),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 16,
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Please select a date',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Icon(Icons.date_range),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  createTextField({
    required String text,
    required String label,
    String? Function(String?)? validator,
    TextEditingController? controller,
    TextInputType inputType = TextInputType.text,
    TextInputAction inputAction = TextInputAction.next,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Icon? prefixIcon,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      textInputAction: inputAction,
      textCapitalization: textCapitalization,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        label: Text(label),
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}

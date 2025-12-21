import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  final int currentSelection;
  final ValueChanged<int?> onChanged;

  const RadioButtonWidget({
    super.key,
    required this.currentSelection,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Standard'),
          leading: Radio<int>(
            value: 1,
            groupValue: currentSelection,
            onChanged: onChanged,
          ),
        ),
        ListTile(
          title: const Text('Premium'),
          leading: Radio<int>(
            value: 2,
            groupValue: currentSelection,
            onChanged: onChanged,
          ),
        ),
        ListTile(
          title: const Text('Custom'),
          leading: Radio<int>(
            value: 3,
            groupValue: currentSelection,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int trimLines;
  final int charLimit; // Added character limit property

  const ExpandableTextWidget({
    Key? key,
    required this.text,
    this.trimLines = 3,
    this.charLimit = 150, // Defaulting to 150 as requested
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableTextWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Check if the text length exceeds the limit
    bool isLongText = widget.text.length > widget.charLimit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          // Limit lines only if text is long AND not currently expanded
          maxLines: (isLongText && !isExpanded) ? widget.trimLines : null,
          overflow: (isLongText && !isExpanded) ? TextOverflow.ellipsis : TextOverflow.visible,
          style: const TextStyle(fontSize: 16, color: AppColors.grey72),
        ),
        // Only show the button if the text actually exceeds the limit
        if (isLongText)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                isExpanded ? "Show less" : "Read more",
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime?) onDateSelected;
  final DateTime? initialDate;

  const CustomDatePicker({
    Key? key,
    required this.onDateSelected,
    this.initialDate,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  Future<void> _pickDate() async {

    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: DateTime(2000),
    );

    if (picked != null) {
      final onlyDate = DateTime(picked.year, picked.month, picked.day);

      setState(() {
        selectedDate = onlyDate;
      });

      widget.onDateSelected(onlyDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: Card(
        color: AppColors.aniFlashWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide( width: 1, color: Colors.grey.shade400)
        ),
        elevation: 0,
        child: ListTile(
          title: Text(
            selectedDate != null
                ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                : "No date selected",
            style: TextStyle(
              color: selectedDate == null ? Colors.grey : Colors.black, fontSize: 16.sp
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: _pickDate,
          ),
        ),
      ),
    );
  }
}

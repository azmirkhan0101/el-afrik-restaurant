import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  // State for Checkboxes (Multiple selection allowed)
  final Map<String, bool> _filters = {
    "Spicy": false,
    "Vegan": false,
    "Halal": false,
  };

  // State for Price Chips (Only one selection allowed)
  String _selectedPrice = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Drag Handle
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Filters",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Filter Options (Selectable)
              ..._filters.keys.map((label) => _buildCheckbox(label)).toList(),

              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Price", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),

              // Price Chips (Single Selection)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _priceChip("15\$-20\$"),
                  _priceChip("21\$-30\$"),
                  _priceChip("31\$-40\$"),
                ],
              ),
              const SizedBox(height: 40),
              ButtonWidget(
                  label: "Apply",
                onPressed: () {
                  //Collect selected data
                  final selectedFilters = _filters.entries
                      .where((e) => e.value)
                      .map((e) => e.key)
                      .toList();
                  print("Filters: $selectedFilters, Price: $_selectedPrice");
                  Navigator.pop(context);
                },
                  buttonRadius: 25
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(String label) {
    bool isSelected = _filters[label] ?? false;

    return GestureDetector(
      onTap: () {
        setState(() {
          _filters[label] = !isSelected;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xFF00B14F) : Colors.transparent,
                border: Border.all(
                    color: const Color(0xFF00B14F),
                    width: 2
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 15),
            Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _priceChip(String text) {
    bool isSelected = _selectedPrice == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPrice = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00B14F).withOpacity(0.1) : Colors.transparent,
          border: Border.all(
            color: isSelected ? const Color(0xFF00B14F) : Colors.black87,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFF00B14F) : Colors.black,
            )
        ),
      ),
    );
  }
}
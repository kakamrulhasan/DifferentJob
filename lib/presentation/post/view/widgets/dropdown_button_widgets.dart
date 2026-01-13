import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constansts/color_manager.dart';

class MyDropdownWidget extends ConsumerStatefulWidget {
  // Make the widget configurable
  final List<String> options;
  final String hint;
  final String? initialValue;
  final void Function(String?)? onChanged;

  const MyDropdownWidget({
    super.key,
    required this.options,
    this.hint = 'Select an option',
    this.initialValue,
    this.onChanged,
  });

  @override
  ConsumerState<MyDropdownWidget> createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends ConsumerState<MyDropdownWidget> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue; // set initial value if provided
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.black12, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(widget.hint),
          isExpanded: true,
          items: widget.options.map((option) {
            return DropdownMenuItem<String>(value: option, child: Text(option));
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });

            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class CustomDropdown<T> extends ConsumerWidget {
  const CustomDropdown({
    super.key,
    required this.items,
    required this.provider,
    required this.hint,
    this.icon = Icons.arrow_drop_down_circle,
    this.dropdownColor,
    this.style,
    this.borderColor = Colors.grey,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
  });

  // List of items to show
  final List<T> items;

  // Riverpod StateProvider
  final StateProvider<T?> provider;

  // Hint text
  final String hint;

  // Optional customization
  final IconData icon;
  final Color? dropdownColor;
  final TextStyle? style;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue = ref.watch(provider);

    return DropdownButtonFormField<T>(
      value: selectedValue,
      hint: Text(hint),
      icon: Icon(icon, color: dropdownColor ?? ColorManager.black12),
      dropdownColor: dropdownColor,
      style: style ?? const TextStyle(color: Colors.black, fontSize: 16),
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: padding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
      ),
      onChanged: (T? newValue) {
        ref.read(provider.notifier).state = newValue;
      },
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Row(
            children: [
              const Icon(Icons.category),
              const SizedBox(width: 8),
              Text(item.toString()),
            ],
          ),
        );
      }).toList(),
    );
  }
}

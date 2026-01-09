import 'package:flutter/material.dart';
import '../../../core/constansts/color_manager.dart';

class ExperienceInputCard extends StatefulWidget {
  final List<String> items;
  final ValueChanged<List<String>> onChanged;

  const ExperienceInputCard({
    super.key,
    required this.items,
    required this.onChanged,
  });

  @override
  State<ExperienceInputCard> createState() => _ExperienceInputCardState();
}

class _ExperienceInputCardState extends State<ExperienceInputCard> {
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    final text = _controller.text.trim();
    if (text.isEmpty || widget.items.contains(text)) return;

    setState(() {
      widget.items.add(text);
    });

    widget.onChanged(widget.items);
    _controller.clear();
    Navigator.pop(context);
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Experience'),
        content: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'e.g. Photoshop'),
          onSubmitted: (_) => _addItem(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(onPressed: _addItem, child: const Text('Add')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.black12),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Chips
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: widget.items.map((item) {
              return Chip(
                label: Text(item),
                deleteIcon: const Icon(Icons.close, size: 18),
                onDeleted: () {
                  setState(() => widget.items.remove(item));
                  widget.onChanged(widget.items);
                },
                backgroundColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 14),

          /// Add Button
          ElevatedButton(
            onPressed: _showAddDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Add',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 6),
                Icon(Icons.add, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

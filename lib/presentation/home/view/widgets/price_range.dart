import 'package:flutter/material.dart';

class priceRange extends StatelessWidget {
  const priceRange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Text('Min-\$100'),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Text(
              'Max-\$1000',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

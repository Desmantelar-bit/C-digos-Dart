import 'package:flutter/material.dart';

class MeuDropdown extends StatelessWidget {
  final int? value;
  final String label;
  final List<dynamic> items;
  final Function(int?) onChanged;

  const MeuDropdown({
    super.key,
    required this.value,
    required this.label,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<int>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items
            .map((item) => DropdownMenuItem<int>(
                  value: item['id'],
                  child: Text(item['nome']),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
}

}   

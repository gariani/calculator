import 'package:calculator/utils/operation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditpadWiget extends StatefulWidget {
  const EditpadWiget({super.key});

  @override
  State<EditpadWiget> createState() => _EditpadWigetState();
}

class _EditpadWigetState extends State<EditpadWiget> {
  final GlobalKey editingKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Operation>(
      builder: (context, operator, child) {
        return TextFormField(
          key: editingKey,
          controller: operator.editingController,
          maxLines: 1,
          readOnly: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

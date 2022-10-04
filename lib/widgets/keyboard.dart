import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/items.dart';
import '../utils/operation.dart';

class KeyboardWidget extends StatefulWidget {
  const KeyboardWidget({super.key});

  @override
  State<KeyboardWidget> createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget> {
  final String pi = '\u{03C0}';
  final String root = '\u{221A}';
  final String power = 'x\u{00B2}';
  late List<Items> items;

  late Operation _operator;

  @override
  void dispose() {
    _operator.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _operator = Operation();

    items = [
      Items(symbol: '<='),
      Items(symbol: '('),
      Items(symbol: ')'),
      Items(symbol: 'mod'),
      Items(symbol: pi),
      Items(symbol: '7'),
      Items(symbol: '8'),
      Items(symbol: '9'),
      Items(symbol: '/'),
      Items(symbol: root),
      Items(symbol: '4'),
      Items(symbol: '5'),
      Items(symbol: '6'),
      Items(symbol: 'x'),
      Items(symbol: power),
      Items(symbol: '1'),
      Items(symbol: '2'),
      Items(symbol: '3'),
      Items(symbol: '-'),
      Items(symbol: '<>'),
      Items(symbol: '0'),
      Items(symbol: '.'),
      Items(symbol: '%'),
      Items(symbol: '+'),
      Items(symbol: '='),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Operation operator = Provider.of<Operation>(context);

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 0.5,
        crossAxisSpacing: 0.5,
        mainAxisExtent: 60,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            operator.options(items[index].symbol);
          },
          child: Card(
            elevation: 5,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
              side: const BorderSide(
                color: Colors.blue,
                width: 0.5,
              ),
            ),
            child: Center(
              child: Text(
                items[index].symbol,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

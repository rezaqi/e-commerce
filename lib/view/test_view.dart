import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyWidget extends StatefulWidget {
  final String k;
  const MyWidget({super.key, required this.k});

  @override
  State<MyWidget> createState() => _MyWidgetState(g: '');
}

class _MyWidgetState extends State<MyWidget> {
  final String g;
  _MyWidgetState({required this.g});
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

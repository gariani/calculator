import 'package:calculator/utils/operation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/edit_pad.dart';
import 'widgets/keyboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Operation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Calculator'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(5, (index) => Text('$index')),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Expanded(
              flex: 1,
              child: EditpadWiget(),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Expanded(
              flex: 6,
              child: Center(
                child: KeyboardWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

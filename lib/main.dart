import 'package:flutter_web/material.dart';

import 'category_list.dart';
import 'category_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What is at Home',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      home: MyHomePage(title: 'What is at Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Category> initialCategory = []
    ..add(Category('Alma', 'Kiscica'))
    ..add(Category('Category', 'description'))
    ..add(Category('Valami', 'description'))
    ..add(Category('EzMEgAZ', 'description'))
    ..add(Category('name', 'description'))
    ..add(Category('name', 'description'))
    ..add(Category('name', 'description'));

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: 600,
          child: CategoryList(initialCategory),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

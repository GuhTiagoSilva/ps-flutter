import 'package:flutter/material.dart';
import 'package:ocean_tech/components/navigation_draw_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(50, 75, 205, 1),
      ),
      home: MyHomePage(title: 'Ocean Tech'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/rainy.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

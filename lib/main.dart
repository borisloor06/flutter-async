import 'package:async_flutter/services/mockapi.dart';
import 'package:async_flutter/widgets/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false);
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AwaitButton(
                duration: 1,
                img:
                    'https://icones.pro/wp-content/uploads/2022/07/symbole-d-eclair-noir.png',
                fun: MockApi().getFerrariInteger,
                color: Colors.red,
              ),
              AwaitButton(
                duration: 3,
                img:
                    'https://static.vecteezy.com/system/resources/previews/001/193/785/non_2x/car-png.png',
                fun: MockApi().getHyundaiInteger,
              ),
              AwaitButton(
                duration: 10,
                img:
                    'https://res.cloudinary.com/dtmsfgjzi/image/upload/v1670421045/rabbit_z1uf50.png',
                fun: MockApi().getFisherPriceInteger,
                color: Colors.green,
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

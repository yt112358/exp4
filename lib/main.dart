import 'package:flutter/material.dart';
import 'package:exp4/trump_card.dart';
import 'package:exp4/card_value.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Card Shuffle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const double cardBaseSize = 52;
const double cardBaseHeight = cardBaseSize * 1.56;

class _MyHomePageState extends State<MyHomePage> {

  Map<String, bool> isFaceMap = <String, bool>{"heart0": true, "heart1" : true, "heart2": true, "heart3": true};
  List<CardValue> orderList = [
    ...List<CardValue>.generate(13, (index) => CardValue("heard$index", index + 1,  "Heart", "heart.svg")).toList(),
    ...List<CardValue>.generate(13, (index) => CardValue("spade$index", index + 1,  "Spade", "spade.svg")).toList(),
    ...List<CardValue>.generate(13, (index) => CardValue("diamond$index", index + 1,  "Diamond", "dia.svg")).toList(),
    ...List<CardValue>.generate(13, (index) => CardValue("club$index", index + 1,  "Club", "club.svg")).toList()
  ];

  void _shuffle() {
    setState(() {
      orderList.shuffle();
    });
  }

  void _toggleFace(String key) {
    setState(() {
      isFaceMap[key] = !(isFaceMap[key] ?? true);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TrumpCard> firstRow = orderList.map((cardValue) {
      //isFaceMap["spade$index"] = false;
      return TrumpCard(
          key: Key(cardValue.key),
          cardValue: cardValue,
          width: cardBaseSize,
          height: cardBaseHeight,
          isFace: isFaceMap[cardValue.key] ?? true,
          onTap: (bool value) {
            _toggleFace(cardValue.key);
          });
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: firstRow,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        tooltip: 'Shuffle',
        child: const Icon(Icons.repeat),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data.dart';

class FlashcardScreen extends StatefulWidget {
  final String category;
  const FlashcardScreen({super.key, required this.category});

  @override
  State<FlashcardScreen> createState() =>
      _FlashcardScreenState(category: category);
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  final String category;
  _FlashcardScreenState({required this.category});

  var _currItem = 0;
  late List<Map<String, String>> jsonData;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  TextStyle textStyle = TextStyle(
      color: Colors.green.shade900, fontSize: 20, fontWeight: FontWeight.w600);

  @override
  void initState() {
    super.initState();
    jsonData = (data[category] as List).cast<Map<String, String>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffA7D397),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Quick Sign Learning"),
          elevation: 5,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Guess the Sign and Flip!",
                    style: TextStyle(fontSize: 30, color: Colors.green.shade900),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: FlipCard(
                      key: cardKey,
                      side: CardSide.FRONT,
                      direction: FlipDirection.HORIZONTAL,
                      front: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 7,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Image.asset(jsonData[_currItem]["image"] ?? "",
                                fit: BoxFit.cover,
                                width: 300.0,
                                height: 400.0,
                                alignment: Alignment.center),
                          ),
                        ),
                      ),
                      back: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 7,
                        shadowColor: Colors.grey,
                        color: Colors.yellow.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(jsonData[_currItem]["letter"] ?? "",
                                textAlign: TextAlign.center, style: textStyle),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currItem = (_currItem - 1) % jsonData.length;
                          cardKey.currentState?.toggleCardWithoutAnimation();
                        });
                      },
                      child: const Text("Back")),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currItem = (_currItem + 1) % jsonData.length;
                          cardKey.currentState?.toggleCardWithoutAnimation();
                        });
                      },
                      child: const Text("Next"))
                ])));
  }
}

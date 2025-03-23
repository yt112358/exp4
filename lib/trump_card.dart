import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:exp4/card_value.dart';

class TrumpCard extends StatelessWidget {
  const TrumpCard(
      {Key? key,
      required this.cardValue,
      required this.width,
      required this.height,
      required this.isFace,
      required this.onTap})
      : super(key: key);

  final CardValue cardValue;
  final double width;
  final double height;
  final bool isFace;
  final ValueChanged<bool> onTap;

  @override
  Widget build(BuildContext context) {
    Widget cardStack = Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
                width: width * 0.4,
                height: height * 0.4,
                child: SvgPicture.asset(
                  "assets/images/${cardValue.image}",
                  semanticsLabel: 'Dart Logo',
                ))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
                width: width,
                height: height * 0.4,
                child: FittedBox(
                    child: Text(
                  cardValue.value.toString(),
                  style: TextStyle(fontSize: height * 0.3),
                  textAlign: TextAlign.center,
                )))),
      ],
    );

    Widget cardBack = Container(
        width: width - 2,
        height: height - 2,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(3),
        ));
    return GestureDetector(
        onTap: () {
          onTap(!isFace);
        },
        child: SizedBox(
            width: width,
            height: height,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(width * 0.1),
                child: isFace ? cardStack : cardBack,
              ),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'dart:math';

class CardTile extends StatefulWidget{
  String title;
  List<String> tags;
  Widget widget;
  IconData titleIcon;
  bool opened = false;
  CardTile({this.tags = const [], this.title = "Title", this.titleIcon = Icons.home, this.widget = const SizedBox.shrink(), this.opened = false});
  @override
  _CardTileState createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> with TickerProviderStateMixin {

  Widget titleBar;
  AnimationController animationController;
  Animation<double> animation;



  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 200,), vsync: this)/*..addListener((){setState(){}});*/;
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    titleBar = Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Icon(
                widget.titleIcon,
                size: 30,
                color: Colors.grey,
              ),
              SizedBox(width: 40),*/
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 30,
                  fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
          RotationTransition(
            turns: animation,
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  void toggle(){
    if(widget.opened){
      animationController.reverse();
      widget.opened = false;
    }
    else{
      animationController.forward();
      widget.opened = true;
    }
  }

  Widget tag(String s){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFCECECE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Text(
          s,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat",
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Ink(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ]
        ),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            onTap: toggle,
            child: Column(
              children: <Widget>[
                titleBar
              ] + <Widget>[SizeTransition(
                axisAlignment: 1.0,
                sizeFactor: animation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(indent: 0, endIndent: 0, height: 1,),
                    widget.tags.isEmpty ? SizedBox.shrink() : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Wrap(
                            children: widget.tags.map((e) => tag(e)).toList(),
                            spacing: 10,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: widget.widget,
                    )
                  ],
                ),
              )],
            ),
          ),
        ),
      ),
    );
  }
}

class RidillaTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "RIDILLA",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 75,
              fontWeight: FontWeight.w100
            ),
          ),
          Text(
            "EIN IDEALER MITSPIELER",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 18,
              fontWeight: FontWeight.w300,
              letterSpacing: 3
            ),
          ),
        ],
      ),
    );
  }
}

var smallTextStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w300,
);

var cards = [
  CardTile(
    title: "Abitur",
    tags: ["Schule"],
    widget: Column(
      children: [
        Wrap(
          children: [
            Text(
              """Am 25. Mai 2020 habe ich erfolgreich die Abiturprüfung in der Slowakei mit dem Durchschnitt 1.0 abgelegt.

Meine Abiturfächer waren Informatik, Mathematik, Deutsch und Slowakisch.""",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),
  CardTile(
    title: "Abitur",
    tags: ["Schule"],
    widget: Column(
      children: [
        Wrap(
          children: [
            Text(
              """Am 25. Mai 2020 habe ich erfolgreich die Abiturprüfung in der Slowakei mit dem Durchschnitt 1.0 abgelegt.

Meine Abiturfächer waren Informatik, Mathematik, Deutsch und Slowakisch.""",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),
  CardTile(
    title: "Abitur",
    tags: ["Schule"],
    widget: Column(
      children: [
        Wrap(
          children: [
            Text(
              """Am 25. Mai 2020 habe ich erfolgreich die Abiturprüfung in der Slowakei mit dem Durchschnitt 1.0 abgelegt.

Meine Abiturfächer waren Informatik, Mathematik, Deutsch und Slowakisch.""",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),
  CardTile(
    title: "Abitur",
    tags: ["Schule"],
    widget: Column(
      children: [
        Wrap(
          children: [
            Text(
              """Am 25. Mai 2020 habe ich erfolgreich die Abiturprüfung in der Slowakei mit dem Durchschnitt 1.0 abgelegt.

Meine Abiturfächer waren Informatik, Mathematik, Deutsch und Slowakisch.""",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),
  CardTile(
    title: "Abitur",
    tags: ["Schule"],
    widget: Column(
      children: [
        Wrap(
          children: [
            Text(
              """Am 25. Mai 2020 habe ich erfolgreich die Abiturprüfung in der Slowakei mit dem Durchschnitt 1.0 abgelegt.

Meine Abiturfächer waren Informatik, Mathematik, Deutsch und Slowakisch.""",
              style: smallTextStyle,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    ),
  ),
];
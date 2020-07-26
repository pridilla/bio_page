import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class CardTile extends StatefulWidget{
  String title;
  List<Tag> tags;
  Widget widget;
  IconData titleIcon;
  bool opened = false;
  CardTile({this.tags = const [], this.title = "Title", this.titleIcon = Icons.home, this.widget = const SizedBox.shrink(), this.opened = false}) : super(key: UniqueKey());
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
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 35),
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
                  fontSize: 20,
                  fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: animation, 
            builder: (builder, widget){
              return Transform.rotate(
                angle: animation.value*pi,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              );
            }
          )
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Ink(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
          borderRadius: BorderRadius.circular(20),
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
                          Row(
                            children: widget.tags.map((e) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: e,
                            )).toList(),
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
              fontSize: 60,
              fontWeight: FontWeight.w100
            ),
          ),
          Text(
            "EIN IDEALER MITSPIELER",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 13,
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

var smallBoldTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  fontFamily: "Montserrat",
);

var bigTextStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.w600,
  fontFamily: "Montserrat"
);

class Tags{
  static var schule = Tag(tag: "Schule", icon: Icons.school, color: Colors.lightBlue[300],);
  static var informatik = Tag(tag: "Informatik", icon: Icons.data_usage, color: Colors.lightGreen[300],);
  static var sprachen = Tag(tag: "Sprachen", icon: Icons.translate, color: Colors.orange[300],);
  static var projekte = Tag(tag: "Projekte", icon: Icons.star, color: Colors.pink[300],);

  static var tags = [schule, informatik, sprachen, projekte];

  static void activate(String tag){
    tags.forEach((element) {
      if(element.tag != tag) element.activated = false;
      else element.activated = true;
    });
  }

  static Tag getActivated(){
    tags.forEach((element) {
      if(element.activated) return element;
    });
    return null;
  }
}

class Tag extends StatefulWidget{
  Color color;
  String tag;
  IconData icon;
  bool activated;

  Tag({this.activated = true, this.color, this.icon = Icons.home, this.tag = "Beispiel"}){
    if(color == null) color = Colors.grey[300];
  }

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    final activateChange = Provider.of<ChangeActivation>(context);
    return Consumer<ChangeActivation>(

      builder: (context, x, _) => GestureDetector(
        onTap: (){
          Tags.activate(widget.tag); activateChange.update();
        },
        child: Center(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.activated ? widget.color : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: widget.activated ? Colors.transparent : widget.color)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Row(
                    children: [
                      Icon(widget.icon, size: 10, color: widget.activated ? Colors.white : widget.color,),
                      SizedBox(width: 4),
                      Text(
                        widget.tag,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: "Montserrat",
                          color: widget.activated ? Colors.white : widget.color,
                          fontSize: 11
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeActivation extends ChangeNotifier{
  void update(){
    notifyListeners();
  }
}


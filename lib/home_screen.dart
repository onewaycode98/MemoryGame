import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_app/data/data.dart';
import 'size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    pairs = getPairs();
    pairs.shuffle();

    visiblePairs = pairs;
    selected = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        visiblePairs = getQuestions();
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFfefefe),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 7,
              vertical: SizeConfig.blockSizeVertical * 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Memory Game',
                    style: TextStyle(
                        color: Color(0xFF212529),
                        fontSize: SizeConfig.blockSizeHorizontal * 7,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '$movesCounter Moves',
                        style: TextStyle(
                            color: Color(0xFF212529),
                            fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.redo,
                                color: Color(0xFF212529),
                                size: SizeConfig.blockSizeVertical * 2,
                              ),
                              onPressed: () {
                                movesCounter = 0;
                                score = 0;
                                pairs = getPairs();
                                pairs.shuffle();

                                visiblePairs = pairs;
                                selected = true;
                                Future.delayed(const Duration(seconds: 0), () {
                                  setState(() {
                                    visiblePairs = getQuestions();
                                    selected = false;
                                  });
                                });
                              }),
                          SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                          Text(
                            'Score: $score/120',
                            style: TextStyle(
                                color: Color(0xFF212529),
                                fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 7,
                    bottom: SizeConfig.blockSizeVertical * 7,
                    left: SizeConfig.blockSizeHorizontal * 2.5,
                    right: SizeConfig.blockSizeHorizontal * 2.5),
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeVertical * 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                      Color(0xFF7F7FD5),
                      Color(0xFF86A8E7),
                      Color(0xFF91EAE4)
                    ])),
                child: score != 120
                    ? GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing:
                              SizeConfig.blockSizeHorizontal * 3.5,
                          mainAxisSpacing: SizeConfig.blockSizeVertical * 3.5,
                        ),
                        children: List.generate(visiblePairs.length, (index) {
                          return Tile(
                            color: visiblePairs[index].getColor(),
                            icon: visiblePairs[index].getIcon(),
                            parent: this,
                            tileIndex: index,
                          );
                        }),
                      )
                    : Card(
                        child: Column(
                        children: <Widget>[
                          SizedBox(height: SizeConfig.blockSizeVertical * 4),
                          Image(
                            image: AssetImage('images/puchar.jpg'),
                            width: SizeConfig.blockSizeHorizontal * 50,
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Text(
                            'Congratulations!',
                            style: TextStyle(
                                color: Color(0xFF212529),
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 1),
                          Text(
                            'You made: $movesCounter moves!',
                            style: TextStyle(
                                color: Color(0xFF212529),
                                fontSize: SizeConfig.blockSizeHorizontal * 4,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 4),
                          RaisedButton(
                            color: Color(0xFF91EAE4),
                            onPressed: () {
                              setState(() {
                                score = 0;
                                movesCounter = 0;
                                pairs = getPairs();
                                pairs.shuffle();

                                visiblePairs = pairs;
                                selected = true;
                                Future.delayed(const Duration(seconds: 2), () {
                                  setState(() {
                                    visiblePairs = getQuestions();
                                    selected = false;
                                  });
                                });
                              });
                            },
                            child: Text(
                              'Play again',
                              style: TextStyle(
                                  color: Color(0xFF212529),
                                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  int tileIndex;
  Color color;
  IconData icon;
  _HomeScreenState parent;
  Tile({this.color, this.parent, this.tileIndex, this.icon});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: () {
        if (!selected) {
          if (selectedIcon != null) {
            if (selectedIcon == pairs[widget.tileIndex].getIcon()) {
              //correct

              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                movesCounter = movesCounter + 1;
                score = score + 20;

                setState(() {});
                selected = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setColor(null);
                  pairs[selectedTileIndex].setColor(null);
                });
                selectedIcon = null;
              });
            } else {
              //wrong

              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                movesCounter = movesCounter + 1;
                selected = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
                selectedIcon = null;
              });
            }
          } else {
            selectedTileIndex = widget.tileIndex;
            selectedIcon = pairs[widget.tileIndex].getIcon();
          }

          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
        }
      },
      child: Container(
        height: 90.0,
        width: 90.0,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: pairs[widget.tileIndex].getColor() != null
                ? pairs[widget.tileIndex].getIsSelected()
                    ? pairs[widget.tileIndex].getColor()
                    : widget.color
                : Color(0xFF62CDBB)),
        child: IconButton(
            icon: FaIcon(
              pairs[widget.tileIndex].getIsSelected()
                  ? pairs[widget.tileIndex].getIcon()
                  : widget.icon,
              color: Colors.white,
              size: SizeConfig.blockSizeVertical * 3,
            ),
            onPressed: null),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:trabalho_final_dadm/games/memory/data/data.dart';
import 'package:trabalho_final_dadm/games/memory/models/TileModel.dart';

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  List<TileModel> gridViewTiles = [];
  List<TileModel> questionPairs = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    reStart();
  }
  void reStart() {

    myPairs = getPairs();
    myPairs.shuffle();
    points = 0;

    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        print("2 seconds done");
        // Here you can write your code for open new view
        questionPairs = getQuestionPairs();
        gridViewTiles = questionPairs;
        selected = false;
        loading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              points != 800 ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$points/800",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Pontos",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ) : Container(),
              SizedBox(
                height: 20,
              ),
              points != 800 ? GridView(
                shrinkWrap: true,
                //physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 0.0, maxCrossAxisExtent: 75.0),
                children: List.generate(gridViewTiles.length, (index) {
                  return Tile(
                    imagePathUrl: gridViewTiles[index].getImageAssetPath(),
                    tileIndex: index,
                    parent: this,
                  );
                }),
              ) : Container(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            points = 0;
                            reStart();
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text("Replay", style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          // TODO
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue,
                                width: 2
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text("Rate Us", style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}



class Tile extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _MemoryGameState parent;

  Tile({this.imagePathUrl, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState(parent);
}

class _TileState extends State<Tile> {
  _MemoryGameState parent;
  _TileState(this.parent);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (parent.loading) return;
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// testing if the selected tiles are same
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {
              print("add point");
              points = points + 100;
              print(selectedTile + " thishis" + widget.imagePathUrl);

              TileModel tileModel = new TileModel();
              print(widget.tileIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = tileModel;
                print(selectedIndex);
                myPairs[selectedIndex] = tileModel;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              print(selectedTile +
                  " thishis " +
                  myPairs[widget.tileIndex].getImageAssetPath());
              print("wrong choice");
              print(widget.tileIndex);
              print(selectedIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""

            ? ClipOval(child: Image.asset(myPairs[widget.tileIndex].getIsSelected()
            ? myPairs[widget.tileIndex].getImageAssetPath()
            : widget.imagePathUrl))
            : Container(
          color: Colors.white,
          child: Image.asset("assets/games/memory/correct.png"),
        ),
      ),
    );
  }
}
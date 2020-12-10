import 'package:art/bloc/artBloc.dart';
import 'package:art/main.dart';
import 'package:art/models/artModel.dart';
import 'package:art/screens/artDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class artList extends StatefulWidget {
  List<ArtObjects> art;
  artList(this.art);
  @override
  _artListState createState() => _artListState(this.art);
}

class _artListState extends State<artList> {
  final List<ArtObjects> art;
  _artListState(this.art);

  _removeart(int index) {
    setState(() {
      art.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final artBlocObject = BlocProvider.of<artBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              artBlocObject.add(Resetart());
            },
            icon: Icon(Icons.search)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.7],
                colors: [const Color(0xFF141e30), const Color(0xFF243b55)])),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.bottomCenter,
                  children: getCardWidegts(art, context),
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*
                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape:BoxShape.circle
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:15,bottom:10.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape:BoxShape.circle
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:15,bottom:10.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape:BoxShape.circle
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search)),
                            ),
                          )*/
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getCardWidegts(List<ArtObjects> tmp, BuildContext context) {
    List listings = new List<Widget>();

    for (int j = 0; j < tmp.length; j++) {
      listings.add(Positioned(
          top: j * 15.toDouble(),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => artDetails(tmp[j])));
            },
            child: Draggable(
              onDragEnd: (drag) {
                if (drag.offset.direction > 1) {
                  _removeart(j);
                }
              },
              childWhenDragging: Container(),
              child: Card(
                elevation: 2,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 300,
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(tmp[j].webImage.url),
                          fit: BoxFit.cover)),
                ),
              ),
              feedback: Card(
                elevation: 2,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 300,
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(tmp[j].webImage.url),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          )));
      /*
      listings.add(
        Positioned(
          top: j * 18.toDouble(),
          child: Card(
              color: Color.fromARGB(255 - j * 10, j * 10, 25 * j, j + j * 10),
              child: Container(
                color: Colors.transparent,
                child: Text("this is a title of the paint",
                            style: TextStyle(backgroundColor: Colors.transparent),
                )), 
            ),
          )
          
      );*/
    }
    return listings;
  }
}

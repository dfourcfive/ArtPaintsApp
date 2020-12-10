import 'package:art/bloc/artBloc.dart';
import 'package:art/screens/artList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    final artBlocObject = BlocProvider.of<artBloc>(context);
    var titleController = TextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.7],
              colors: [const Color(0xFF141e30), const Color(0xFF243b55)])),
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10.0),
        child: BlocBuilder<artBloc, artState>(
          builder: (context, state) {
            if (state is artIsNotSearched)
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100.0),
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white70,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Colors.white70, style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Colors.blue, style: BorderStyle.solid)),
                      hintText: "Art title",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed: () {
                        print(titleController.text);
                        artBlocObject.add(FetchartEvent(titleController.text));
                      },
                      color: Colors.lightBlue,
                      child: Text(
                        "Search",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),
                  )
                ],
              );
            else if (state is artIsLoading)
              return Center(child: CircularProgressIndicator());
            else if (state is artIsLoaded) {
              return artList(state.artPaints);
            } else if (state is artIsNotSearched) {
              return Center(
                  child: Text("smt buggy is happenning Fuck",
                      style: TextStyle(color: Colors.white)));
            } else
              return Center(
                  child: Text("Error loading , please check your network",
                      style: TextStyle(color: Colors.white)));
          },
        ),
      ),
    );
  }
}

/*

*/

import 'package:art/models/artModel.dart';
import 'package:flutter/material.dart';
class artDetails extends StatelessWidget {
  ArtObjects artObjects;

  artDetails(this.artObjects);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 400.0,
              stretch: true,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle
                ],
                  centerTitle: true,
                  title: Text(artObjects.principalOrFirstMaker,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      )),
                    background: Image.network(
                    artObjects.webImage.url,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(
          
        ),
      ),
    );
  }
}
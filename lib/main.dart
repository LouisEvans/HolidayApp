import 'package:flutter/material.dart';

class Landmark{
  String page;
  String title;
  String location;
  String image;
  String heroTag;

  Landmark(this.page,this.title,this.location,this.image,this.heroTag);
}

List<Landmark> landmarks = new List<Landmark>();

ListView landmarkCards(context){
  Landmark ponteVecchio = new Landmark("/PonteVecchio", "Ponte Vecchio","Florence","images/pontevecchio.jpg", "ponteVecchio");
  landmarks.add(ponteVecchio);
  Landmark duomo = new Landmark("/Duomo", "Duomo","Florence","images/duomo.jpg", "duomo");
  landmarks.add(duomo);

  List<Widget> landmarkWidgets = new List<Widget>();
  for(var i = 0; i < landmarks.length; i++) {
    landmarkWidgets.add(newCard(context, landmarks[i].page, landmarks[i].title, landmarks[i].location,
        landmarks[i].image, landmarks[i].heroTag));
  }
  return new ListView(scrollDirection: Axis.horizontal,
      children: landmarkWidgets);
}

void main(){
  runApp(new MaterialApp(
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        "/PonteVecchio": (BuildContext context) => new PonteVecchio(),
        "/Duomo": (BuildContext context) => new Duomo(),
      }
  ));
  //runApp(HomePage());
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(title: new Text("Holiday"), backgroundColor: Colors.blue,),
        backgroundColor: Colors.white,
        body: new Center(
            child: new ConstrainedBox(
              constraints: new BoxConstraints(
                maxHeight: 350
              ),
              child: landmarkCards(context)
              )
            ),
    );
  }
}

class PonteVecchio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Builder(builder:  (context) => Scaffold(
        appBar: new AppBar(title: new Text("Holiday"), backgroundColor: Colors.blue,),
        body: new Center(
          child: new Column(
              children:[
                Padding(padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Ponte Vecchio",
                  style: TextStyle(fontFamily: 'Montserrat',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      height: 0.85
                  ),
                )),
                Hero(
                  tag:'ponteVecchio',
                  child:
                  Image.asset(
                    "images/pontevecchio.jpg",
                  )
                )
              ]
          )
        )
    ));
  }
}

class Duomo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Builder(builder:  (context) => Scaffold(
        appBar: new AppBar(title: new Text("Holiday"), backgroundColor: Colors.blue,),
        body: new Center(
            child: new Column(
                children:[
                  Padding(padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Duomo",
                        style: TextStyle(fontFamily: 'Montserrat',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                            height: 0.85
                        ),
                      )),
                  Hero(
                      tag:'duomo',
                      child:
                      Image.asset(
                        "images/duomo.jpg",
                      )
                  )
                ]
            )
        )
    ));
  }
}

Widget newCard(BuildContext context, String page, String title, String location, String image, String heroTag){
  return new Padding(
      //padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0),
      child: new GestureDetector(
        onTap:(){
          //Navigator.of(context).pushNamed("/PonteVecchio");
          Navigator.of(context).pushNamed(page);
        },
          child: Container(
          height: 300.0,
          width: 200.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
              color: const Color(0xffffffff),
              boxShadow: [
                new BoxShadow(
                    color: const Color(0xffbbbbbb),
                    offset: new Offset(0.0, 10.0),
                    blurRadius: 20.0
                )
              ]
          ),
          child:
          new Column(
              children:[
                ClipRRect(
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(18.0),
                        topRight: const Radius.circular(18.0)),
                    child:
                        Hero(
                          tag:heroTag,
                          child:
                            Image.asset(
                              image,
                            )
                        )
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                title,
                                style: TextStyle(fontFamily: 'Montserrat',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w700,
                                    height: 0.85
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "\n"+location,
                                style: TextStyle(fontFamily: 'Montserrat',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          )
                        ]
                  )
              )
            ]
        )
    )
      ));
}
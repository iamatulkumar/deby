import 'dart:async';
import 'dart:math';
import 'package:deby/data/data.dart';
import 'package:deby/view/story_details_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return new Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.black,
            size: 32.0,
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20.0, // has the effect of softening the shadow
                            spreadRadius: 2.0,
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          ),
                        ],
                        color: Colors.white),
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  ClipOval(
                    child: Image.asset(
                      "images/three.jpg",
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome back, Mathew",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: "Product_Sans_Regular",
                        letterSpacing: 1.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "For you",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                        fontFamily: "Product_Sans_Bold",
                        letterSpacing: 1.0),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Top Picks",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                        fontFamily: "Product_Sans_Bold",
                        letterSpacing: 1.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            getCard(context),
            getCard(context),
            getCard(context)
          ],
        ),
      ),
    );
  }
}

Widget getCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StroryDetailsWidget()),
        );
      },
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              "images/one.jpg",
              fit: BoxFit.cover,
              height: 90,
              width: 90,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Design",
                style: TextStyle(
                    color: Color(0xff2e66e7),
                    fontFamily: "Product_Sans_Regular",
                    fontSize: 10.0,
                    height: 1.4),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 150,
                child: Text(
                  "A guide to interface design for older people.",
                  overflow: TextOverflow.ellipsis,
                  style:
                  TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: "Product_Sans_Bold"),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Cameron Chapman 40 mins ago",
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Color(0xff9b9b9b), fontSize: 12.0, fontFamily: "Product_Sans_Regular"),
              )
            ],
          )
        ],
      ),
    ),
  );
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 16.0;
  var verticalInset = 24.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeheight = height - 2 * padding;

        var heightOfPrimaryCard = safeheight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (int i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;
          var start =
              padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);
          print(images[i].toString());
          var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(color: Colors.black12, offset: Offset(3.0, 6.0), blurRadius: 10.0)
                  ]),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          images[i],
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 16.0),
                              Row(
                                children: <Widget>[
                                  SizedBox(width: padding + verticalInset * max(-delta, 0.0)),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFffffffff),
                                        borderRadius: BorderRadius.circular(20.0)),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                                        child: Text(
                                          "Design",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Product_Sans_Regular",
                                              fontSize: 12.0,
                                              height: 1.4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Basics of \nColour theory",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32.0,
                                        fontFamily: "Product_Sans_Bold"),
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  ClipOval(
                                    child: Image.asset(
                                      "images/three.jpg",
                                      fit: BoxFit.cover,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                                        child: Text(
                                          "Raj Krishnan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontFamily: "Product_Sans_Regular"),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                                        child: Text(
                                          "6 min ago",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontFamily: "Product_Sans_Regular"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

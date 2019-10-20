import 'package:flutter/material.dart';

class StroryDetailsWidget extends StatefulWidget {
  @override
  _StroryDetailsWidgetState createState() => _StroryDetailsWidgetState();
}

class _StroryDetailsWidgetState extends State<StroryDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.topLeft,
        children: <Widget>[
          Image.asset(
            "images/one.jpg",
            fit: BoxFit.cover,
            height: 280,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
                        color: Colors.black45),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 62,
                ),
                Container(
                  height: 24,
                  width: 72,
                  decoration: BoxDecoration(
                      color: Color(0xFFffffffff), borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
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
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Basics of \nColour theory",
                    style: TextStyle(
                        color: Colors.white, fontSize: 32.0, fontFamily: "Product_Sans_Bold"),
                  ),
                )
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0), topLeft: Radius.circular(16.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 16.0,
                    ),
                  ],
                  color: Color(0xfffafafa)),
              margin: EdgeInsets.only(top: 266),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 16.0,
                      ),
                      ClipOval(
                        child: Image.asset(
                          "images/image_one.jpg",
                          fit: BoxFit.cover,
                          height: 42,
                          width: 42,
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
                            child: Text(
                              "Raj Krishnan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "Product_Sans_Regular"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                            child: Text(
                              "Oct 16 3 Min Read",
                              style: TextStyle(
                                  color: Color(0xff9b9b9b),
                                  fontSize: 12.0,
                                  fontFamily: "Product_Sans_Regular"),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      '''Colour has long been used to influence sales. And come on, who hasn’t made a purchase just because they liked the colour the product came in? Shade associations are important and frequently used to reflect ideals and function in branding. For example, green — the colour of health, tranquility and nature — can be used in stores to relax customers. Orange and yellow encourage brightness and optimism, while blue — a popular colour, especially among men — promotes trust among more conservative
                          ''',
                      style: TextStyle(
                          height: 1.4,
                          color: Color(0xff464646),
                          fontSize: 18.0,
                          fontFamily: "Product_Sans_Regular"),
                    ),
                  )
                ],
              )),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 242, right: 32),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
                    Icons.bookmark_border,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height * .27,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.0), topLeft: Radius.circular(16.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20.0,
                      ),
                    ],
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            color: Color(0xffd8d8d8),
                            height: 5,
                            width: 80,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                          top: 16,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Read premium article.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontFamily: "Product_Sans_Bold"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                          top: 4,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Upgrade to premium in just 5\$/month.",
                            style: TextStyle(
                                color: Color(0xff9b9b9b),
                                fontSize: 14.0,
                                fontFamily: "Product_Sans_Regular"),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Upgrade Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontFamily: "Product_Sans_Bold"),
                              ),
                            ),
                            onPressed: (){},
                          ),
                        ),
                      )

                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

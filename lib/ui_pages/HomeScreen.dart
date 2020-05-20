import 'package:backdrop/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saltattire/constants/ColorsConstants.dart';
import 'package:saltattire/model/CategoryModel.dart';

final listItems = [
  new CategoryModel("Mask", "assets/catImage/1.jpg"),
  new CategoryModel("Mask Pack", "assets/catImage/2.jpg"),
  new CategoryModel("Waffle", "assets/catImage/3.jpg"),
  new CategoryModel("Cookie", "assets/catImage/4.jpg"),
  new CategoryModel("Black Swan", "assets/catImage/5.jpg"),
  new CategoryModel("Bambi", "assets/catImage/6.jpg"),
  new CategoryModel("Twinkle", "assets/catImage/7.jpg"),
  new CategoryModel("DustyRose", "assets/catImage/8.jpg"),
  new CategoryModel("Peach Naughat", "assets/catImage/10.jpg"),
];
final categoryItems = [
  new CategoryModel("Tops", "assets/cat/1.jpg"),
  new CategoryModel("Shirts", "assets/cat/2.jpg"),
  new CategoryModel("Tunics", "assets/cat/3.jpg"),
  new CategoryModel("Jumpsuits", "assets/cat/4.jpg"),
  new CategoryModel("Pants", "assets/cat/5.jpg"),
  new CategoryModel("Skirts", "assets/cat/6.jpg"),
  new CategoryModel("Dresses", "assets/cat/7.jpg"),
  new CategoryModel("Outerwear", "assets/cat/8.jpg"),
  new CategoryModel("Accessories", "assets/cat/9.jpg"),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BackdropScaffold(
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          splashColor: Colors.white,
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        )
      ],
      title: Text(
        "Salt Attire",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      animationCurve: Curves.bounceIn,
      frontLayerBorderRadius: BorderRadius.only(topRight: Radius.circular(45)),
      iconPosition: BackdropIconPosition.action,
      headerHeight: 120,
      backLayer: getbackLayer(),
      frontLayer: getFrontLayer(context),
    );
  }

  getFrontLayer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Top Picks",
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 35),
          ),
        ),
        newArrivalData(context),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Categories",
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 35),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: categoryItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    debugPrint("$index");
                  },
                  child: GridTile(
                    footer: Container(
                      height: 20,
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          "${categoryItems[index].name}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    child: Image.asset(categoryItems[index].imageUrl),
                  ),
                );
              }),
        )
      ],
    );
  }

  SizedBox newArrivalData(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 200,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor, width: 2),
                              borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(index % 2 != 0 ? 0 : 20),
                                  topRight:
                                      Radius.circular(index % 2 == 0 ? 0 : 20),
                                  bottomRight:
                                      Radius.circular(index % 2 == 0 ? 20 : 0),
                                  bottomLeft: Radius.circular(
                                      index % 2 != 0 ? 20 : 0))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(index % 2 != 0 ? 0 : 20),
                                topRight:
                                    Radius.circular(index % 2 == 0 ? 0 : 20),
                                bottomRight:
                                    Radius.circular(index % 2 == 0 ? 20 : 0),
                                bottomLeft:
                                    Radius.circular(index % 2 != 0 ? 20 : 0)),
                            child: Image.asset(
                              listItems[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 20,
                          right: 20,
                          child: Text(
                            "${listItems[index].name}",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ));
          }),
    );
  }

  Column getbackLayer() {
    return Column(
      children: <Widget>[
        InkWell(
          splashColor: Colors.white,
          onTap: () {},
          child: ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.white,
          onTap: () {},
          child: ListTile(
            leading: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            title: Text(
              "Shopping Orders",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/model/Cake.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey globalKey = GlobalKey();

  void _clickSearchButton() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amy's Cakes"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: _clickSearchButton,
          ),
        ],
      ),
      body: Column(
        children: [
          _titleView(context, "New Cakes"),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: (MediaQuery.of(context).size.width - 30) / 2,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: _myCakeListView(context)),
              ),
            ],
          ),
          _titleView(context, "Favorite Cakes"),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: _myGridView(context)),
          ),
        ],
      ),
    );
  }
}

Widget _myCakeListView(BuildContext context) {
  final cakes = List<Cake>.generate(
      10,
      (i) => Cake('Cake $i', '200.000 VND',
          'https://preppykitchen.com/wp-content/uploads/2019/06/Chocolate-cake-recipe-1200a.jpg'));
  return ListView.separated(
    separatorBuilder: (context, index) => Divider(
      indent: 10,
    ),
    itemCount: cakes.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, position) {
      Cake cake = cakes[position];
      return InkWell(
        onTap: () => tabNewCake(position),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(cake.image),
              ),
              Positioned(
                right: 0,
                child: Container(
                  color: Colors.red.withOpacity(0.6),
                  padding: EdgeInsets.all(3),
                  child: Text(
                    'New',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.deepPurple.withOpacity(0.8),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          cake.name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          cake.price,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _titleView(BuildContext context, String title) => Padding(
      padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.cake_rounded,
            color: Colors.deepPurple,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

Widget _myGridView(BuildContext context) {
  final cakes = List<Cake>.generate(
      10,
      (i) => Cake('Cake $i', '150.000 VND',
          'https://preppykitchen.com/wp-content/uploads/2019/06/Chocolate-cake-recipe-1200a.jpg'));
  double screenWidth = MediaQuery.of(context).size.width;
  double itemWidth = (screenWidth - 30) / 2;
  return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: cakes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: itemWidth / (itemWidth + 50)),
      itemBuilder: (BuildContext context, int index) {
        Cake cake = cakes[index];
        return InkWell(
          onTap: () => tabHotCake(index),
          child: Container(
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Stack(
                      children: [
                        Image(
                          image: NetworkImage(cake.image),
                          width: itemWidth,
                          height: itemWidth,
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            color: Colors.red.withOpacity(0.6),
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Hot',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.deepPurple.withOpacity(0.8),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text(
                                    cake.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    cake.price,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.deepPurple,
                          size: 30,
                        ),
                        Text(
                          'Add to cart',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

void tabNewCake(int position) {}

void tabHotCake(int position) {}

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pctrl = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 200.0,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/73/10/c0.jpg",
                  fit: BoxFit.cover,
                ),
                title: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Spacer(
                        flex: 3,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Your location",
                              style: TextStyle(fontSize: 10.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 14.0,
                                ),
                                Text(
                                  "Bali, Indonesia",
                                  style: TextStyle(fontSize: 17.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Container(
                        height: 30.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white24,
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0)
                            ],
                            borderRadius: BorderRadius.circular(20.0)),
                        margin: EdgeInsets.only(left: 80.0, right: 80.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                centerTitle: true,
              )),
          SliverList(
            delegate: SliverChildListDelegate([
              SideHeading(
                title: "Popular",
              ),
              PopularCollection(
                pctrl: pctrl,
              ),
              SideHeading(
                title: "Categories",
              ),
              CategoriesCards(
                pctrl: pctrl,
              ),
              SideHeading(
                title: "Popular",
              ),
              PopularCollection(
                pctrl: pctrl,
              ),
              SideHeading(
                title: "Categories",
              ),
              CategoriesCards(
                pctrl: pctrl,
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class SideHeading extends StatelessWidget {
  final String title;
  SideHeading({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "See All",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class PopularCollection extends StatelessWidget {
  final PageController pctrl;
  PopularCollection({this.pctrl});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220.0,
        child: PageView.builder(
          controller: pctrl,
          itemCount: 4,
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.thebackpackway.com/wp-content/uploads/2018/09/Leke-Leke-Bali-Waterfalls.jpg"),
                    fit: BoxFit.cover,
                  )),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "\$50",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Best of Bali Waterfalls",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )),
            );
          },
        ));
  }
}

class CategoriesCards extends StatelessWidget {
  final PageController pctrl;
  CategoriesCards({this.pctrl});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.0,
        child: PageView.builder(
          controller: pctrl,
          itemCount: 4,
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://i2.wp.com/www.artit-k.com/wp-content/uploads/2015/03/PaperColorMaterialDesign_Blue.png?fit=1920%2C1200"),
                    fit: BoxFit.cover,
                  )),
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Activity",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ))),
            );
          },
        ));
  }
}

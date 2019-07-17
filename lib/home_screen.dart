import 'package:flutter/material.dart';
import 'enum.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new PlaceHolderWidget(tab: HomeTab.MOVIES),
    new PlaceHolderWidget(tab: HomeTab.TV),
    new PlaceHolderWidget(tab: HomeTab.ACTOR),
    new PlaceHolderWidget(tab: HomeTab.MORE)
  ];

  BuildContext mcontext;
  final List<String> _titles = ["Movies","TV Shows", "Popular Actors"];

  @override
  Widget build(BuildContext context) {
    mcontext = context;
    final Drawer drawer = new Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              "Movie App",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                "T",
                style: TextStyle(fontSize: 35.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_movies),
            title: Text("Genre"),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
          Divider(
            color: Colors.black45,
            indent: 16.0,
          ),
          ListTile(
            title: Text("About Us"),
          ),
          ListTile(
            title: Text("Policy"),
          )
        ],
      ),
    );

    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              title: Text("Movie")
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              title: Text("TV")
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Actors")
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text("More")
          )
        ]
    );

    Scaffold scaffold = new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            _titles[_currentIndex > 2 ? _currentIndex - 1 : _currentIndex]
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      drawer: drawer,
      body: _children[_currentIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
    return scaffold;
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
      print(index.toString());
    });
    if (index == 3 ){
      Scaffold.of(mcontext).openDrawer();
    }
  }
}

class PlaceHolderWidget extends StatelessWidget {

  final HomeTab tab;

  PlaceHolderWidget({Key key, this.tab}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case HomeTab.MOVIES:
        return new MovieTab();
      case HomeTab.TV:
        return new TVShowTab();
      case HomeTab.ACTOR:
        return new ActorTab();
      case HomeTab.MORE:
        return new ActorTab();
    }
    return Container();
  }
}

class MovieTab extends StatelessWidget {
  const MovieTab({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = new List();

    tabs.add(Tab(text: "NEW",));
    tabs.add(Tab(text: "POPULAR",));
    tabs.add(Tab(text: "UPCOMING",));
    tabs.add(Tab(text: "TOP RATED",));
    tabs.add(Tab(text: "MOVIE BY YEARS",));

    final TabBar tabBar = new TabBar(
      isScrollable: true,
      indicatorColor: Colors.white,
      labelColor: Colors.white70,
      unselectedLabelColor: Colors.white,
      tabs: tabs,
      indicatorSize: TabBarIndicatorSize.tab,
    );

    final TabBarView tabBarView = new TabBarView(
      children: <Widget>[],
    );

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: new PreferredSize(
            child: Container(
              color: Colors.black,
              height: 50.0,
              child: tabBar,
            ),
            preferredSize: Size.fromHeight(50)
        ),
        body: tabBarView,
      ),
    );
  }
}

class TVShowTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ActorTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




import 'package:flutter/material.dart';
import 'package:flutter_app/resources/enum.dart';
import 'package:flutter_app/ui/movie/movie_tab_screen.dart';
import 'package:flutter_app/ui/tv/tv_tab_screen.dart';

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
          DrawerHeader(
              child: new Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset('images/logo.jpg',
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                    ),
                    new Text('The Movie App',
                      style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      ),
                    )
                  ],
                ),
              ),
            decoration: new BoxDecoration(
              color: Colors.black45
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

    tabs.add(Tab(text: "POPULAR",));
    tabs.add(Tab(text: "TOP RATED",));
    tabs.add(Tab(text: "UPCOMING",));
    tabs.add(Tab(text: "NOW PLAYING",));

    final TabBar tabBar = new TabBar(
      isScrollable: true,
      indicatorColor: Colors.white,
      labelColor: Colors.white70,
      unselectedLabelColor: Colors.white,
      tabs: tabs,
      indicatorSize: TabBarIndicatorSize.tab,
    );

    final TabBarView tabBarView = new TabBarView(
      children: <Widget>[
        new MovieTabScreen(movieApiType: MovieApiType.POPULAR),
        new MovieTabScreen(movieApiType: MovieApiType.TOP_RATED),
        new MovieTabScreen(movieApiType: MovieApiType.UPCOMING),
        new MovieTabScreen(movieApiType: MovieApiType.NOW_PLAYING),
      ],
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
  const TVShowTab({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = new List();

    tabs.add(Tab(text: "POPULAR",));
    tabs.add(Tab(text: "TOP RATED",));
    tabs.add(Tab(text: "ON TV",));
    tabs.add(Tab(text: "AIRING TODAY",));

    final TabBar tabBar = new TabBar(
      isScrollable: true,
      indicatorColor: Colors.white,
      labelColor: Colors.white70,
      unselectedLabelColor: Colors.white,
      tabs: tabs,
      indicatorSize: TabBarIndicatorSize.tab,
    );

    final TabBarView tabBarView = new TabBarView(
      children: <Widget>[
        new TvTabScreen(tvApiType: TvApiType.POPULAR),
        new TvTabScreen(tvApiType: TvApiType.TOP_RATED),
        new TvTabScreen(tvApiType: TvApiType.ON_THE_AIR),
        new TvTabScreen(tvApiType: TvApiType.AIRING_TODAY),
      ],
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

class ActorTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
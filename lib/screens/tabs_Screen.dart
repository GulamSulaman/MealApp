import 'package:flutter/material.dart';

import './category_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
// import '../dummy_data.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;

  void initState() {
    pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }

  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child:
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
      ),
      //   bottom: TabBar(
      //     tabs: <Widget>[
      //       Tab(
      //         icon: Icon(Icons.category),
      //         text: 'Categories',
      //       ),
      //       Tab(
      //         icon: Icon(Icons.favorite),
      //         text: 'Favorities',
      //       ),
      //     ],
      //   ),
      // ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'],
      // body: TabBarView(
      //   children: <Widget>[
      //     CategoryScreen(),
      //     FavoritesScreen(),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        selectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}

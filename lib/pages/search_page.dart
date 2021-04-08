import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quiero_dulces/objects/product.dart';
import 'package:quiero_dulces/pages/category_selected.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

class SearchPage extends StatefulWidget {
  static String id = 'search_page';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _filter = new TextEditingController();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Quiero Dulces');
  List<Product> items;
  List<Product> filteredItems;
  StreamSubscription<Event> _onProductAddedSubscription;
  StreamSubscription<Event> _onProductChangeSubscription;
  String _searchText;

  _SearchPageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredItems = items;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredItems = items;
        _filter.clear();
      }
    });
  }

  @override
  void initState() {
    items = [];
    filteredItems = [];
    _onProductAddedSubscription =
        productReference.onChildAdded.listen(_onProductAdded);
    _onProductChangeSubscription =
        productReference.onChildAdded.listen(_onProductUpdate);
    super.initState();
  }

  @override
  void dispose() {
    items.clear();
    _onProductAddedSubscription.cancel();
    _onProductChangeSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorRojo,
        title: _appBarTitle,
        leading: new IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ),
      drawer: LateralMenu(),
      body: Center(
        child: Text(
          'Proximamente, \nfunciones en desarrollo',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  void _onProductAdded(Event event) {
    setState(() {
      items.add(new Product.fromSnapShot(event.snapshot));
    });
  }

  void _onProductUpdate(Event event) {
    var oldProductValue =
        items.singleWhere((product) => product.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldProductValue)] =
          new Product.fromSnapShot(event.snapshot);
    });
  }

  // Widget _buildList() {
  //   if (!(_searchText.isEmpty)) {
  //     List tempList = [];
  //     for (int i = 0; i < filteredItems.length; i++) {
  //       if (filteredItems[i]
  //           .name
  //           .toLowerCase()
  //           .contains(_searchText.toLowerCase())) {
  //         tempList.add(filteredItems[i]);
  //       }
  //     }
  //     filteredItems = tempList;
  //   }
  //   return ListView.builder(
  //     itemCount: items == null ? 0 : filteredItems.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       return new ListTile(
  //         title: Text(filteredItems[index].name),
  //         onTap: () => print(filteredItems[index].name),
  //       );
  //     },
  //   );
  // }
}

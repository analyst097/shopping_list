import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/services/http.service.dart';
import 'package:shopping_list/widgets/new_item.dart';
import '../models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error;
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() {
    try {
      HttpService.getList().then((response) {
        if (response.statusCode >= 400) {
          _error = 'Failed to fetch data. Please try again.';
        }
        if (response.body == 'null') {
          setState(() {
            _isLoading = false;
          });
          return;
        }
        final Map<String, dynamic> listData = json.decode(response.body);
        final List<GroceryItem> loadedList = [];
        for (final item in listData.entries) {
          final category = categories.entries
              .firstWhere(
                  (element) => element.value.title == item.value['category'])
              .value;
          loadedList.add(GroceryItem.fromJson(item, category));
        }
        setState(() {
          _groceryItems = loadedList;
          _isLoading = false;
        });
      });
    } catch (error) {
      print(error);
    }
  }

  void addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));

    setState(() {
      _loadItems();
    });
  }

  void _removeItem(GroceryItem item) {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    HttpService.removeItem(item.id).then((response) => {
          if (response.statusCode >= 400)
            {
              setState(() {
                _groceryItems.insert(index, item);
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text("No items added."));

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) => Dismissible(
                onDismissed: (direction) {
                  _removeItem(_groceryItems[index]);
                },
                key: ValueKey(_groceryItems[index].id),
                child: ListTile(
                  title: Text(_groceryItems[index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: _groceryItems[index].category.color,
                  ),
                  trailing: Text(_groceryItems[index].quantity.toString()),
                ),
              ));
    }

    if (_error != null) {
      content = content = Center(child: Text(_error!));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Groceries list"),
          actions: [
            IconButton(onPressed: addItem, icon: const Icon(Icons.add))
          ],
        ),
        body: content);
  }
}

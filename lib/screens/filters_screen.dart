import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: const Text('Gluten-free', style: TextStyle(color: Colors.white),),
                    subtitle: const Text('Only include gluten-free meals.',style: TextStyle(color: Colors.white70),),
                    value: _glutenFree, 
                    onChanged: (newValue) {
                      setState(
                        () {
                          _glutenFree = newValue;
                        },
                      );
                    },),
    
                    SwitchListTile(
                    title: const Text('Lactose-free',style: TextStyle(color: Colors.white)),
                    subtitle: const Text('Only include Lactose-free meals.',style: TextStyle(color: Colors.white70)),
                    value: _lactoseFree, 
                    onChanged: (newValue) {
                      setState(
                        () {
                          _lactoseFree = newValue;
                        },
                      );
                    },),
    
                    SwitchListTile(
                    title: const Text('Vegetarian',style: TextStyle(color: Colors.white)),
                    subtitle: const Text('Only include vegetarian meals.',style: TextStyle(color: Colors.white70)),
                    value: _vegetarian, 
                    onChanged: (newValue) {
                      setState(
                        () {
                          _vegetarian = newValue;
                        },
                      );
                    },),
    
                    SwitchListTile(
                    title: const Text('Vegan',style: TextStyle(color: Colors.white)),
                    subtitle: const Text('Only include vegan meals.',style: TextStyle(color: Colors.white70)),
                    value: _vegan, 
                    onChanged: (newValue) {
                      setState(
                        () {
                          _vegan = newValue;
                        },
                      );
                    },),
                  
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

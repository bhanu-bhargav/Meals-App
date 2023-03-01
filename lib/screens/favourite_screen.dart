import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorite'),
      ),
      drawer: MainDrawer(),
      body: (favoriteMeals.isEmpty)? 
       const Center(
        child: Text('You have no favorites yet - start adding some!',style: TextStyle(color: Colors.white)),
      )
      :ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
          );
        },
        itemCount: favoriteMeals.length,
      )
    );
    
    }
  }

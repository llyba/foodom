import 'package:flutter/material.dart';
import 'package:foodom/screens/cartScreen.dart';
import 'package:foodom/screens/restaurantScreen.dart';
import 'package:foodom/services/data/data.dart';
import 'package:foodom/services/models/restaurant.dart';
import 'package:foodom/shared/ratingStars.dart';
import 'package:foodom/shared/recentOrders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantsList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantsList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: Colors.grey[200]),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Hero(
                      tag: restaurant.imageUrl,
                      child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          restaurant.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        RatingStars(rating: restaurant.rating),
                        SizedBox(height: 4),
                        Text(
                          restaurant.address,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '0.2 miles away',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(children: restaurantsList);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Food Delivery'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30,
            ),
            onPressed: () {},
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartScreen(),
                  ),
                );
              },
              child: Text(
                'Cart (${currentUser.cart.length})',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  hintText: 'Search Food or Restaurants',
                  prefixIcon: Icon(Icons.search, size: 30),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            RecentOrders(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Nearby Restaurants',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                _buildRestaurants(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

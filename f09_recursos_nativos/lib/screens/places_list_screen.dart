import 'dart:io';

import 'package:f09_recursos_nativos/provider/places_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_routes.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Meus Lugares', style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: Icon(Icons.add, color: Colors.white,),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<PlacesModel>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<PlacesModel>(
                child: Center(
                  child: Text('Nenhum local'),
                ),
                builder: (context, places, child) =>
                    places.itemsCount == 0
                        ? child!
                        : ListView.builder(
                            itemCount: places.itemsCount,
                            itemBuilder: (context, index) => ListTile(
                              title: Text(places.itemByIndex(index).title),
                              onTap: () {},
                            ),
                          ),
              ),
      ),
    );
  }
}

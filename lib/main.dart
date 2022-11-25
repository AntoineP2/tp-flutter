import 'package:flutter/material.dart';
import 'models/Habitation.dart';
import 'models/TypeHabitat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mes locations'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({required this.title, Key? key}) : super(key: key);
  var _TypeHabitats = [TypeHabitat(1,"Maison"), TypeHabitat(2, "Appartement")];
  //Habitation(this.id, this.image, this.libelle, this.chambres, this.superficie, this.prixmois);
  var _habitations = [
    Habitation(1 ,"image.png" ,"Maison Sud" ,"Rue 1" ,4 ,300 ,500),
    Habitation(2, "image.png", "Maison Nord", "Rue 2", 2, 65, 100),
    Habitation(3, "image.png", "Maison Est", "Rue 3", 3, 120, 200),
    Habitation(4, "image.png", "Appartement Sud", "Rue 4", 1, 35, 75),
    Habitation(5, "image.png", "Appartement Sud", "Rue 5", 5, 140, 130),
    Habitation(6, "image.png", "Appartement Sud", "Rue 6", 2, 50, 80),
  ];

  _buildTypeHabitat() {
    return Container(
      height: 100,
      child: Row(
        children: List.generate(
          _TypeHabitats.length,
            (index) => _buildHabitat(_TypeHabitats[index])
        )  
      ),
    );
  }

  _buildHabitat(TypeHabitat typeHabitat){
    var icon = Icons.house;
    switch (typeHabitat.id){
    // case 1: House
      case 2:
        icon = Icons.apartment;
        break;
      default:
        icon = Icons.home;
    }
    return Container(
      height: 80,
      child: Row(
        children:[Icon(icon), Text(typeHabitat.libelle)],
      ),
    );
  }


  _buildDerniereLocation(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        itemCount: _habitations.length,
        itemExtent: 220,
        itemBuilder: (context, index) =>
            _buildRow(_habitations[index], context),
        scrollDirection: Axis.horizontal,

      ),
    );
  }

  _buildRow(Habitation habitation,BuildContext context){
    return Container(
      width: 240,
      child: Column(
        children: [
          Image.asset(
            "assets/images/locations/${habitation.image}",
            fit: BoxFit.fitWidth,
          ),
          Text(habitation.libelle),
          Row(
            children:[
              Icon(Icons.location_on_outlined),
              Text(habitation.adresse),
            ],
          ),
          Text(habitation.prixmois.toString()),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            _buildTypeHabitat(),
            _buildDerniereLocation(context),
          ],
        ),
      ),
    );
  }
}

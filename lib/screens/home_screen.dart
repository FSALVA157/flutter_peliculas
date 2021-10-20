import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cine'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_off_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [CardSwiper(), MovieSlider()],
        ),
      ),
    );
  }
}
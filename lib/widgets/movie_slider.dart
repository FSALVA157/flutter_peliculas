import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;

  const MovieSlider({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _MoviePoster(
            peliculas: this.movies,
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final List<Movie> peliculas;

  const _MoviePoster({Key? key, required this.peliculas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: peliculas.length,
          itemBuilder: (BuildContext context, int indice) {
            return Container(
              width: 130.0,
              height: 190.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'details',
                          arguments: 'mensaje desde Movie Slider');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: FadeInImage(
                          placeholder: AssetImage('assets/loading.gif'),
                          image: NetworkImage(
                              'https://via.placeholder.com/300x400')),
                    ),
                  ),
                  Text(
                    'Starwars: el regreso del Jedi y el origen de las tribus primigeneas y creadores del multiverso',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            );
          }),
    );
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IterableProperty<Movie>('movies', movies));
  // }
}

import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return CustomScrollView(
      slivers: [
        _SliverAppBar(),
        SliverList(delegate: SliverChildListDelegate([_PosterYTitulo()]))
      ],
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 200.0,
        pinned: true,
        floating: false,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('movie.title'),
          background: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover),
        ));
  }
}

class _PosterYTitulo extends StatelessWidget {
  const _PosterYTitulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
                height: 250.0,
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/200x300')),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Movie.title',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  //style: Theme.of(context).textTheme.headline5,
                ),
                const Text(
                  'Movie.subtitle',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  //style: Theme.of(context).textTheme.headline5,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Movie.vote.average',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      //style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

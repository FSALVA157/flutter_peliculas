import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return CustomScrollView(
      slivers: [_SliverAppBar()],
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 200.0,
        pinned: true,
        floating: false,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('movie.title'),
          background: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: AssetImage('assets/loading.gif'),
              fit: BoxFit.cover),
        ));
  }
}

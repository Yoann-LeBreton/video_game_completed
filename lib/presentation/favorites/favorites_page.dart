import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_game_completed/presentation/favorites/cubits/favorite_video_games_cubit.dart';
import 'package:video_game_completed/presentation/favorites/cubits/favorite_video_games_state.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritesPage> {

  @override
  void initState() {
    super.initState();
    context.read<FavoriteVideoGameCubit>().getAllFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Favoris"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<FavoriteVideoGameCubit, FavoriteVideoGameState>(
        listener: _favoriteListener,
        child: Column(children: [],),
      ),
    );
  }

  void _favoriteListener(BuildContext context, FavoriteVideoGameState favoriteState){
    favoriteState.whenOrNull();
  }

}
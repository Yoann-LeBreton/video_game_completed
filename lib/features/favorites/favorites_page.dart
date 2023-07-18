import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_game_completed/features/common/domain/entities/favorites_entity.dart';
import 'package:video_game_completed/features/details/details_page.dart';
import 'package:video_game_completed/features/favorites/cubits/favorite_video_games_cubit.dart';
import 'package:video_game_completed/features/favorites/cubits/favorite_video_games_state.dart';
import 'package:video_game_completed/features/favorites/presentation/favorite_video_game_item.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritesPage> {
  FavoritesEntity _favorites = [];

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
        child: (_favorites.isEmpty)
            ? const Center(
                child: Text('No favorites'),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _favorites.length,
                itemBuilder: (context, index) => FavoriteVideoGameItem(
                      item: _favorites[index],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                              _favorites[index].name,
                              _favorites[index].remoteId),
                        ),
                      ),
                    )),
      ),
    );
  }

  void _favoriteListener(
      BuildContext context, FavoriteVideoGameState favoriteState) {
    favoriteState.whenOrNull(success: (FavoritesEntity favorites) {
      setState(() {
        _favorites = favorites;
      });
    });
  }
}

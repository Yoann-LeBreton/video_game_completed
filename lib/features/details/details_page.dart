import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_game_completed/core/constants/url_constants.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/features/details/cubits/details_video_game_cubit.dart';
import 'package:video_game_completed/features/details/cubits/details_video_game_state.dart';
import 'package:video_game_completed/features/favorites/cubits/favorite_video_games_cubit.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(this.gameName, this.remoteId, {super.key});

  final String gameName;
  final int remoteId;

  @override
  State<StatefulWidget> createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> {
  VideoGameWithIndivModel? _videoGameDetails;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => context
        .read<DetailsVideoGameCubit>()
        .getRemoteDetails(widget.remoteId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            <Widget>[
          SliverAppBar(
            title: Text(widget.gameName),
            pinned: false,
            snap: false,
            floating: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          )
        ],
        body: BlocListener<DetailsVideoGameCubit, DetailsVideoGameState>(
          listener: _detailsVideoGameListener,
          child: (_isLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (_videoGameDetails == null)
                  ? const Text('no data')
                  : Column(
                      children: <Widget>[
                        Image.network(
                          '${UrlConstants.howLongBeatBaseUrl}${UrlConstants.howLongBeatGameDetailPath}/${_videoGameDetails!.games.first.imageName}?width=200',
                          fit: BoxFit.fitHeight,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CircleAvatar(
                            radius: 40,
                            backgroundColor: _getProgressColor(
                                _videoGameDetails!.games.first.reviewScore ??
                                    0),
                            child: Text(
                              "${(_videoGameDetails!.games.first.reviewScore ?? 0 / 10)}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                shadows: [
                                  Shadow(
                                      // bottomLeft
                                      offset: const Offset(-1, -1),
                                      color: Colors.grey.shade400),
                                  Shadow(
                                      // bottomRight
                                      offset: const Offset(1, -1),
                                      color: Colors.grey.shade400),
                                  Shadow(
                                      // topRight
                                      offset: const Offset(1, 1),
                                      color: Colors.grey.shade400),
                                  Shadow(
                                      // topLeft
                                      offset: const Offset(-1, 1),
                                      color: Colors.grey.shade400),
                                ],
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            _videoGameDetails!.games.first.name,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text('Status'),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<FavoriteVideoGameCubit>()
                                      .insertFavorite(
                                        _videoGameDetails
                                                ?.games.first.remoteId ??
                                            0,
                                        _videoGameDetails?.games.first.name ??
                                            'untitled',
                                        _videoGameDetails
                                                ?.games.first.imageName ??
                                            '',
                                        0,
                                        null,
                                        VideoGameStatus.wishlisted,
                                      );
                                },
                                icon: Icon(Icons.favorite)),
                          ],
                        ),
                        if (_videoGameDetails?.games.first.platforms != null)
                          _platforms(),
                        const SizedBox(
                          height: 16,
                        ),
                        Wrap(
                          spacing: 12.0,
                          children: [
                            Text(
                                "Developer : ${_videoGameDetails!.games.first.developer}"),
                            Text(
                                "Publisher : ${_videoGameDetails!.games.first.publisher}"),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: Text(
                            _videoGameDetails!.games.first.summary,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  Color _getProgressColor(int score) {
    return switch (score) {
      > 0 && < 17 => Colors.red,
      >= 17 && < 34 => Colors.deepOrangeAccent,
      >= 35 && < 50 => Colors.orangeAccent,
      >= 52 && < 69 => Colors.yellow,
      >= 69 && < 85 => Colors.lightGreenAccent,
      >= 85 && <= 100 => Colors.green,
      _ => Colors.white,
    };
  }

  Widget _platforms() {
    final platforms =
        _videoGameDetails?.games.first.platforms?.split(',') ?? [];
    if (platforms.isNotEmpty) {
      return Wrap(
        children: platforms
            .map((p) => Chip(
                  label: Text(p),
                ))
            .toList(),
      );
    } else {
      return Container();
    }
  }

  void _detailsVideoGameListener(
      BuildContext context, DetailsVideoGameState detailsState) {
    setState(() {
      detailsState.whenOrNull(loading: () {
        _isLoading = true;
      }, success: (VideoGameWithIndivModel details) {
        _isLoading = false;
        _videoGameDetails = details;
      });
    });
  }
}

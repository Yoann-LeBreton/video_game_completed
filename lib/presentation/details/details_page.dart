import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_game_completed/core/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/presentation/details/cubits/details_video_game_cubit.dart';
import 'package:video_game_completed/presentation/details/cubits/details_video_game_state.dart';

import '../../core/utils/constants/url_constants.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.gameName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<DetailsVideoGameCubit, DetailsVideoGameState>(
        listener: _detailsVideoGameListener,
        child: (_isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : (_videoGameDetails == null)
                ? const Text('no data')
                : SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            _videoGameDetails!.games.first.name,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        Image.network(
                          '${UrlConstants.howLongBeatBaseUrl}${UrlConstants.howLongBeatGameDetailPath}/${_videoGameDetails!.games.first.imageName}?width=400',
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

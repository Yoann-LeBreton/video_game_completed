import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_game_completed/core/utils/enums/search_filter_enums.dart';

import 'package:video_game_completed/core/data/models/search_videogame_response.dart';
import 'package:video_game_completed/core/data/models/video_game_short_model.dart';
import 'package:video_game_completed/presentation/details/details_page.dart';
import 'package:video_game_completed/presentation/favorites/favorites_page.dart';
import 'package:video_game_completed/presentation/search/cubits/search_video_game_cubit.dart';
import 'package:video_game_completed/presentation/search/widgets/search_filter.dart';
import 'package:video_game_completed/presentation/search/widgets/search_video_game_item.dart';

import 'cubits/search_video_game_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.title});

  final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isLoading = false;
  bool _isLoadingNext = false;
  String _searchText = '';
  List<VideoGameShortModel> _games = [];
  SearchFilterSortBy _sortBySelected = SearchFilterSortBy.values.first;
  SearchFilterPlatform _platformSelected = SearchFilterPlatform.values.first;
  final ScrollController _resultScrollController = ScrollController();

  @override
  void initState() {
    _resultScrollController.addListener(_detectScrollFinish);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(),
                ));
          }, icon: Icon(Icons.star))
        ],
        
      ),
      body: BlocListener<SearchVideoGameCubit, SearchVideoGameState>(
        listener: _videoGameListener,
        child: Column(
          children: <Widget>[
            SearchBar(
              trailing: <Widget>[
                if (_searchText.isNotEmpty && _searchText.length >= 3)
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      _checkAndLaunchSearch();
                    },
                  )
              ],
              onChanged: (String text) {
                setState(() {
                  _searchText = text;
                  if (_searchText.length < 3) _games.clear();
                });
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _listFilter().length,
                itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: _listFilter()[index]),
              ),
            ),
            Expanded(
                child: (_isLoading)
                    ? const Center(child: CircularProgressIndicator())
                    : (_games.isEmpty)
                        ? const Center(child: Text('No Results'))
                        : ListView.builder(
                            controller: _resultScrollController,
                            shrinkWrap: true,
                            itemCount: _games.length,
                            itemBuilder: (context, index) =>
                                SearchVideoGameItem(
                                  item: _games[index],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                              _games[index].name,
                                              _games[index].remoteid),
                                        ));
                                  },
                                ))),
            (_isLoadingNext) ? const CircularProgressIndicator() : Container()
          ],
        ),
      ),
    );
  }

  void _videoGameListener(
      BuildContext context, SearchVideoGameState gameState) {
    setState(() {
      gameState.whenOrNull(loading: () {
        _isLoading = true;
      }, loadingNext: () {
        _isLoadingNext = true;
      }, success: (SearchVideogameResponse response) {
        _isLoading = false;
        _games = response.games;
      }, next: (SearchVideogameResponse response) {
        _isLoadingNext = false;
        _games.addAll(response.games);
      });
    });
  }

  void _checkAndLaunchSearch() {
    if (_searchText.length >= 3) {
      _games.clear();
      context
          .read<SearchVideoGameCubit>()
          .searchVideoGame(_searchText, _sortBySelected, _platformSelected);
    }
  }

  void _detectScrollFinish() {
    if (_resultScrollController.position.maxScrollExtent ==
        (_resultScrollController.position.pixels)) {
      final (int pageCurrent, int pageTotal) = context
              .read<SearchVideoGameCubit>()
              .state
              .whenOrNull(
                  success: (SearchVideogameResponse response) =>
                      (response.pageCurrent ?? 0, response.pageTotal ?? 0),
                  next: (SearchVideogameResponse response) =>
                      (response.pageCurrent ?? 0, response.pageTotal ?? 0)) ??
          (0, 0);
      if (pageCurrent < pageTotal) {
        context.read<SearchVideoGameCubit>().getNextResults(
            pageCurrent + 1, _searchText, _sortBySelected, _platformSelected);
      }
    }
  }

  List<SearchFilter> _listFilter() {
    return [
      SearchFilter(
          title: 'Sort by: ',
          enable: (!_isLoading && !_isLoadingNext),
          selected: _sortBySelected.title,
          items: SearchFilterSortBy.values
              .map((SearchFilterSortBy elem) => elem.title)
              .toList(),
          onChange: (String? value) {
            if (value != null) {
              SearchFilterSortBy item = SearchFilterSortBy.values
                  .firstWhere((element) => element.title == value);
              setState(() {
                _sortBySelected = item;
              });
              _checkAndLaunchSearch();
            }
          }),
      SearchFilter(
          title: 'Platform : ',
          enable: (!_isLoading && !_isLoadingNext),
          selected: _platformSelected.title,
          items: SearchFilterPlatform.values
              .map((SearchFilterPlatform elem) => elem.title)
              .toList(),
          onChange: (String? value) {
            if (value != null) {
              SearchFilterPlatform item = SearchFilterPlatform.values
                  .firstWhere((element) => element.title == value);
              setState(() {
                _platformSelected = item;
              });
              _checkAndLaunchSearch();
            }
          })
    ];
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/data/models/search_videogame_response.dart';
import 'package:video_game_completed/core/utils/enums/search_filter_enums.dart';
import 'package:video_game_completed/presentation/search/cubits/search_video_game_state.dart';
import 'package:video_game_completed/presentation/search/usecases/search_video_game_use_case.dart';


@injectable
class SearchVideoGameCubit extends Cubit<SearchVideoGameState> {
  SearchVideoGameCubit(this._searchVideoGameUseCase)
      : super(const SearchVideoGameState.initial());

  final SearchVideoGameUseCase _searchVideoGameUseCase;

  Future<void> searchVideoGame(String search, SearchFilterSortBy sortBy,
      SearchFilterPlatform platform) async {
    emit(const SearchVideoGameState.loading());
    final SearchVideogameResponse searchResult =
        await _searchVideoGameUseCase.execute(
            parameters: SearchVideoGameUseCaseParams(
                pageResult: 1,
                textSearch: search,
                sortBy: sortBy,
                platform: platform));
    emit(SearchVideoGameState.success(searchResult));
  }

  Future<void> getNextResults(int pageNumber, String search,
      SearchFilterSortBy sortBy, SearchFilterPlatform platform) async {
    emit(const SearchVideoGameState.loadingNext());
    final SearchVideogameResponse searchResult =
        await _searchVideoGameUseCase.execute(
            parameters: SearchVideoGameUseCaseParams(
                pageResult: pageNumber,
                textSearch: search,
                sortBy: sortBy,
                platform: platform));
    emit(SearchVideoGameState.next(searchResult));
  }
}

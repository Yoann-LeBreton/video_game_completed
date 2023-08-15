import 'package:flutter_test/flutter_test.dart';
import 'package:video_game_completed/core/enums/search_filter_enums.dart';

void main(){
  group('FilterSortBy get title', () {
    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.name', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.name;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Name');
    });


    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.timeMainStory', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.timeMainStory;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Main Story');
    });


    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.timeMainStoryAndExtra', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.timeMainStoryAndExtra;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Main Story + Extra');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.timeCompletionist', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.timeCompletionist;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Completionist');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.averageTime', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.averageTime;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Average Time');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.topRated', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.topRated;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Top Rated');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.mostPopular', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.mostPopular;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Most Popular');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.mostPlayed', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.mostPlayed;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Most Played');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.mostSpeedruns', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.mostSpeedruns;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Most Speedruns');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.releaseDate', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.releaseDate;

      final titleResult = typeSearchFilter.title;
      expect(titleResult, 'Release Date');
    });
  });

  group('FilterSortBy get queryCategory', () {
    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.name', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.name;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'name');
    });


    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.timeMainStory', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.timeMainStory;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'main');
    });


    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.timeMainStoryAndExtra', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.timeMainStoryAndExtra;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'mainp');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.timeCompletionist', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.timeCompletionist;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'comp');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.averageTime', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.averageTime;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'averagea');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.topRated', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.topRated;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'rating');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.mostPopular', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.mostPopular;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'popular');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.mostPlayed', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.mostPlayed;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'playing');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.mostSpeedruns', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.mostSpeedruns;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'speedruns');
    });

    test('test SearchFilterSortBy methods when type is SearchFilterSortBy.releaseDate', () async {
      const SearchFilterSortBy typeSearchFilter = SearchFilterSortBy.releaseDate;

      final titleResult = typeSearchFilter.queryCategory;
      expect(titleResult, 'release Date');
    });
  });
}
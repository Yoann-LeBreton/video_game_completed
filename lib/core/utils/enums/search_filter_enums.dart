
enum SearchFilterSortBy {
  name,
  timeMainStory,
  timeMainStoryAndExtra,
  timeCompletionist,
  averageTime,
  topRated,
  mostPopular,
  mostPlayed,
  mostSpeedruns,
  releaseDate
}

extension SearchFilterSortByExtension on SearchFilterSortBy {
  String get title {
    switch(this){
      case SearchFilterSortBy.name :
        return 'Name';
      case SearchFilterSortBy.timeMainStory :
        return 'Main Story';
      case SearchFilterSortBy.timeMainStoryAndExtra :
        return 'Main Story + Extra';
      case SearchFilterSortBy.timeCompletionist :
        return 'Completionist';
      case SearchFilterSortBy.averageTime :
        return 'Average Time';
      case SearchFilterSortBy.topRated :
        return 'Top Rated';
      case SearchFilterSortBy.mostPopular :
        return 'Most Popular';
      case SearchFilterSortBy.mostPlayed :
        return 'Most Played';
      case SearchFilterSortBy.mostSpeedruns :
        return 'Most Speedruns';
      case SearchFilterSortBy.releaseDate :
        return 'Release Date';
      default :
        return '---';
    }
  }

  String get queryCategory {
    switch(this){
      case SearchFilterSortBy.name :
        return 'name';
      case SearchFilterSortBy.timeMainStory :
        return 'main';
      case SearchFilterSortBy.timeMainStoryAndExtra :
        return 'mainp';
      case SearchFilterSortBy.timeCompletionist :
        return 'comp';
      case SearchFilterSortBy.averageTime :
        return 'averagea';
      case SearchFilterSortBy.topRated :
        return 'rating';
      case SearchFilterSortBy.mostPopular :
        return 'popular';
      case SearchFilterSortBy.mostPlayed :
        return 'playing';
      case SearchFilterSortBy.mostSpeedruns :
        return 'speedruns';
      case SearchFilterSortBy.releaseDate :
        return 'release Date';
      default :
        return '';
    }
  }
}

enum SearchFilterPlatform {
  all,
  emulated,
  nintendo3DS,
  nintendoSwitch,
  pc,
  playstation3,
  playstation4,
  playstation5,
  playstationNow,
  wiiU,
  xbox360,
  xboxOne,
  xboxSeriesXS
}

extension SearchFilterPlatformExtension on SearchFilterPlatform {
  String get title {
    switch(this){
      case SearchFilterPlatform.all : return 'All';
      case SearchFilterPlatform.emulated : return 'Emulated';
      case SearchFilterPlatform.nintendo3DS : return 'Nintendo 3DS';
      case SearchFilterPlatform.nintendoSwitch : return 'Nintendo Switch';
      case SearchFilterPlatform.pc : return 'PC';
      case SearchFilterPlatform.playstation3 : return 'Playstation 3';
      case SearchFilterPlatform.playstation4 : return 'Playstation 4';
      case SearchFilterPlatform.playstation5 : return 'Playstation 5';
      case SearchFilterPlatform.playstationNow : return 'Playstation Now';
      case SearchFilterPlatform.wiiU : return 'Wii U';
      case SearchFilterPlatform.xbox360 : return 'Xbox 360';
      case SearchFilterPlatform.xboxOne : return 'Xbox One';
      case SearchFilterPlatform.xboxSeriesXS : return 'Xbox Series X/S';
      default :
        return '---';
    }
  }

  String get queryCategory {
    switch(this){
      case SearchFilterPlatform.all : return '';
      case SearchFilterPlatform.emulated : return 'Emulated';
      case SearchFilterPlatform.nintendo3DS : return 'Nintendo 3DS';
      case SearchFilterPlatform.nintendoSwitch : return 'Nintendo Switch';
      case SearchFilterPlatform.pc : return 'PC';
      case SearchFilterPlatform.playstation3 : return 'Playstation 3';
      case SearchFilterPlatform.playstation4 : return 'Playstation 4';
      case SearchFilterPlatform.playstation5 : return 'Playstation 5';
      case SearchFilterPlatform.playstationNow : return 'Playstation Now';
      case SearchFilterPlatform.wiiU : return 'Wii U';
      case SearchFilterPlatform.xbox360 : return 'Xbox 360';
      case SearchFilterPlatform.xboxOne : return 'Xbox One';
      case SearchFilterPlatform.xboxSeriesXS : return 'Xbox Series X/S';
      default :
        return '---';
    }
  }
}
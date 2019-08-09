class TvResponse {
  int _page;
  List<Tv> _results = [];
  int _total_results;
  int _total_pages;

  TvResponse.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['pages'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<Tv> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Tv result = Tv(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Tv> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;

}

class Tv {
  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _name;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_name;
  List<int> _genre_ids = [];
  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;
  String _first_air_today;


  Tv(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _name = result['name'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_name = result['original_name'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
    _first_air_today = result['first_air_today'];
  }

  String get release_date => _release_date;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdrop_path => _backdrop_path;

  List<int> get genre_ids => _genre_ids;

  String get original_name => _original_name;

  String get original_language => _original_language;

  String get poster_path => _poster_path;

  double get popularity => _popularity;

  String get name => _name;

  get vote_average => _vote_average;

  bool get video => _video;

  int get id => _id;

  int get vote_count => _vote_count;
}

class TvImageResponse {
  int _id;
  List<TvImage> _backdrops = [];
  List<TvImage> _posters = [];

  TvImageResponse.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    List<TvImage> temp1 = [];
    for (int i = 0; i < parsedJson['backdrops'].length; i++) {
      TvImage image = TvImage(parsedJson['backdrops'][i]);
      temp1.add(image);
    }
    _backdrops = temp1;

    List<TvImage> temp2 = [];
    for (int i = 0; i < parsedJson['posters'].length; i++) {
      TvImage image = TvImage(parsedJson['posters'][i]);
      temp2.add(image);
    }
    _posters = temp2;
  }

  List<TvImage> get posters => _posters;
  List<TvImage> get backdrops => _backdrops;
  int get id => _id;

}

class TvImage{
  double _aspect_ratio;
  String _file_path;
  int _height;
  double _vote_average;
  int _vote_count;
  int _width;

  TvImage(parsedJson){
    _aspect_ratio = parsedJson['aspect_ratio'];
    _file_path = parsedJson['file_path'];
    _height = parsedJson['height'];
    _vote_average = parsedJson['vote_average'];
    _vote_count = parsedJson['vote_count'];
    _width = parsedJson['width'];
  }

  int get width => _width;
  int get vote_count => _vote_count;
  double get vote_average => _vote_average;
  int get height => _height;
  String get file_path => _file_path;
  double get aspect_ratio => _aspect_ratio;

  bool isPoster(){
    return width > height;
  }
}
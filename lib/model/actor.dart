class ActorResponse {
  int _page;
  int _totalResults;
  int _totalPages;
  List<Actor> _results;

  ActorResponse(
      {int page, int totalResults, int totalPages, List<Actor> results}) {
    this._page = page;
    this._totalResults = totalResults;
    this._totalPages = totalPages;
    this._results = results;
  }

  int get page => _page;

  int get totalResults => _totalResults;

  int get totalPages => _totalPages;

  List<Actor> get results => _results;

  ActorResponse.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    _totalResults = json['total_results'];
    _totalPages = json['total_pages'];
    if (json['results'] != null) {
      _results = new List<Actor>();
      json['results'].forEach((v) {
        _results.add(new Actor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this._page;
    data['total_results'] = this._totalResults;
    data['total_pages'] = this._totalPages;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Actor {
  double _popularity;
  int _id;
  String _profilePath;
  String _name;
  List<KnownFor> _knownFor;
  bool _adult;

  Actor(
      {double popularity,
        int id,
        String profilePath,
        String name,
        List<KnownFor> knownFor,
        bool adult}) {
    this._popularity = popularity;
    this._id = id;
    this._profilePath = profilePath;
    this._name = name;
    this._knownFor = knownFor;
    this._adult = adult;
  }

  double get popularity => _popularity;

  int get id => _id;

  String get profilePath => _profilePath;

  String get name => _name;

  List<KnownFor> get knownFor => _knownFor;

  bool get adult => _adult;

  Actor.fromJson(Map<String, dynamic> json) {
    _popularity = json['popularity'];
    _id = json['id'];
    _profilePath = json['profile_path'];
    _name = json['name'];
    if (json['known_for'] != null) {
      _knownFor = new List<KnownFor>();
      json['known_for'].forEach((v) {
        _knownFor.add(new KnownFor.fromJson(v));
      });
    }
    _adult = json['adult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this._popularity;
    data['id'] = this._id;
    data['profile_path'] = this._profilePath;
    data['name'] = this._name;
    if (this._knownFor != null) {
      data['known_for'] = this._knownFor.map((v) => v.toJson()).toList();
    }
    data['adult'] = this._adult;
    return data;
  }
}

class KnownFor {
  String _originalName;
  int _id;
  String _mediaType;
  String _name;
  int _voteCount;
  var _voteAverage;
  String _posterPath;
  String _firstAirDate;
  var _popularity;
  List<int> _genreIds;
  String _originalLanguage;
  String _backdropPath;
  String _overview;
  List<String> _originCountry=[];

  KnownFor(
      {String originalName,
        int id,
        String mediaType,
        String name,
        int voteCount,
        double voteAverage,
        String posterPath,
        String firstAirDate,
        double popularity,
        List<int> genreIds,
        String originalLanguage,
        String backdropPath,
        String overview,
        List<String> originCountry}) {
    this._originalName = originalName;
    this._id = id;
    this._mediaType = mediaType;
    this._name = name;
    this._voteCount = voteCount;
    this._voteAverage = voteAverage;
    this._posterPath = posterPath;
    this._firstAirDate = firstAirDate;
    this._popularity = popularity;
    this._genreIds = genreIds;
    this._originalLanguage = originalLanguage;
    this._backdropPath = backdropPath;
    this._overview = overview;
    this._originCountry = originCountry;
  }

  String get originalName => _originalName;

  int get id => _id;

  String get mediaType => _mediaType;

  String get name => _name;

  int get voteCount => _voteCount;

  double get voteAverage => _voteAverage;

  String get posterPath => _posterPath;

  String get firstAirDate => _firstAirDate;

  double get popularity => _popularity;

  List<int> get genreIds => _genreIds;

  String get originalLanguage => _originalLanguage;

  String get backdropPath => _backdropPath;

  String get overview => _overview;

  List<String> get originCountry => _originCountry;

  KnownFor.fromJson(Map<String, dynamic> json) {
    _originalName = json['original_name'];
    _id = json['id'];
    _mediaType = json['media_type'];
    _name = json['name'];
    _voteCount = json['vote_count'];
    _voteAverage = json['vote_average'];
    _posterPath = json['poster_path'];
    _firstAirDate = json['first_air_date'];
    _popularity = json['popularity'];
    _genreIds = json['genre_ids'].cast<int>();
    _originalLanguage = json['original_language'];
    _backdropPath = json['backdrop_path'];
    _overview = json['overview'];

    List<String> temp = new List();
    if(json['origin_country']!=null){
      json['origin_country'].forEach((v) {
        temp.add(v);
      });
    }
    _originCountry = temp;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this._originalName;
    data['id'] = this._id;
    data['media_type'] = this._mediaType;
    data['name'] = this._name;
    data['vote_count'] = this._voteCount;
    data['vote_average'] = this._voteAverage;
    data['poster_path'] = this._posterPath;
    data['first_air_date'] = this._firstAirDate;
    data['popularity'] = this._popularity;
    data['genre_ids'] = this._genreIds;
    data['original_language'] = this._originalLanguage;
    data['backdrop_path'] = this._backdropPath;
    data['overview'] = this._overview;
    data['origin_country'] = this._originCountry;
    return data;
  }
}

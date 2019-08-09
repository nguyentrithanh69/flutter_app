final String imageMoviePosterPlaceHolder = "images/movie_place_holder.png";
final String imageMovieBackDropPlaceHolder =
    "images/movie_backdrop_movie_place_holder.png";


final _apiKey = 'a2b2e1610a0b28fccdb2b3d74f805405';
final _host = 'http://api.themoviedb.org/3';

// Movie Api

final String popularApi = "$_host/movie/popular?api_key=$_apiKey";

final String topRatedApi = "$_host/movie/top_rated?api_key=$_apiKey";

final String upcomingApi = "$_host/movie/upcoming?api_key=$_apiKey";

final String nowPlayingApi = "$_host/movie/now_playing?api_key=$_apiKey";

String movieImageApi(int movieId) {
  return 'https://api.themoviedb.org/3/movie/$movieId/images?api_key=$_apiKey';
}

//Tv Api

final String tvPopularApi = "$_host/tv/popular?api_key=$_apiKey";

final String tvTopRatedApi = "$_host/tv/top_rated?api_key=$_apiKey";

final String tvOnTvApi = "$_host/tv/on_the_air?api_key=$_apiKey";

final String tvAiringTodayApi = "$_host/tv/airing_today?api_key=$_apiKey";

String tvImageApi(int tvId) {
  return 'https://api.themoviedb.org/3/tv/$tvId/images?api_key=$_apiKey';
}

//Actor Api

final String actorPopularApi = "$_host/person/popular?api_key=$_apiKey";
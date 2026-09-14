abstract class EndPoints {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = 'ea24b6bee60cf9a539ff25ccdf841295';
  static const String refreshToken = 'auth/refresh-token';
  // ================= MULTI ========================== //
  static const String trendingDay = 'trending/all/day';                                                     // Done
  static const String trendingWeek = 'trending/all/week';                                                     // Done
  
  // ================= MOVIES ========================== //
  static const String popularMovies = 'movie/popular';                                                     // Done
  static const String topRatedMovies = 'movie/top_rated';                                                  // Done
  static const String movieDetails = 'movie';                                                              // Done
  
  static const String movieCredits = 'movie/{movie_id}/credits';
  static const String movieReviews = 'movie/{movie_id}/reviews';
  static const String movieSimilar = 'movie/{movie_id}/similar';

  // ================= TV ========================== //
  static const String popularTv = 'tv/popular';                                                           // Done
  static const String topRatedTv = 'tv/top_rated';                                                        // Done
  static const String tvDetails = 'tv';                                                                   // Done
  
  static const String tvCase = 'tv/{tv_id}/credits';
  static const String tvReviews = 'tv/{tv_id}/reviews';
  static const String tvSimilar = 'tv/{tv_id}/similar';

  // ================= SEARCH ========================== //
  static const String searchMovie = 'search/movie';                                                        // Done
  static const String searchTv = 'search/tv';                                                              // Done
  static const String searchPerson = 'search/person';                                                      // Done
  static const String searchAll = 'search/multi';                                                          // Done

  // ================= DISCOVER ========================= //
  static const String discover = 'discover';                                    
  static const String genre = 'genre';                                    
  static const String language = 'configuration/languages';                                    
  static const String country = 'configuration/countries';                                    
  // ================= PERSON ========================= //
  static const String personDetails = 'person';
  static const String personDetailss = 'person/{person_id}/combined_credits';  // movies , tv or any thing he show in
  static const String personDetailsMovie = 'person/{person_id}/movie_credits'; // movies he show in
  static const String personDetailsTv = 'person/{person_id}/tv_credits';    // tvs he show in
  
}

abstract class APIKeys {
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer ';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String language = 'Accept-Language';
  static const String message = 'message';
  static const String status = 'status';
}

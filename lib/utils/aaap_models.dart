import 'package:json_annotation/json_annotation.dart';


part 'aaap_models.g.dart';


@JsonSerializable()
class FeatureRes extends Base{
  bool Status;
  String Message;
  @JsonKey(name : "Banners")
  List<MovieM> banners;

  @JsonKey(name : "HomeList")
  List<HomeList> homeList;



  FeatureRes({
    this.Status,
    this.Message,
    this.banners
  });


  factory FeatureRes.fromJson(Map<String, dynamic> json) =>
      _$FeatureResFromJson(json);



  static FeatureRes buildErr(int Errcode, {String message}){
    FeatureRes res_d = FeatureRes();
    Base _b = res_d.buildError(Errcode, message: message);
    return res_d..Message = _b.Message..Status = _b.Status..is_loading = _b.is_loading;
  }

}

@JsonSerializable()
class HomeList{
  final String title;
  @JsonKey(name : "MovieList")
  List<MovieM> movieList;


  HomeList({
    this.title,
    this.movieList
  });


  factory HomeList.fromJson(Map<String, dynamic> json) =>
      _$HomeListFromJson(json);


}



@JsonSerializable()
class MovieM{
  final int id;
  final String vote_count;
  final String mdb_id;
  final String video;
  final String vote_average;
  final String title;
  final String original_title;
  final String popularity;
  final String poster_path;
  final String overview;
  final String backdrop_path;
  final String release_date;

  MovieM({

   this.id,
   this.vote_count,
   this.mdb_id,
   this.video,
   this.vote_average,
   this.title,
   this.original_title,
   this.popularity,
   this.poster_path,
   this.overview,
   this.backdrop_path,
   this.release_date,
});
  factory MovieM.fromJson(Map<String, dynamic> json) =>
      _$MovieMFromJson(json);

}

class Base{


  bool Status;
  String Message;
  bool is_loading;


  Base({this.Status,this.Message,this.is_loading});

  Base buildError(int Errcode, {String message}){

    var _h = Base()
      ..Status = false
      ..is_loading = false;
    switch (Errcode){
      case 0:
        return _h..Message = 'Failed to connect server Error Details: ${message}' ;
      case 1:
        return _h..Message = 'Check your internet connection';
      case 2:
        return _h..Message = 'Row and Columns of the seats are not equal';
      default:
        return _h..Message = 'HTTP: Status Code ${Errcode}';
    }

  }

}





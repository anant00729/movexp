// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aaap_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureRes _$FeatureResFromJson(Map<String, dynamic> json) {
  return FeatureRes(
      Status: json['Status'] as bool,
      Message: json['Message'] as String,
      banners: (json['Banners'] as List)
          ?.map((e) =>
              e == null ? null : MovieM.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..is_loading = json['is_loading'] as bool
    ..homeList = (json['HomeList'] as List)
        ?.map((e) =>
            e == null ? null : HomeList.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FeatureResToJson(FeatureRes instance) =>
    <String, dynamic>{
      'is_loading': instance.is_loading,
      'Status': instance.Status,
      'Message': instance.Message,
      'Banners': instance.banners,
      'HomeList': instance.homeList
    };

HomeList _$HomeListFromJson(Map<String, dynamic> json) {
  return HomeList(
      title: json['title'] as String,
      movieList: (json['MovieList'] as List)
          ?.map((e) =>
              e == null ? null : MovieM.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeListToJson(HomeList instance) =>
    <String, dynamic>{'title': instance.title, 'MovieList': instance.movieList};

MovieM _$MovieMFromJson(Map<String, dynamic> json) {
  return MovieM(
      id: json['id'] as int,
      vote_count: json['vote_count'] as String,
      mdb_id: json['mdb_id'] as String,
      video: json['video'] as String,
      vote_average: json['vote_average'] as String,
      title: json['title'] as String,
      original_title: json['original_title'] as String,
      popularity: json['popularity'] as String,
      poster_path: json['poster_path'] as String,
      overview: json['overview'] as String,
      backdrop_path: json['backdrop_path'] as String,
      release_date: json['release_date'] as String);
}

Map<String, dynamic> _$MovieMToJson(MovieM instance) => <String, dynamic>{
      'id': instance.id,
      'vote_count': instance.vote_count,
      'mdb_id': instance.mdb_id,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'title': instance.title,
      'original_title': instance.original_title,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'overview': instance.overview,
      'backdrop_path': instance.backdrop_path,
      'release_date': instance.release_date
    };

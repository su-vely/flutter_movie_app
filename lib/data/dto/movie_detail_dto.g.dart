part of 'movie_detail_dto.dart';

MovieDetailDto _$MovieDetailDtoFromJson(Map<String, dynamic> json) =>
    MovieDetailDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      tagline: json['tagline'] as String?,
      releaseDate: json['release_date'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      revenue: (json['revenue'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompanyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailDtoToJson(MovieDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'tagline': instance.tagline,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'budget': instance.budget,
      'revenue': instance.revenue,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'genres': instance.genres,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
    };

GenreDto _$GenreDtoFromJson(Map<String, dynamic> json) => GenreDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenreDtoToJson(GenreDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ProductionCompanyDto _$ProductionCompanyDtoFromJson(
        Map<String, dynamic> json) =>
    ProductionCompanyDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logoPath: json['logo_path'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyDtoToJson(
        ProductionCompanyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_path': instance.logoPath,
    };

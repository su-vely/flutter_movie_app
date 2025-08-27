import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailDto {
  final int id;
  final String? title;
  final String? overview;
  final String? tagline;
  final String? releaseDate;
  final int? runtime;
  final int? budget;
  final int? revenue;
  final double? popularity;
  final double? voteAverage;
  final int? voteCount;
  final List<GenreDto>? genres;
  final String? posterPath;
  final List<ProductionCompanyDto>? productionCompanies;

  MovieDetailDto({
    required this.id,
    this.title,
    this.overview,
    this.tagline,
    this.releaseDate,
    this.runtime,
    this.budget,
    this.revenue,
    this.popularity,
    this.voteAverage,
    this.voteCount,
    this.genres,
    this.posterPath,
    this.productionCompanies,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreDto {
  final int? id;
  final String? name;

  GenreDto({this.id, this.name});

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenreDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompanyDto {
  final int? id;
  final String? name;
  final String? logoPath;

  ProductionCompanyDto({this.id, this.name, this.logoPath});

  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyDtoToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'movie_detail_dto.dart';

part 'movie_response_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponseDto {
  final int? page;
  final List<MovieDetailDto>? results;
  final int? totalResults;
  final int? totalPages;

  MovieResponseDto({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseDtoToJson(this);
}

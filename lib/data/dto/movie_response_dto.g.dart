part of 'movie_response_dto.dart';

MovieResponseDto _$MovieResponseDtoFromJson(Map<String, dynamic> json) =>
    MovieResponseDto(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDetailDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['total_results'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieResponseDtoToJson(MovieResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };

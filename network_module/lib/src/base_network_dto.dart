abstract class BaseRequestDTO {
  Map<String, dynamic> toJson();
}

abstract class BaseResponseDTO<E> {
  fromJson(Map<String, dynamic> json);

  E toEntity();
}

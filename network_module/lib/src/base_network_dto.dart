abstract class BaseNetworkDTO<T> {
  T fromJson(Map<String, dynamic> json);

  List<T> toJson();
}

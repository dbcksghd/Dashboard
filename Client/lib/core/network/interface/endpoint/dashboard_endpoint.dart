import 'package:client/core/network/interface/endpoint/dasboard_rest_api_domain.dart';
import 'package:client/core/network/interface/endpoint/dashboard_request_options.dart';

abstract class DashboardEndpoint extends DashboardRequestOptions {
  String get path;

  DashboardRestAPIDomain get domain;

  Map<int, Error> get errorMap;

  @override
  String get baseUrl => "http://localhost:8080$path";

  @override
  Map<String, String> headers = {'Content-Type': 'application/json'};
}

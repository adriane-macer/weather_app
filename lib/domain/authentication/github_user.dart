import 'package:weather_app/domain/authentication/user.dart';

class GithubUser extends User {
  final String url;

  GithubUser(String name, this.url) : super(name);

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      GithubUser(json['name'] as String, json['url'] as String);

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

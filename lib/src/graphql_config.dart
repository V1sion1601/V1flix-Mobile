import 'package:app/src/utils/check_version.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// final String? uri = checkVersion() ? dotenv.env["DEVELOPMENT_API"]  : dotenv.env["LOCAL_API"];
final String uri = checkVersion() ? "https://v1fix-be-gql.onrender.com/graphql" : "http://10.0.2.2:3306/graphql";
class GraphQLConfig {
  static HttpLink httpLink = HttpLink(uri);
  GraphQLClient clientToQuery() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}

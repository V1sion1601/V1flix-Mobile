import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink("https://v1fix-be-gql.onrender.com/graphql");
  GraphQLClient clientToQuery() => GraphQLClient(link: httpLink, cache: GraphQLCache());
}
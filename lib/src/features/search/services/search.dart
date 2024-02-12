import 'package:app/src/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:app/src/models/series.dart';
class ListResultService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();
  Future<List<Series>> getResult({required String keyword}) async {
    try {
      QueryResult result = await client.query(
          QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
          query series(\$title: String!) {
              findSeries(title: \$title, numOfLimit: 0) {
                  _id
                  title {
                    main_title
                    alt_title
                  }
                  images {
                    _id
                    type
                    source
                  }
              }
          }
          """), variables: {"title": keyword}));
      if (result.hasException) {
        throw Exception(result.exception);
      }
      List? res = result.data?["findSeries"];

      if (res == null || res.isEmpty) return [];
      List<Series> listResults =
      res.map((series) => Series.fromMap(map: series)).toList();

      return listResults;
    } catch(error) {
      throw Exception(error);
    }
  }
}
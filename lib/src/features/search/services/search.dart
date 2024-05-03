import 'package:app/src/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:app/src/models/series.dart';

class ListResultService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<Genres>> getGenres() async {
    try {
      QueryResult result = await client.query(
          QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
          {
            genres {
              _id
              name
            }
          }
          """)));
      if (result.hasException) {
        throw Exception(result.exception);
      }
      List? res = result.data?["genres"];
      print("Rest: ");
      print(res);
      if (res == null || res.isEmpty) return [];
      List<Genres> listGenres = res.map((genre) => Genres.fromMap(genre: genre)).toList();

      return listGenres;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<List<Series>> getResult({required String keyword, required String genresId}) async {
    try {
      QueryResult result = await client.query(
          QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
          query series(\$title: String!, \$genresId: String!) {
              findSeries(title: \$title, numOfLimit: 0, genresId: \$genresId) {
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
                  genres {
                    _id
                    name
                  }
              }
          }
          """), variables: {"title": keyword, "genresId": genresId}));
      if (result.hasException) {
        throw Exception(result.exception);
      }
      List? res = result.data?["findSeries"];

      if (res == null || res.isEmpty) return [];
      List<Series> listResults =
          res.map((series) => Series.fromMap(map: series)).toList();

      return listResults;
    } catch (error) {
      throw Exception(error);
    }
  }
}

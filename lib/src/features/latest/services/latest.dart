import 'package:app/src/graphql_config.dart';
import 'package:app/src/models/episodes.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ListLatestEpisodes {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<Episode>> getLatestEpisode() async {
    try {
      QueryResult result = await client.query(
        QueryOptions(document: gql(""" 
            query getLatest {
              episodes {
                episodes {
                  thumbnail
                  _id
                  title
                  epNum
                  source {
                     _id
                     kind
                     value  
                  }
                  series {
                    _id
                    title {
                      main_title
                    }
                  }
                }
              }
            }
        """)),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?["episodes"]["episodes"];

      if (res == null || res.isEmpty) return [];
      List<Episode> listLatest =
          res.map((episode) => Episode.fromMap(episodes: episode)).toList();

      return listLatest;
    } catch (error) {
      throw Exception(error);
    }
  }
}

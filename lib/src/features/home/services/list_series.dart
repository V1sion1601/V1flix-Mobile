import 'package:app/src/graphql_config.dart';
import 'package:app/src/models/series.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ListSeriesService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<Series>> getRecommendation() async {
    try {
      QueryResult result = await client.query(
        QueryOptions(document: gql(""" 
            query ListSeries {
              series {
                series {
                  _id
                  title {
                    main_title
                    alt_title
                  }
                  duration
                  total_episodes
                  type
                  status
                  view
                  images {
                    _id
                    type
                    source
                  }
                  updated_at
                }
              }
            }
        """)),
      );

      if(result.hasException) {
        throw Exception(result.exception);
      }


      List? res = result.data?["series"]["series"];

      if(res == null || res.isEmpty) return [];
      List<Series> listSeries = res.map((series) => Series.fromMap(map: series)).toList();

      return listSeries;
    } catch (error) {
      throw Exception(error);
    }
  }
}

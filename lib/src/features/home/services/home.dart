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
                  images {
                    _id
                    type
                    source
                  }
                }
              }
            }
        """)),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?["series"]["series"];

      if (res == null || res.isEmpty) return [];
      List<Series> listSeries =
          res.map((series) => Series.fromMap(map: series)).toList();

      return listSeries;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<List<Series>> getTopSeries() async {
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
                  avg_score
                  images {
                    _id
                    type
                    source
                  }
                }
              }
            }
        """)),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?["series"]["series"];

      if (res == null || res.isEmpty) return [];
      List<Series> listSeries =
          res.map((series) => Series.fromMap(map: series)).toList();
      listSeries.sort((firstSeries, secondSeries) =>
          secondSeries.avgScore!.compareTo(firstSeries.avgScore as num));
      return listSeries;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Series> getRandom() async {
    try {
      QueryResult result = await client.query(
        QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
              query randomSeries {
                  randomSeries {
                    _id
                    title {
                      main_title
                      alt_title
                    }
                    type
                    avg_score
                    total_episodes
                    duration
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
           """)),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      }
      Series series = Series.fromMap(map: result.data?["randomSeries"]);
      return series;
    } catch (error) {
      throw Exception(error);
    }
  }
}

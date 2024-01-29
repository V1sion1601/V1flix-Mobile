import 'package:app/src/graphql_config.dart';

//Models
import 'package:app/src/models/series.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DetailSeriesService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<Series> getDetails({required String title}) async {
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
                  description
                  episodes {
                    _id
                    title
                    epNum
                    view
                    description
                    thumbnail
                    source {
                      _id
                      kind
                      value  
                    }
                  }
                  images {
                    _id
                    type
                    source
                  }
                  duration
                  type
                  season
                  status
                  view
                  total_episodes
                  trailer {
                    id
                    site
                    thumbnail
                  }
              }
          }
          """), variables: {"title": title}));
      if (result.hasException) {
        throw Exception(result.exception);
      }
      print("Result: ");
      print(result.data?["findSeries"][0]);
      Series series = Series.fromMap(map: result.data?["findSeries"][0]);
      return series;
    } catch (error) {
      throw Exception(error);
    }
  }
}

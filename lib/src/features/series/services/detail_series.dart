import 'package:app/src/graphql_config.dart';

//Models
import 'package:app/src/models/series.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class   DetailSeriesService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<Series> getDetails({required String title}) async {
    try {
      QueryResult result = await client.query(
          QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
          query series(\$title: String!) {
              findSeriesByName(seriesTitle: \$title, isRelation: true) {
                  _id
                  title {
                    main_title
                    alt_title
                  }
                  relation {
                    role
                    related_series {
                      _id
                      avg_score
                      season
                      total_episodes
                      status
                      images {
                        _id
                        type
                        source
                      }
                      title {
                        main_title
                        alt_title
                      }
                    }
                  }
                  description
                  episodes {
                    _id
                    title
                    epNum
                    view
                    description
                    subtitles {
                      lang
                      source {
                        _id
                        kind
                        value
                      }
                      label
                    }
                    thumbnail
                    series {
                      _id
                       title {
                        main_title
                      }
                      images {
                        _id
                        source
                        type
                      }
                    }
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
                  rating {
                    user {
                      _id
                      username
                      list {
                        series {
                          _id
                        }
                        currentEp
                        status
                      }
                    }
                    score
                  }
                  avg_score
                  duration
                  type
                  season
                  status
                  view
                  total_episodes
                  genres {
                    _id
                    name
                  }
                  trailer {
                    site
                    thumbnail
                    idTrailer
                  }
              }
          }
          """), variables: {"title": title}));
      if (result.hasException) {
        throw Exception(result.exception);
      }

      Series series = Series.fromMap(map: result.data?["findSeriesByName"]);
      print("Series: " + series.toString());
      return series;
    } catch (error) {
      throw Exception(error);
    }
  }
}

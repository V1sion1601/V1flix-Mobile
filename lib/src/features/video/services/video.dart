import 'package:app/src/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VideoService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future addView({required String seriesId, required String episodeId}) async {
    try {
      QueryResult result = await client.query(
          QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
          mutation(\$seriesId: String!, \$episodeId: String!) {
              addView(seriesId: \$seriesId, episodeId: \$episodeId)
          }
          """), variables: {
        "seriesId": seriesId,
        "episodeId": episodeId,
      }));
      if(result.hasException) {
        throw Error();
      }
    } catch (error) {
      print(error.toString());
    }
  }
}

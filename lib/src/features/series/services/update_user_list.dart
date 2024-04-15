import 'package:app/src/features/series/models/list_settings.dart';
import 'package:app/src/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UpdateUserListService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();
  Future<ListUpdateResult> updateUserList({required ListInput listData }) async {
    try {
      QueryResult result = await client.query(
          QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
          mutation(\$userId: String!, \$status: String!, \$currentEp: Int!, \$note: String!, \$seriesId: String!) {
              updateSeriesInList(userId: \$userId, status: \$status, currentEp: \$currentEp, note: \$note, seriesId: \$seriesId)
          }
          """), variables: {
            "seriesId": listData.seriesId,
            "note": "",
            "currentEp": int.parse(listData.currentEpisode),
            "status": listData.status,
            "userId": listData.userId
          }));

      if(result.hasException) {
        return ListUpdateResult(error: result.exception!.graphqlErrors.first.message, result: false);
      }
      return ListUpdateResult(error: "", result: true, message: "Update successfully");
    } catch (error) {
      return ListUpdateResult(error: "System error", result: false);
    }
  }
}
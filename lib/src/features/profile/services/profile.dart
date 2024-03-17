import 'package:app/src/graphql_config.dart';
import 'package:app/src/models/users.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProfileDataService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<Users> getUserData({required String username}) async {
    try {
      QueryResult result = await client.query(
        QueryOptions(document: gql(""" 
            query getProfile(\$username: String!) {
              findUserByName(username: \$username) {
                _id
                username
                list {
                  currentEp
                  status
                  series	 {
                    total_episodes
                    rating {
                      user {
                        _id
                        username		
                      }
                      score
                    }
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
                favoriteList {
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
                avatar
                stats {
                  mean_score
                  days_watched
                  total_episodes
                }
              }
            }
        """), variables: {"username": username}),
      );
      if(result.hasException) {
        throw Exception(result.exception);
      }

      if(result.data == null)  throw Exception("Can't find this user");
      Users user = Users.fromMap(user: result.data?["findUserByName"]);

      return user;
    } catch (error) {
      throw Exception(error);
    }
  }
}

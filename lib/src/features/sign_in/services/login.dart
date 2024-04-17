import 'package:app/src/graphql_config.dart';
import 'package:app/src/models/form.dart';
import 'package:app/src/models/users.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:app/src/globals/user_data.dart';

class LoginService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<FormResult> getLoginResult({required String email, required String password}) async {
    try {

      QueryResult result = await client.query(
          QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
          query login(\$email: String!, \$password: String!) {
              login(email: \$email, password: \$password) {
                 userId
                 token
                 username
              }
          }
          """), variables: {"email": email, "password": password}));


      Map? res = result.data?["login"];
      if(res == null) {
        return FormResult(error: "Email wrong or password wrong.", result: false);
      }
      GlobalUserData().loggedUser = Users.fromMap(user: res);
      GlobalUserData().token = res["token"];
      GlobalUserData().isLoggedIn = true;

      return FormResult(error: "", result: true);

    } catch(error) {
      return FormResult(error: "System wrong.", result: false);
    }
  }
}
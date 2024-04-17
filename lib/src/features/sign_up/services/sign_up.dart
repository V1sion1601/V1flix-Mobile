import 'package:app/src/features/sign_up/models/sign_up.dart';
import 'package:app/src/graphql_config.dart';
import 'package:app/src/models/form.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RegisterService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<FormResult> getRegisterResult(
      {required UserRegisterData userData}) async {
    try {
      if (userData.password != userData.confirmedPassword) {
        return FormResult(
            error: "Password doesn't match with confirmed password",
            result: false);
      }
      QueryResult result = await client.query(
          QueryOptions(fetchPolicy: FetchPolicy.noCache, document: gql("""
          mutation(\$email: String!, \$password: String!, \$username: String!) {
              createUser(email: \$email, password: \$password, username: \$username) {
                _id
              }
          }
          """), variables: {
        "email": userData.email,
        "password": userData.password,
        "username": userData.username
      }));
      if(result.hasException) {
        return FormResult(error: result.exception!.graphqlErrors.first.message, result: false);
      }
      return FormResult(error: "", result: true, message: "Register successfully");
    } catch (error) {
      return FormResult(error: "System error", result: false);
    }
  }
}

// This helps to access the token and id from anywhere of the code

import 'package:e_commerce/services/tokenId.dart';

class Candidate {
   String token = TokenId.token,id=TokenId.id;

// Future<void> storeTokenId(token1, id1) async {
//   token = token1;
//   id = id1;
// }
}
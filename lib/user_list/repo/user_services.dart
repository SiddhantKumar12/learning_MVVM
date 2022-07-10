import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:learning_mvvm/user_list/repo/api_status.dart';

import '../../utils/constants.dart';
import '../models/user_list_model.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(userList);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(response: userListModelFromJson(response.body));
      }
      return Failure(
          code: userInvalidResponse, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: noInternet, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: inValidFormat, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: unknownError, errorResponse: 'Unknown Error');
    }
  }
}

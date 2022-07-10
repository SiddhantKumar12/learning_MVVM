import 'package:flutter/material.dart';
import 'package:learning_mvvm/components/app_loading.dart';
import 'package:learning_mvvm/user_list/models/user_list_model.dart';
import 'package:learning_mvvm/user_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        body: Container(child: _ui(userViewModel)));
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return const AppLoading();
    }
    if (userViewModel.userError != null) {
      return Container();
    }
    return ListView.builder(
      itemCount: userViewModel.userListModel.length,
      itemBuilder: (context, index) {
        UserModel userModel = userViewModel.userListModel[index];
        return GestureDetector(
          onTap: () async {
            userViewModel.setSelectedUser(userModel);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DetailPage(),
              ),
            );
          },
          child: ListTile(
            title: Text(
              userModel.name,
            ),
            subtitle: Text(userModel.name),
          ),
        );
      },
    );
  }
}

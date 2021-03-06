
import 'package:bf1221_chat/models/app_user.dart';
import 'package:bf1221_chat/resources/utils/utils.dart';
import 'package:bf1221_chat/views/conversation_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SearchResultUserItem extends StatelessWidget {
  const SearchResultUserItem({
    Key? key,
    required this.appUser,
  }) : super(key: key);

  final AppUser appUser;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.withOpacity(0.6),
        radius: 23,
        backgroundImage:
        appUser.photoUrl != null ? NetworkImage(appUser.photoUrl!) : null,
        child: appUser.photoUrl != null
            ? null
            : Text(Utils.nameInit(appUser.displayName ?? ""),
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.blue)),
      ),
      title: Text(
        appUser.displayName ?? "",
        style: txtMedium(18),
      ),
      subtitle: Text(
        Utils.userName(appUser.email ?? ""),
        style: txtRegular(14),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ConversationScreen(receiver: appUser)));
      },
    );
  }
}

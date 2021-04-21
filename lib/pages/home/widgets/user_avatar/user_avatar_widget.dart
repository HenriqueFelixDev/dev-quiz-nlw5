import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final String imageURL;
  UserAvatarWidget({Key? key, required this.imageURL}) 
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(imageURL)
        )
      ),
    );
  }
}
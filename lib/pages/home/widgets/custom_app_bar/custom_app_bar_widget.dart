import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:dev_quiz/core/core.dart';
import '../score_card/score_card_widget.dart';
import '../user_avatar/user_avatar_widget.dart';

class CustomAppBarWidget extends PreferredSize {
  UserModel user;
  CustomAppBarWidget({
    Key? key,
    required this.user
  }) : super(
    key: key,
    preferredSize: Size.fromHeight(250.0),
    child: Container(
      height: 250.0,
      child: Stack(
        children: [
          Container(
            height: 136.0,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: AppGradients.linear
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Olá, ',
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                        text: user.name,
                        style: AppTextStyles.titleBold
                      )
                    ]
                  )
                ),
                UserAvatarWidget(imageURL: user.photoURL)
              ]
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ScoreCardWidget(score: user.score)
            )
          )
        ]
      )
    )
  );
}
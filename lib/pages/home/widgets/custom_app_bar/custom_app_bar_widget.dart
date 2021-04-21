import 'package:flutter/material.dart';
import 'package:dev_quiz/core/core.dart';
import '../score_card/score_card_widget.dart';
import '../user_avatar/user_avatar_widget.dart';

class CustomAppBarWidget extends PreferredSize {
  CustomAppBarWidget() : super(
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
                        text: 'HenriqueFelixDev',
                        style: AppTextStyles.titleBold
                      )
                    ]
                  )
                ),
                UserAvatarWidget(imageURL: 'https://avatars.githubusercontent.com/u/47118693?v=4')
              ]
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ScoreCardWidget()
            )
          )
        ]
      )
    )
  );
}
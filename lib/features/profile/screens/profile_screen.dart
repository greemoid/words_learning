import 'package:flutter/material.dart';
import 'package:words_learning/common/widgets/light_grey_divider.dart';
import 'package:words_learning/core/theme/color_palette.dart';
import 'package:words_learning/features/profile/widgets/multiple_settings_item.dart';
import 'package:words_learning/features/profile/widgets/single_settings_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.only(top: 64),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/default-profile-photo.png',
                    height: 126,
                    width: 126,
                  ),
                ),
                SizedBox(height: 16),
                Text('username', style: textTheme.titleMedium),
                SizedBox(height: 4),
                Text('free account · 3 level', style: textTheme.bodySmall),
                SizedBox(height: 16),
                LightGreyDivider(),
                SizedBox(height: 24),
                SingleSettingsItem(
                    icon: Icons.payment,
                    text: 'Payments and subscriptions',
                    textTheme: textTheme),
                MultipleSettingsItem(textTheme: textTheme, texts: [
                  'Linked accounts',
                  'Notifications'
                ], icons: [
                  Icons.switch_account,
                  Icons.notifications_on_outlined
                ]),
                MultipleSettingsItem(textTheme: textTheme, texts: [
                  'About us',
                  'Terms and policies',
                  'Ask a question'
                ], icons: [
                  Icons.question_mark,
                  Icons.local_police_outlined,
                  Icons.question_answer_outlined
                ]),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Log out',
                    style: textTheme.bodyMedium
                        ?.copyWith(color: ColorPalette.errorColor),
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

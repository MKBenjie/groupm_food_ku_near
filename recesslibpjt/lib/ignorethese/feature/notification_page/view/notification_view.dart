import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recesslibpjt/ignorethese/core/constants/app_colors.dart';
import 'package:recesslibpjt/ignorethese/core/constants/app_string.dart';
import 'package:recesslibpjt/ignorethese/core/constants/image_const.dart';
import 'package:recesslibpjt/ignorethese/core/extensions/extension.dart';
import 'package:recesslibpjt/ignorethese/feature/notification_page/viewModel/notification_view_model.dart';
import 'package:recesslibpjt/ignorethese/products/component/notification_card.dart';
import 'package:recesslibpjt/ignorethese/products/widgets/app_bar.dart';
import 'package:recesslibpjt/ignorethese/products/widgets/bottom_navbar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ntfList = context.read<NotificationViewModel>().ntfModel;
    return Scaffold(
      bottomNavigationBar: const BottomNavbar(pageid: 4),
      body: Column(
        children: [
          Stack(
            children: [
              const PngImage(name: ImageItems.stackImage),
              Padding(
                padding: context.pageTopPadding,
                child: const AppBarWidget(
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: context.pagePaddingTopLeft,
                child: Text(
                  StringConstant.notificationTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Consumer(
              builder: ((context, value, child) {
                return ListView.builder(
                    itemCount: ntfList.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(model: ntfList[index]);
                    });
              }),
            ),
          )
        ],
      ),
    );
  }
}

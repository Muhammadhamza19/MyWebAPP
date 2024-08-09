import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_shared_pref.dart';
import 'package:local_grocery/ui/categories/categories_main_view.dart';
import 'package:local_grocery/ui/chat/chat_main_view.dart';
import 'package:local_grocery/ui/contact_us/contact_us_main_page.dart';
import 'package:local_grocery/ui/faq/faq_main_page.dart';
import 'package:local_grocery/ui/main_page.dart';
import 'package:local_grocery/ui/order/order_main_page.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/ui/transaction/transaction_main_page.dart';
import 'package:local_grocery/ui/user/driver_delivery_view.dart';
import 'package:local_grocery/ui/user_profile/user_profile_view.dart';
import 'package:local_grocery/view_models/user_view_model.dart';

Widget drawerBeforeLogin() {
  return Drawer(
    backgroundColor: backgroundColor,
    shadowColor: Colors.transparent,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
            child: Column(
          children: [
            MyAssetImage(
              imageName: 'user_logo',
              height: 50,
              width: 50,
            ),
            Row(
              children: [
                Icon(Icons.account_balance_wallet),
                MyText('100.00\$'),
              ],
            )
          ],
        )),
        ListTile(
          leading: MyAssetImage(
            imageName: 'customer_pickup_Sele',
          ), // Set icon color here
          title: MyText('Categories'),
          onTap: () => Get.to(() => CategoriesMainView())
          // Handle the tap here
          ,
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'compete_order_select',
          ), // Set icon color here
          title: MyText('Contact Info'),
          onTap: () {
            Get.to(() => ContactUsMainPage());
            // Handle the tap here
          },
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'complaint_Selected',
          ), // Set icon color here
          title: MyText('Complaint'),
          onTap: () {
            // Handle the tap here
          },
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'faq_selected',
          ), // Set icon color here
          title: MyText('FAQs'),
          onTap: () {
            Get.to(() => FaqMainPage(
                title: "FAQs",
                url:
                    'https://lg-angular-fe-ybbl53s3vq-nn.a.run.app/store/home'));
          },
        ),
        ListTile(
          // leading: MyAssetImage(
          //   imageName: 'complaint_Selected',
          // ), // Set icon color here
          title: MyText('Driver Delivery'),
          onTap: () {
            Get.to(() => DriverDeliveryView());
          },
        ),
      ],
    ),
  );
}

Widget drawerAfterLogin() {
  return Drawer(
    backgroundColor: backgroundColor,
    shadowColor: Colors.transparent,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
            child: Column(
          children: [
            MyAssetImage(
              imageName: 'user_logo',
              height: 50,
              width: 50,
              onClick: (p0) => Get.to(() => UserProfileView()),
            ),
            Row(
              children: [
                Icon(Icons.account_balance_wallet),
                MyText('100.00\$'),
              ],
            )
          ],
        )),
        ListTile(
          leading: MyAssetImage(
            imageName: 'customer_pickup_Sele',
          ), // Set icon color here
          title: MyText('Categories'),
          onTap: () => Get.to(() => CategoriesMainView())
          // Handle the tap here
          ,
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'customer_pickup_Sele',
          ), // Set icon color here
          title: MyText('My Order'),
          onTap: () => Get.to(() => OrderMainPage())
          // Handle the tap here
          ,
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'compete_order_select',
          ), // Set icon color here
          title: MyText('My Transaction'),
          onTap: () => Get.to(() => TransactionMainPage()),
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'bank_selected',
          ), // Set icon color here
          title: MyText('Payement Method'),
          onTap: () {
            // Handle the tap here
          },
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'user',
          ), // Set icon color here
          title: MyText('Setting'),
          onTap: () {
            // Handle the tap here
          },
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'chat_selected',
          ), // Set icon color here
          title: MyText('Chat'),
          onTap: () => Get.to(() => ChatMainView())
          // Handle the tap here
          ,
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'complaint_Selected',
          ), // Set icon color here
          title: MyText('Complaint'),
          onTap: () {
            // Handle the tap here
          },
        ),
        ListTile(
          leading: MyAssetImage(
            imageName: 'faq_selected',
          ), // Set icon color here
          title: MyText('FAQs'),
          onTap: () {
            // Handle the tap here
            Get.to(() => FaqMainPage(
                title: "FAQs",
                url:
                    'https://lg-angular-fe-ybbl53s3vq-nn.a.run.app/store/home'));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: primaryColor,
          ), // Set icon color here
          title: MyText('Log Out'),
          onTap: () {
            // Handle the tap here
            Navigator.of(Get.context!).pop();
            AppSharedPref.setUserId(0);
            UserViewModel.load().currentView.value =
                EMainCurrentView.dashboard_view.index;
            Get.to(() => MainPage());
          },
        ),
      ],
    ),
  );
}

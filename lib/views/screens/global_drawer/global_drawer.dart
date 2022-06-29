import 'package:belefu_user/controller/auth_controller.dart';
import 'package:belefu_user/controller/splash_controller.dart';
import 'package:belefu_user/data/model/response/menu_model.dart';
import 'package:belefu_user/helper/responsive_helper.dart';
import 'package:belefu_user/helper/route_helper.dart';
import 'package:belefu_user/util/app_constants.dart';
import 'package:belefu_user/util/dimensions.dart';
import 'package:belefu_user/view/base/custom_app_bar.dart';
import 'package:belefu_user/view/screens/menu/widget/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    double _ratio = ResponsiveHelper.isDesktop(context)
        ? 1.1
        : ResponsiveHelper.isTab(context)
            ? 1.1
            : 1.2;

    final List<MenuModel> _menuList = [
      MenuModel(
          icon: Icons.person_outline,
          title: 'profile'.tr,
          subtitle: 'profile_desc'.tr,
          backgroundColor: Theme.of(context).cardColor,
          route: RouteHelper.getProfileRoute()),
      MenuModel(
          icon: LineAwesomeIcons.address_book,
          title: 'my_address'.tr,
          subtitle: 'my_address_desc'.tr,
          backgroundColor: Theme.of(context).cardColor,
          route: RouteHelper.getAddressRoute()),
      MenuModel(
          icon: LineAwesomeIcons.ribbon,
          title: 'coupon'.tr,
          subtitle: 'coupon_desc'.tr,
          backgroundColor: Theme.of(context).cardColor,
          route: RouteHelper.getCouponRoute()),
      MenuModel(
          icon: LineAwesomeIcons.helping_hands,
          title: 'help_support'.tr,
          subtitle: 'help_support_desc'.tr,
          backgroundColor: Theme.of(context).cardColor,
          route: RouteHelper.getSupportRoute()),
      MenuModel(
          icon: LineAwesomeIcons.directions,
          title: 'privacy_policy'.tr,
          subtitle: 'privacy_policy_desc'.tr,
          backgroundColor: Theme.of(context).cardColor,
          route: RouteHelper.getHtmlRoute('privacy-policy')),
      MenuModel(
          icon: LineAwesomeIcons.history,
          title: 'about_us'.tr,
          subtitle: 'about_us_desc'.tr,
          backgroundColor: Theme.of(context).cardColor,
          route: RouteHelper.getHtmlRoute('about-us')),
      MenuModel(
          icon: LineAwesomeIcons.infinity,
          title: 'terms_conditions'.tr,
          subtitle: 'terms_conditions_desc'.tr,
          backgroundColor: Theme.of(context).cardColor,
          route: RouteHelper.getHtmlRoute('terms-and-condition')),
    ];
    // if (Get.find<SplashController>().configModel.toggleDmRegistration &&
    //     !ResponsiveHelper.isDesktop(context)) {
    //   _menuList.add(MenuModel(
    //     icon: LineAwesomeIcons.biking,
    //     title: 'join_as_a_delivery_man'.tr,
    //     subtitle: 'join_as_a_delivery_man_desc'.tr,
    //     backgroundColor: Theme.of(context).cardColor,
    //     route: '${AppConstants.BASE_URL}/deliveryman/apply',
    //   ));
    // }
    // if (Get.find<SplashController>().configModel.toggleRestaurantRegistration &&
    //     !ResponsiveHelper.isDesktop(context)) {
    //   _menuList.add(MenuModel(
    //     icon: LineAwesomeIcons.feather,
    //     title: 'join_as_a_restaurant'.tr,
    //     subtitle: 'join_as_a_restaurant_desc'.tr,
    //     backgroundColor: Theme.of(context).cardColor,
    //     route: '${AppConstants.BASE_URL}/restaurant/apply',
    //   ));
    // }
    _menuList.add(
      MenuModel(
          icon: LineAwesomeIcons.alternate_sign_out,
          title: _isLoggedIn ? 'logout'.tr : 'sign_in'.tr,
          backgroundColor: Theme.of(context).cardColor,
          subtitle: 'logout_desc'.tr,
          route: ''),
    );

    return PointerInterceptor(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Settings'.tr, isBackButtonExist: true),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).hintColor.withOpacity(0.2),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                _menuList.length,
                (index) => MenuButton(
                  drawerTileModel: _menuList[index],
                  isProfile: index == 0,
                  isLogout: index == _menuList.length - 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

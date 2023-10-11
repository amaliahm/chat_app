import 'package:chat_app/common/middlewares/router_welcome.dart';
import 'package:chat_app/pages/contact/index.dart';
import 'package:chat_app/pages/message/photoview/index.dart';
import 'package:chat_app/pages/profile/index.dart';
import 'package:get/get.dart';
import 'package:chat_app/pages/welcome/index.dart';
import '../../pages/application/index.dart';
import '../../pages/message/chat/index.dart';
import '../../pages/sign_in/index.dart';
import 'names.dart';


class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = AppRoutes.INITIAL;
  // ignore: constant_identifier_names
  static const APPlication = AppRoutes.Application;
  // static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ]
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),

    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
      // middlewares: [
      //   RouteAuthMiddleware(priority: 1)
      // ]
    ),
    GetPage(
      name: AppRoutes.Contact,
      page: () => const ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.Chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.Photoimgview,
      page: () => const PhotoImageView(),
      binding: PhotoImageViewBinding(),
    ),
    GetPage(
      name: AppRoutes.Me,
      page: () => const ProfilePage(),
      binding: ProfileBinging(),
    ),
  ];
}

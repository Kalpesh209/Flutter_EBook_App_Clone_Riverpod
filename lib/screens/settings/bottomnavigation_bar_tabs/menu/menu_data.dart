import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/invite/invite_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/Addresses.dart';

import '../../membership/subscrption_page_new.dart';
import '../../user/change_password.dart';

List<String> names = [
  "Settings",
  'App Settings',
  'Data Privacy',
  'More',
  'Shared Data',
  'Collected Data'
];

List<Map<String, dynamic>> mySettingsList1 = [
  /* {
    'title': 'Languages',
    'icon': Assets.settings.svg.generalLanguage,
    'route': 'menu',
    'function': () {
      // Add your function implementation here
    },
  },
  {
    'title': 'Font Size',
    'icon': Assets.settings.svg.generalFont,
    'route': 'menu',
    'function': () {
      //  print('font size');
      // Add your function implementation here
    },
  },*/
  {
    'title': 'Change Password',
    'icon': Assets.settings.svg.generalPassword,
    'route': 'changepasswordScreen',
    'function': () {
      const ChangePasswordScreen();
    }
    //  Navigator.push(context, route)
    // Add your function implementation here
  },
  {
    'title': 'Notification',
    'icon': Assets.settings.svg.generalNotifications,
    'route': 'menu',
    'function': () {
      // Add your function implementation here
    },
  },
  {
    'title': 'Delete Account',
    'icon': Assets.settings.svg.icDeleteAccount,
    'route': 'menu',
    'function': () {
      // Add your function implementation here
    },
  },
];
List<Map<String, dynamic>> appsettings = [
  {
    'title': 'Library at your door step',
    'icon': Assets.settings.svg.appsettingsLibary,
    'route': 'menu',
    'function': () {
      debugPrint("libaray ");
      // Add your function implementation here
    },
  },
  {
    'title': 'Magzines',
    'icon': Assets.settings.svg.appsettingsMagzines,
    'route': 'menu',
    'function': () {
      debugPrint("magazins");
      // Add your function implementation here
    },
  },
  {
    'title': 'Audio book',
    'icon': Assets.settings.svg.appsettingsAudiobook,
    'route': 'menu',
    'function': () {
      debugPrint('Audio book');
      // Add your function implementation here
    },
  },
  {
    'title': 'Music',
    'icon': Assets.settings.svg.appsettingsMusic,
    'route': 'menu',
    'function': () {
      debugPrint('music');
      // Add your function implementation here
    },
  },
  {
    'title': 'Quiz',
    'icon': Assets.settings.svg.appsettingsQuiz,
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Yoga',
    'icon': Assets.settings.svg.appsettingsYoga,
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Meditation',
    'icon': Assets.settings.svg.appsettingsMeditation,
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
];

List<Map<String, dynamic>> sharedData = [
  {
    'title': 'Personal Info',
    'icon': Assets.settings.svg.userinfo,
    'route': 'menu',
    'function': () {
      debugPrint('Personal Info');
      // Add your function implementation here
    },
  },
  {
    'title': 'Delete Account',
    'icon': Assets.settings.svg.userinfo,
    'route': 'menu',
    'function': () {
      debugPrint('Delete Account');

      // ref.watch(edituserstate).deleteUser();
      // Add your function implementation here
    },
  },
  {
    'title': 'Location',
    'icon': Assets.settings.svg.dataLocation,
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'App Activity',
    'icon': Assets.settings.svg.dataAppactivity,
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Collected Data',
    'icon': "",
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Personal Info',
    'icon': Assets.settings.svg.userinfo,
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Location',
    'icon': Assets.settings.svg.dataLocation,
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Web Browsing',
    'icon': Assets.settings.svg.generalLanguage,
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
];
List<Map<String, dynamic>> collectedData = [
  {
    'title': 'Personal Info',
    'icon': Assets.settings.svg.userinfo,
    'route': 'menu',
    'function': () {
      // Add your function implementation here
    },
  },
  {
    'title': 'Location',
    'icon': Assets.settings.svg.dataLocation,
    'route': 'menu',
    'function': () {
      // Add your function implementation here
    },
  },
  {
    'title': 'Web Browsing',
    'icon': Assets.settings.svg.generalLanguage,
    'route': 'menu',
    'function': () {
      // Add your function implementation here
    },
  },
];

List<Map<String, dynamic>> more = [
  {
    'title': 'Addresses',
    'icon': Assets.settings.svg.addresses,
    'route': addressScreen,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
      const Addresses();
    },
  },
  /*{
    'title': 'Events',
    'icon': Assets.settings.svg.events,
    'route': 'menu',
    'function': () {
      debugPrint('nooooo');
    },
  },*/
  {
    'title': 'Favorites',
    'icon': Assets.settings.svg.favorites,
    'route': 'favorite_screen',
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Invite your friend',
    'icon': Assets.settings.svg.invite,
    'route': "invite_screen",
    'function': () {
      const InviteUserScreen();
      // Add your function implementation here
    },
  },
  {
    'title': 'Rate & Review',
    'icon': Assets.settings.svg.rateReview,
    'route': rating,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Feed back',
    'icon': Assets.settings.svg.feedback,
    'route': feedbackScreen,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Contact us',
    'icon': Assets.settings.svg.contact,
    'route': contactScreen,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  /*{
    'title': 'Memberships',
    'icon': 'Privacy policy',
    'route': subscribePageNew,
    'function': () {
      const SubscribePageNew(
        showSuccess: false,
        fromCart: false,
      );
      // Add your function implementation here
    },
  },*/
  {
    'title': 'Term of use',
    'icon': 'Privacy policy',
    'route': termCondition,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Privacy Policy',
    'icon': 'Privacy policy',
    'route': privacy,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
];

List<Map<String, dynamic>> policyMenu = [
  {
    'title': 'Shipping Policy ',
    'icon': Assets.settings.svg.generalPassword,
    'route': privacy,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
      // const Addresses();
    },
  },
  {
    'title': 'Refund Policy',
    'icon': Assets.settings.svg.generalNotifications,
    'route': privacy,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Data Collection Policy ',
    'icon': Assets.settings.svg.addresses,
    'route': privacy,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'App Uses Policy',
    'icon': Assets.settings.svg.rateReview,
    'route': privacy,
    'function': () {
      const InviteUserScreen();
      // Add your function implementation here
    },
  },
  {
    'title': 'Reward Policy',
    'icon': Assets.settings.svg.invite,
    'route': privacy,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Privacy Policy',
    'icon': Assets.settings.svg.rateReview,
    'route': privacy,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Data Sharing Policy',
    'icon': Assets.settings.svg.feedback,
    'route': privacy,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
  {
    'title': 'Contact us',
    'icon': Assets.settings.svg.contact,
    'route': contactScreen,
    'function': () {
      debugPrint('nooooo');
      // Add your function implementation here
    },
  },
];

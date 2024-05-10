import 'package:flutter_ebook_app_clone_riverpod/common/widgets/favorite_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/app_guide/app_guide_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/forgot_password/forgot_password.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/login/login.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/register/register_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/auth/set_new_password/set_new_password.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/invitation_screen/invitation_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/steps/step1.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/verify_account/verify_account.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/verify_account/verify_account_reset.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/waitlist/waitlist.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/welcome/welcome.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/dashboard.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/history/history_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/screens/challenge_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/screens/select_book.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/book_challenge/screens/select_contact_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/audio_book_detail.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/e_book_detail.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library/library.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/library_book/library_book_details.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/meditation_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/yoga_play_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/collection_details_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/collection_list_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/find_friend_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/play_quiz_dashboard.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/quiz_categories_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/quiz_detail_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/quiz_loading_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/quiz_question_result_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/quiz_questions_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/play_quiz/screens/quiz_score_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/notification/notification_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/rewards_screen/rewards_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/wallet/wallet.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/bottomnavigation_bar_tabs/menu/menu.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/contact/contact_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/feedback/feedback_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/invite/invite_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/navigation_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/qr_code/qr_code.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/rate_and_review/rate_and_review_one.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/rate_and_review/rate_and_review_two.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/tc_and_privacypolicy/tc_and_privacypolicyScreen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/tc_and_privacypolicy/termcondition.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/Addresses.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/policy_screen.dart';
import 'package:get/get.dart';
import '../../screens/Books/thanks_book_reading.dart';
import '../../screens/Onboarding/app_guide/loginregister_screen.dart';
import '../../screens/dashboard/home/book_challenge/screens/book_challenge_dashboard_screen.dart';
import '../../screens/dashboard/home/book_challenge/screens/book_invitation_status_screen.dart';
import '../../screens/dashboard/home/book_challenge/screens/challenge_detail_screen.dart';
import '../../screens/dashboard/home/book_challenge/screens/challenge_status_screen.dart';
import '../../screens/dashboard/home/home_menu/books/chapter_read_direct.dart';
import '../../screens/dashboard/home/top_picks/book_details_screen.dart';
import '../../screens/settings/membership/subscrption_page_new.dart';

List<GetPage<dynamic>> listOfPages = [
  /*GetPage(
    name: home,
    page: () => const LaunchScreen(),
  ),*/
  GetPage(
    name: appGuide,
    page: () => const AppGuideScreen(),
  ),
  GetPage(
    name: loginRegister,
    page: () => const LoginRegisterScreen(),
  ),
  /*GetPage(
    name: loginRegister,
    page: () => const LoginRegisterScreen(),
  ),*/
  GetPage(
    name: welcome,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: waitList,
    page: () => const WaitList(),
  ),
  GetPage(
    name: register,
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name: verifyAccount,
    page: () => const VerifyAccount(),
  ),
  GetPage(
    name: invitation,
    page: () => const InvitationScreen(),
  ),
  // GetPage(name: WELCOME, page: () => const WelcomeScreen()),
  GetPage(
    name: login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: forgotPassword,
    page: () => const ForgotPassword(),
  ),
  GetPage(
    name: setNewPassword,
    page: () => const SetNewPassword(),
  ),
  GetPage(
    name: userStep,
    page: () => const Step1Screen(),
  ),
  GetPage(
    name: dashboard,
    page: () => const DashBoard(initial: 0),
  ),
  GetPage(
    name: navigationScreen,
    page: () => const NavigationScreen(),
  ),
  GetPage(
    name: feedbackScreen,
    page: () => const FeedBackScreen(),
  ),
  GetPage(
    name: contactScreen,
    page: () => const ContactScreen(),
  ),
  GetPage(
    name: rating,
    page: () => const RateAndReviewScreenOne(),
  ),
  GetPage(
    name: rating2,
    page: () => const RateAndReviewScreenTwo(),
  ),
  GetPage(
    name: menuScreen,
    page: () => const Menu(),
  ),
  GetPage(
    name: inviteScreen,
    page: () => const InviteUserScreen(),
  ),
  GetPage(
    name: libraryScreen,
    page: () => const Library(),
  ),
  GetPage(
    name: barCodeScreen,
    page: () => const QrCode(),
  ),
  GetPage(
    name: notificationScreen,
    page: () => const NotificationScreen(),
  ),
  GetPage(
    name: historyScreen,
    page: () => const HistoryScreen(title: '', type: ''),
  ),
  GetPage(
    name: favoriteScreen,
    page: () => const FavoriteScreen(),
  ),
  GetPage(
    name: privacy,
    page: () => PrivacyPolicyScreen(title: ""),
  ),
  GetPage(
    name: policyMenuscreen,
    page: () => const PolicyMenuScreen(),
  ),
  GetPage(
    name: termCondition,
    page: () => const TermCondtionScreen(title: "Term & Condition"),
  ),
  GetPage(
    name: walletScreen,
    page: () => const WalletScreen(),
  ),
  GetPage(
    name: resetVerify,
    page: () => const VerifyAccountReset(),
  ),
  GetPage(
    name: addressScreen,
    page: () => const Addresses(),
  ),
  GetPage(
    name: libraryDetails,
    page: () => const LibraryBookDetails(),
  ),

  GetPage(
    name: bookDetails,
    page: () => const BookDetailsScreen(),
  ),
  GetPage(
    name: eBookDetails,
    page: () => const EbookDetail(),
  ),
  GetPage(
    name: chapterReadDirect,
    page: () => const ChapterReadDirect(),
  ),
  GetPage(
    name: audioDetails,
    page: () => const AudioBookDetail(),
  ),
  GetPage(
    name: yogaDetails,
    page: () => const YogaPlayerScreen(),
  ),
  GetPage(
    name: meditationDetails,
    page: () => MusicPlayer2(BookDetailsModal()),
  ),
  GetPage(
    name: musicDetails,
    page: () => MusicPlayer(BookDetailsModal()),
  ),
  GetPage(
    name: bookChallengeDashboard,
    page: () => const BookChallengeDashboardScreen(),
  ),
  GetPage(
    name: selectBookScreen,
    page: () => const SelectBookScreen(),
  ),
  GetPage(
    name: challengeScreen,
    page: () => const ChallengeScreen(),
  ),
  GetPage(
    name: selectContactScreen,
    page: () => const SelectContactScreen(),
  ),
  GetPage(
    name: challengeStatusScreen,
    page: () => const ChallengeStatusScreen(),
  ),
  GetPage(
    name: invitationsStatusScreen,
    page: () => const InvitationsStatusScreen(),
  ),
  GetPage(
    name: challengeDetailScreen,
    page: () => const ChallengedDetailsScreen(),
  ),
  GetPage(
    name: rewardsScreen,
    page: () => const RewardsScreen(),
  ),
  GetPage(
    name: playQuizDashboardScreen,
    page: () => const PlayQuizDashboard(),
  ),
  GetPage(
    name: findFriendsScreen,
    page: () => const FindFriendScreen(),
  ),
  GetPage(
    name: quizCategoriesScreen,
    page: () => const QuizCategoriesScreen(),
  ),
  GetPage(
    name: collectionListScreen,
    page: () => const CollectionListScreen(),
  ),
  GetPage(
    name: collectionDetailsScreen,
    page: () => const CollectionDetailsScreen(),
  ),
  GetPage(
    name: quizLoadingScreen,
    page: () => const QuizLoadingScreen(),
  ),
  GetPage(
    name: quizScoreScreen,
    page: () => const QuizScoreScreen(),
  ),
  GetPage(
    name: quizQuestionResultScreen,
    page: () => const QuizQuestionResultScreen(),
  ),
  GetPage(
    name: quizDetailScreen,
    page: () => const QuizDetailScreen(),
  ),
  GetPage(
    name: quizQuestionsScreen,
    page: () => const QuizQuestionsScreen(),
  ),
  GetPage(
    name: rateandreviewone,
    page: () => const RateAndReviewScreenTwo(),
  ),
  GetPage(
    name: thankYouScreen,
    page: () => const ThankYouScreen(),
  ),
  GetPage(
    name: subscribePageNew,
    page: () => const SubscribePageNew(
      showSuccess: false,
      fromCart: false,
    ),
  ),
];

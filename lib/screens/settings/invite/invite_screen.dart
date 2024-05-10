import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart' as globals;
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/bottomnavigation_bar_tabs/menu/providers/menu_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/modals/user_response_modal.dart';
import 'package:get/get.dart' as getx;
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:share_plus/share_plus.dart';

class InviteScreenState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  UserData? userData = UserData();

  getContactDetail() async {
    debugPrint('getContactDetail');
    loading = true;
    Response<dynamic> response = await dioService
        .get('/user/get-user',
            options: Options(headers: {
              "Authorization": globals.token,
            }))
        .whenComplete(() => loading = false);

    debugPrint('response data.... ${response.data}');
    userData = response.data['data'] != null
        ? UserData.fromJson(response.data['data'])
        : null;
    debugPrint(
        'state.userData?.verificationCode ${userData?.verificationCode}');
    notifyListeners();
  }
}

final inviteState = ChangeNotifierProvider.autoDispose((r) {
  return InviteScreenState();
});

class InviteUserScreen extends ConsumerStatefulWidget {
  const InviteUserScreen({super.key});

  @override
  ConsumerState<InviteUserScreen> createState() =>
      _InviteUserScreenConsumerState();
}

class _InviteUserScreenConsumerState extends ConsumerState<InviteUserScreen> {
  @override
  void didChangeDependencies() {
    var state = ref.watch(inviteState);
    WidgetsBinding.instance.addPostFrameCallback((t) {
      state.getContactDetail();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(inviteState);
    debugPrint(
        'state.userData?.verificationCode ${state.userData?.verificationCode}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ImageHeader(),
            ShareLink(code: state.userData?.verificationCode ?? ''),
            SizedBox(
              height: getx.Get.height * 0.014,
            ),
            /*Text(
              "Or send it via",
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600),
            ),*/
            SizedBox(
              height: getx.Get.height * 0.03,
            ),
            /*ShareButton(
              assetName: Assets.settings.svg.fb,
              text: "Facebook",
              color: const Color(0xFF0067DB),
              invitelink: state.userData?.inviteCodeLink ?? '',
            ),*/
            SizedBox(
              height: getx.Get.height * 0.02,
            ),
            ShareButton(
              assetName: '',
              text: "Share",
              color: FPcolors.fpPrimary,
              invitelink: state.userData?.inviteCodeLink ?? '',
            ),
            SizedBox(
              height: getx.Get.height * 0.02,
            ),
            /* ShareButton(
              assetName: Assets.settings.svg.wp,
              text: "Whatsapp",
              color: const Color(0xFF05A64F),
              invitelink: state.userData?.inviteCodeLink ?? '',
            )*/
          ],
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton(
      {super.key,
      required this.text,
      required this.assetName,
      required this.color,
      required this.invitelink});

  final String text;
  final String assetName;
  final Color color;
  final String invitelink;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          fixedSize: Size(getx.Get.width * 0.85, getx.Get.height * 0.06),
          backgroundColor: color),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getx.Get.width * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetName,
            ),
            SizedBox(
              width: getx.Get.width * 0.22,
            ),
            Text(
              text,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: getx.Get.width * 0.27,
            ),
          ],
        ),
      ),
      onPressed: () {
        Share.share(
          invitelink,
          subject: 'Invitation Link',
        );
      },
    );
  }
}

class ShareLink extends StatelessWidget {
  const ShareLink({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle =
        GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 16);
    debugPrint('verification code $code');
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getx.Get.width * 0.05,
        vertical: getx.Get.height * 0.02,
      ),
      child: Column(
        children: [
          ShareLinkRow(titleStyle: titleStyle),
          InviteCodeForm(
            code: code,
          ),
        ],
      ),
    );
  }
}

class InviteCodeForm extends StatelessWidget {
  const InviteCodeForm({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: FormGroup({
        //'country_code': FormControl(),
        'invite-code':
            FormControl(value: '', validators: [Validators.required]),
      }),
      child: ReactiveTextField(
        readOnly: true,

        formControlName: 'invite-code',
        // obscureText: false,

        decoration: AppStyles.inputDecoration.copyWith(
          hintText: code,
          hintStyle: TextStyle(
            color: FPcolors.color090A0A,
          ),
          labelStyle: TextStyle(color: FPcolors.color090A0A),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}

class ShareLinkRow extends ConsumerWidget {
  const ShareLinkRow({
    super.key,
    required this.titleStyle,
  });

  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(menuState);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Share your link", style: titleStyle),
        TextButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: state.inivitelink)).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied to your clipboard !')));
            });
          },
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          ),
          child: const Text(
            'Copy link',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFFF35A38),
            ),
          ),
        )
      ],
    );
  }
}

class ImageHeader extends StatelessWidget {
  const ImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height * 0.5,
      color: FPcolors.lightOrange,
      child: Padding(
        padding: EdgeInsets.only(
            top: getx.Get.height * 0.01, bottom: getx.Get.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TopRow(),
            SizedBox(
              height: getx.Get.height * 0.015,
            ),
            SvgPicture.asset(
              Assets.settings.svg.frame,
              height: getx.Get.height * 0.3,
              width: getx.Get.width * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          Assets.settings.svg.appbarBackbutton,
          height: 30,
          width: 30,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.transparent,
      title: Text(
        "Invite Your Friend",
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}

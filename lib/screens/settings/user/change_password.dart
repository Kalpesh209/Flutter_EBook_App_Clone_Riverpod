import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/fonts/fonts.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/themes/textfield_decorations.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/settings/user/providers/change_password.dart';

import '../../../common/exceptions/invalid_form.dart';
import '../../../common/helpers/snakbar_helper.dart';
import '../../../common/widgets/components.dart';
import '../../../config/app_text_styles.dart';
import '../../../config/colors/colors.dart';
import '../../../config/size/size.dart';

class ChangePasswordScreen extends ConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(changepasswordstate);
    return Scaffold(
      appBar: FpAppBar(title: '', backButtonRequired: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultSpacer,
            Center(
                child: Text(
              'Change Password',
              style: FPfonts.dmSans28Bold,
            )),
            // Center(
            //     child: Text(
            //   'Lorem ipsum dolor sit ame',
            //   style: FPfonts.inter14black,
            // )),
            defaultSpacerLarge,
            /* TextFormField(
              controller: state.oldpassword,
              decoration: FpTextFieldDecoration(hintText: 'Current Password'),
            ),*/
            defaultSpacer,
            TextFormField(
              controller: state.newpassword1,
              obscureText: true,
              /*decoration: FpTextFieldDecoration(hintText: 'New Password')*/
              decoration: AppStyles.inputDecoration
                  .copyWith(
                    hintText:
                        'New Password', /*suffixIcon: IconButton(icon: Icon(
                // Based on passwordVisible state choose the icon
                state.confirmPasswordShow ? Icons.visibility : Icons.visibility_off,

              ),
                  onPressed: () {
                    if(state.confirmPasswordShow == true){
                      state.confirmPasswordShow = false;
                    }else{
                      state.confirmPasswordShow = true;
                    }

                    // Update the state i.e. toogle the state of passwordVisible variable

                  })*/
                  )
                  .copyWith(),
            ),
            /* defaultSpacer,
            Text(
              '*Minimum 6 characters',
              style: FPfonts.inter14grey.copyWith(color: FPcolors.fpgreyText),
            ),*/
            defaultSpacer,
            TextFormField(
              controller: state.confirmpassword,
              obscureText: true,
              /* decoration: FpTextFieldDecoration(hintText: 'Confirm Password'),*/
              decoration: AppStyles.inputDecoration
                  .copyWith(
                    hintText:
                        'Confirm Password', /*suffixIcon: IconButton(icon: Icon(
                // Based on passwordVisible state choose the icon
                state.confirmPasswordShow ? Icons.visibility : Icons.visibility_off,

              ),
                  onPressed: () {
                    if(state.confirmPasswordShow == true){
                      state.confirmPasswordShow = false;
                    }else{
                      state.confirmPasswordShow = true;
                    }
                  })*/
                  )
                  .copyWith(),
            ),
            defaultSpacer,
            Text(
              '*Minimum 8 characters or more and should consist 1 capital, 1 numerical, 1 special character(e.g.!,*,@,#)',
              style: FPfonts.body12regular.copyWith(color: FPcolors.fpgreyText),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FpElevatedButton(
          onPressed: () async {
            try {
              String res = await state.postContactDetails();
              if (res == "success") {
                FocusScope.of(context).unfocus();
              }
            } on InvalidFormException catch (e) {
              SnackbarHelper.error(e.message);
            } on DioException {
              // SnackbarHelper.error(e.response?.data['message']);
              //  SnackbarHelper.error(e.response?.data['message']);
            }
          },
          buttonTitle: 'Submit'),
    );
  }
}

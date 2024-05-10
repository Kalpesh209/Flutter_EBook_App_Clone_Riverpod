import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/snakbar_helper.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_bg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/steps/providers/step_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/steps/widgets/question_title.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Onboarding/steps/widgets/step_button.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Step1Screen extends ConsumerWidget {
  const Step1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(stepProviderProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Step ${state.currentQuestionIndex + 1}'),
        actions: [
          TextButton(
              child: const Text(
                'Skip',
                style: AppStyles.skipBtnStyle,
              ),
              onPressed: () {
                if (state.currentQuestionIndex == state.questions.length - 1) {
                  Get.toNamed(welcome);
                } else {
                  state.currentQuestionIndex++;
                }
              }),
        ],
      ),
      body: ContainerWithBg(
        blurred: true,
        child: state.loadingQuestions
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading questions'),
                  ],
                ),
              )
            : Padding(
                padding: AppStyles.stepConatinerPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        tween: Tween<double>(
                          begin: 0,
                          end: (state.currentQuestionIndex + 1) /
                              state.questions.length,
                        ),
                        builder: (context, value, _) =>
                            LinearProgressIndicator(value: value),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    QuestionTitle(
                        question: state.questions[state.currentQuestionIndex]
                                .question ??
                            ''),
                    SingleChildScrollView(
                      child: Wrap(
                        spacing: Get.width * 0.03,
                        runSpacing: Get.width * 0.03,
                        children:
                            state.questions[state.currentQuestionIndex].option!
                                .map(
                                  (e) => SizedBox(
                                    width: Get.width * 0.4,
                                    child: StepButton(
                                      label: e.option!,
                                      iconUrl: e.displayImage!,
                                      selected: state.answerId == e.id,
                                      onSelected: () => state.answerId = e.id,
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {
                          try {
                            await state.answerQuetion(
                                state.questions[state.currentQuestionIndex].id,
                                state.answerId);
                            //move to next
                            if (state.currentQuestionIndex ==
                                state.questions.length - 1) {
                              Get.toNamed(welcome);
                            } else {
                              state.currentQuestionIndex++;
                            }
                          } on DioException catch (e) {
                            if (e.response!.statusCode == 400) {
                              SnackbarHelper.error("Please select an option");
                            } else {
                              SnackbarHelper.error(e.message);
                            }
                          }
                        },
                        child: Text(
                            state.savingAnswer ? 'Please wait...' : 'Continue'),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

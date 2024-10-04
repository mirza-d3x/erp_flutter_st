import 'package:erp_mobile/app/presentation/features/login/cubit/login_cubit.dart';
import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/custom_dropdown.dart';
import 'package:erp_mobile/app/widgets/custom_text_field.dart';
import 'package:erp_mobile/app/widgets/snackbar/custom_snackbar.dart';
import 'package:erp_mobile/constants/assets/image_assets.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginErrorState) {
            showCustomSnackbar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is LoginInitial) {
            return LayoutBuilder(
              builder: (context, constraints) {
                bool isLandscape = constraints.maxWidth > constraints.maxHeight;

                return Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  color: blue100,
                  padding: const EdgeInsets.all(16),
                  child: isLandscape
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AssetImages.splashLogo),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Login",
                                    style: customTextStyle(
                                      fontStyle: FontStyle.headLineSmall,
                                      color: FontColor.fontPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: PhysicalModel(
                                color: blue100,
                                elevation: 5,
                                child: Container(
                                  width: constraints.maxWidth * 0.5,
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextField(
                                        controller: cubit.userNameController,
                                        labelText: "Username",
                                        focusNode: cubit.userNameFocusNode,
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {
                                          cubit.onUserNameChanged(value!);
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      AbsorbPointer(
                                        absorbing:
                                            !state.isPasswordFieldEnabled,
                                        child: Opacity(
                                          opacity: state.isPasswordFieldEnabled
                                              ? 1
                                              : 0.5,
                                          child: CustomTextField(
                                            controller:
                                                cubit.passwordController,
                                            labelText: "Password",
                                            textInputAction:
                                                TextInputAction.next,
                                            focusNode: cubit.passwordFocusNode,
                                            onChanged: (value) {
                                              cubit.onPasswordChanged(value!);
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      AbsorbPointer(
                                        absorbing: !state.isPasswordVerified,
                                        child: Opacity(
                                          opacity: state.isPasswordVerified
                                              ? 1
                                              : 0.5,
                                          child: Column(
                                            children: [
                                              CustomDropdownPicker(
                                                items: state.branches,
                                                selectedValue:
                                                    state.selectedBranches,
                                                onChanged: cubit.selectBranch,
                                              ),
                                              const SizedBox(height: 16),
                                              CustomDropdownPicker(
                                                items: state.financialYears,
                                                selectedValue: state
                                                    .selectedFinancialYeaers,
                                                onChanged: cubit.selectYear,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      CustomElevatedButton(
                                        text: "Sign In",
                                        onPressed: state.isPasswordVerified
                                            ? () {
                                                cubit.onSignin(context);
                                              }
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AssetImages.splashLogo),
                                const SizedBox(height: 16),
                                Text(
                                  "Login",
                                  style: customTextStyle(
                                    fontStyle: FontStyle.headLineSmall,
                                    color: FontColor.fontPrimary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            PhysicalModel(
                              color: blue100,
                              elevation: 5,
                              child: Container(
                                width: constraints.maxWidth * 0.7,
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextField(
                                      controller: cubit.userNameController,
                                      labelText: "Username",
                                      focusNode: cubit.userNameFocusNode,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {
                                        cubit.onUserNameChanged(value!);
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    AbsorbPointer(
                                      absorbing: !state.isPasswordFieldEnabled,
                                      child: Opacity(
                                        opacity: state.isPasswordFieldEnabled
                                            ? 1
                                            : 0.5,
                                        child: CustomTextField(
                                          controller: cubit.passwordController,
                                          labelText: "Password",
                                          textInputAction: TextInputAction.next,
                                          focusNode: cubit.passwordFocusNode,
                                          onChanged: (value) {
                                            cubit.onPasswordChanged(value!);
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    AbsorbPointer(
                                      absorbing: !state.isPasswordVerified,
                                      child: Opacity(
                                        opacity:
                                            state.isPasswordVerified ? 1 : 0.5,
                                        child: Column(
                                          children: [
                                            CustomDropdownPicker(
                                              items: state.branches,
                                              selectedValue:
                                                  state.selectedBranches,
                                              onChanged: cubit.selectBranch,
                                            ),
                                            const SizedBox(height: 16),
                                            CustomDropdownPicker(
                                              items: state.financialYears,
                                              selectedValue:
                                                  state.selectedFinancialYeaers,
                                              onChanged: cubit.selectYear,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    CustomElevatedButton(
                                      text: "Sign In",
                                      onPressed: state.isPasswordVerified
                                          ? () {
                                              cubit.onSignin(context);
                                            }
                                          : null,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

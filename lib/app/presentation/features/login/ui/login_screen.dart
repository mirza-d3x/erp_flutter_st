import 'package:erp_mobile/app/presentation/features/login/cubit/login_cubit.dart';
import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/custom_dropdown.dart';
import 'package:erp_mobile/app/widgets/custom_text_field.dart';
import 'package:erp_mobile/constants/assets/image_assets.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginInitial) {
            return Container(
              height: size.height,
              width: size.width,
              color: blue100,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetImages.splashLogo),
                  SizedBox(height: 16.h),
                  Text(
                    "Login",
                    style: customTextStyle(
                      fontStyle: FontStyle.headLineSmall,
                      color: FontColor.fontPrimary,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  PhysicalModel(
                    color: blue100,
                    elevation: 5,
                    child: Container(
                      width: size.width * .7,
                      padding: EdgeInsets.all(16.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.sp),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: cubit.userNameController,
                                  labelText: "Username",
                                  onChanged: (value) {
                                    cubit.onUserNameChanged(value!);
                                    return null;
                                  },
                                ),
                              ),
                              TextButton(
                                onPressed: state.isUserNameVerifyEnabled
                                    ? () {
                                        cubit.onVerifyUsername(context);
                                      }
                                    : null,
                                style: TextButton.styleFrom(
                                  foregroundColor: state.isUserNameVerifyEnabled
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: Text(!state.isPasswordFieldEnabled
                                    ? 'Verify'
                                    : 'Verified'),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          AbsorbPointer(
                            absorbing: !state.isPasswordFieldEnabled,
                            child: Opacity(
                              opacity: state.isPasswordFieldEnabled ? 1 : 0.5,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      controller: cubit.passwordController,
                                      labelText: "Password",
                                      onChanged: (value) {
                                        cubit.onPasswordChanged(value!);
                                        return null;
                                      },
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: state.isPasswordVerifyEnabled
                                        ? () {
                                            cubit.onVerifyPassword(context);
                                          }
                                        : null,
                                    style: TextButton.styleFrom(
                                      foregroundColor:
                                          state.isPasswordVerifyEnabled
                                              ? Colors.blue
                                              : Colors.grey,
                                    ),
                                    child: Text(state.isPasswordVerified
                                        ? 'Verified'
                                        : 'Verify'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          AbsorbPointer(
                            absorbing: !state.isPasswordVerified,
                            child: Opacity(
                              opacity: state.isPasswordVerified ? 1 : 0.5,
                              child: Column(
                                children: [
                                  CustomDropdownPicker(
                                    items: state.branches,
                                    selectedValue: state.selectedBranches,
                                    onChanged: cubit.selectBranch,
                                  ),
                                  SizedBox(height: 16.h),
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
                          SizedBox(height: 16.h),
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
          }
          return Container();
        },
      ),
    );
  }
}

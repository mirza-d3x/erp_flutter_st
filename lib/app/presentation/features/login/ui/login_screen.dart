import 'package:erp_mobile/app/presentation/features/login/cubit/login_cubit.dart';
import 'package:erp_mobile/app/widgets/custom_button.dart';
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
      body: Container(
        height: size.height,
        width: size.width,
        color: blue100,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetImages.splashLogo,
              // height: 250.sp,
              // width: 250.sp,
            ),
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
                    CustomTextField(
                      controller: cubit.userNameController,
                      labelText: "Username",
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: cubit.passwordController,
                      labelText: "Password",
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: cubit.branchController,
                      labelText: "Branch",
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: cubit.yearController,
                      labelText: "Year",
                    ),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      text: "Sign  In",
                      onPressed: cubit.onSignin,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

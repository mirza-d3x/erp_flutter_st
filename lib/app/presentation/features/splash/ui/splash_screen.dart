import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/assets/image_assets.dart';
import '../cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<SplashCubit>(context).init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.92, 0.39),
            end: Alignment(0.92, -0.39),
            colors: [
              Color(0xFFB1FCFF),
              Color(0xFFFFF4B3),
            ],
          ),
        ),
        child: Image.asset(
          width: 220,
          height: 160,
          AssetImages.splashLogo,
        ),
      ),
    );
  }
}

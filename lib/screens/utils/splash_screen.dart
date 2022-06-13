import 'package:aip_poc/config/app_color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColorConstants.primaryColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.2,
                  colorFilter: ColorFilter.mode(
                      AppColorConstants.primaryColor, BlendMode.softLight),
                  image: const AssetImage("assets/images/login-bg.jpg"),
                ),
              ),
              // child: Image(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height,
              //   fit: BoxFit.cover,
              //   opacity: ,
              //   image: const AssetImage("assets/images/login-bg.jpg"),
              // ),
              // child: SvgPicture.asset('assets/svg-icons/launcher.svg'),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 28.0,
                ),
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

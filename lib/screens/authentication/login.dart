import 'package:aip_poc/config/app_color_constants.dart';
import 'package:aip_poc/config/app_font_constants.dart';
import 'package:aip_poc/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool _passwordVisible = false;
  late AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _loginErrorStatus = false;

  void _requestPassFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocusNode);
    });
  }

  void _requestEmailFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  bool _isEmailValidate(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SvgPicture.asset('assets/svg-icons/login-bg.svg'),
              _buildTopBanner(context),
              Container(
                padding: const EdgeInsets.only(
                  left: 36.0,
                  top: 64.0,
                  right: 36.0,
                  bottom: 32.0,
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: _autovalidateMode,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildEmailTextField(),
                      const SizedBox(height: 20.0),
                      _buildPasswordField(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildForgetPass(),
                      const SizedBox(height: 20.0),
                      _buildErrorMssg(context),
                      Visibility(
                        visible: _loginErrorStatus,
                        child: const SizedBox(height: 20.0),
                      ),
                      _buildLoginBtn(context),
                      // dont have account title?
                      Container(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Don't have an account ? Please Contact",
                            style: TextStyle(
                              color: AppColorConstants.primaryColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      // Contact number
                      Container(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "A Pattern Medical Clinic (423) 455-2711",
                            style: TextStyle(
                              color: AppColorConstants.primaryColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Login button
  ElevatedButton _buildLoginBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _loginErrorStatus = false;
        });

        if (_formKey.currentState!.validate()) {
          // text editor focus remove with hide keyboard
          FocusScope.of(context).requestFocus(FocusNode());
          _loginAction();
        } else {
          setState(() {
            _autovalidateMode = AutovalidateMode.onUserInteraction;
          });
        }
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColorConstants.primaryColor),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 48.0,
        ),
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            fontFamily: AppFontConstants.nunitaSans,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Visibility _buildErrorMssg(BuildContext context) {
    return Visibility(
      visible: _loginErrorStatus,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD2D2),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: const Text(
          "Invalid email or password",
          style: TextStyle(
            color: Color(0xFFD8000C),
          ),
        ),
      ),
    );
  }

  // Forget password widget
  SizedBox _buildForgetPass() {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot password?",
          style: TextStyle(
            color: AppColorConstants.primaryColor,
            fontFamily: AppFontConstants.nunitaSans,
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  // Password field
  TextFormField _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_passwordVisible,
      focusNode: passwordFocusNode,
      onTap: _requestPassFocus,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        color: const Color(0xFF757677),
        fontFamily: AppFontConstants.nunitaSans,
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.deny(
          RegExp(r"\s"),
        ),
      ],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorConstants.primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFD8000C),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorConstants.primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFD8000C),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error)
              ? const Color(0xFFD8000C)
              : (states.contains(MaterialState.focused)
                  ? AppColorConstants.primaryColor
                  : const Color(0xFFA4A4A4));
          return TextStyle(color: color);
        }),
        hintText: "Enter Password",
        hintStyle: TextStyle(
          color: const Color(0xFF757677),
          fontFamily: AppFontConstants.nunitaSans,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset('assets/svg-icons/auth-lock-open.svg'),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            !_passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColorConstants.primaryColor,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          // setState(() {
          //   _hasPassError = true;
          // });
          return "Please enter your password";
        }
        // setState(() {
        //   _hasPassError = false;
        // });
        return null;
      },
    );
  }

  // Email field
  TextFormField _buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      focusNode: emailFocusNode,
      onTap: _requestEmailFocus,
      style: TextStyle(
        color: const Color(0xFF757677),
        fontFamily: AppFontConstants.nunitaSans,
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
      ),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FilteringTextInputFormatter.deny(
          RegExp(r"\s"),
        ),
      ],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorConstants.primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFD8000C),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorConstants.primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFD8000C),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error)
              ? const Color(0xFFD8000C)
              : (states.contains(MaterialState.focused)
                  ? AppColorConstants.primaryColor
                  : const Color(0xFFA4A4A4));
          return TextStyle(color: color);
        }),
        hintText: "Enter Email",
        hintStyle: TextStyle(
          color: const Color(0xFF757677),
          fontFamily: AppFontConstants.nunitaSans,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset('assets/svg-icons/auth-avatar.svg'),
        ),
      ),
      validator: (value) {
        var email = value!.trim();
        if (email.isEmpty) {
          return "Please enter your email";
        } else if (!_isEmailValidate(email)) {
          return "Please enter valid email";
        }
        return null;
      },
    );
  }

  // Top Banner Design
  Container _buildTopBanner(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 3.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.0,
            decoration: BoxDecoration(
              color: AppColorConstants.primaryColor,
              // Transparent Image
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppColorConstants.primaryColor,
                  BlendMode.softLight,
                ),
                opacity: 0.2,
                image: const AssetImage("assets/images/login-bg-login.jpg"),
              ),
            ),
          ),
          // Logo
          const Center(
            child: Image(
              width: 80.0,
              height: 80.0,
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ],
      ),
      // child: Image(
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      //   fit: BoxFit.cover,
      //   opacity: ,
      //   image: const AssetImage("assets/images/login-bg.jpg"),
      // ),
      // child: SvgPicture.asset('assets/svg-icons/launcher.svg'),
    );
  }

  // Login action
  _loginAction() {
    var email = (_emailController.text.trim()).toLowerCase();
    var password = _passwordController.text.trim();
    if (email == "demo@example.com" && password == "demo") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const Home(),
        ),
      );
    } else {
      _passwordController.clear();
      setState(() {
        _loginErrorStatus = true;
        _autovalidateMode = AutovalidateMode.disabled;
      });
    }
  }
}

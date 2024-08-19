import 'dart:ffi';

import 'package:boost_test/app/dependency_injection.dart';
import 'package:boost_test/app/functions.dart';
import 'package:boost_test/view/app_bloc/bloc/app_bloc.dart';
import 'package:boost_test/view/login/bloc/login_bloc.dart';
import 'package:boost_test/view/recources/app_router.dart';
import 'package:boost_test/view/recources/color_manager.dart';
import 'package:boost_test/view/recources/values_manager.dart';
import 'package:boost_test/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child:
          BlocConsumer<LoginBloc, LoginState>(listener: (context, state) async {
        if (state.loginStateStatus == LoginStateStatus.success) {
          await resetAllModules();
          if (mounted) {
            context.read<AppBloc>().add(CheckLoggedInEvent());
            context.goNamed(RoutePaths.home);
          }
        }
        if (state.loginStateStatus == LoginStateStatus.error) {
          showToast(message: state.errorMessage, toastState: ToastState.error);
        }
      }, builder: (context, state) {
        return Scaffold(
            body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizeW.s32, vertical: AppSizeH.s19),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // height: AppSizeH.s83,
                  width: AppSizeW.s184,
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: AppSizeSp.s34,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: AppSizeH.s36,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'User name or phone number',
                    hintStyle: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    contentPadding: EdgeInsets.all(AppSizeSp.s14),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey, 
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(AppSizeR.s8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors
                            .grey,
                        width: 1, 
                      ),
                      borderRadius: BorderRadius.circular(AppSizeR.s8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors
                            .grey, 
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(AppSizeR.s8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: AppSizeSp.s20,
                    ),
                  ),
                  controller: phoneController,
                  onChanged: (v) {
                    setState(() {});
                  },
                  onTap: () {},
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppSizeH.s31,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(AppSizeSp.s14),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey, 
                        width: 1.0, 
                      ),
                      borderRadius: BorderRadius.circular(AppSizeR.s8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors
                            .grey, 
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(AppSizeR.s8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:const BorderSide(
                        color: Colors
                            .grey, 
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(AppSizeR.s8),
                    ),

                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "Password",
                  ),
                  controller: passwordController,
                  obscureText: isObscureText,
                  onChanged: (v) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: AppSizeH.s9,
                ),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: ColorManager.pink),
                        ))
                  ],
                ),
                SizedBox(
                  height: AppSizeH.s52,
                ),
                Builder(
                  builder: (context) {
                       if(state.loginStateStatus == LoginStateStatus.loading){
                      return LinearProgressIndicator(color: ColorManager.pink,);
                    }
                    return CustomButton(
                        onPressed:() async {
                              await resetAllModules();
                              FocusManager.instance.primaryFocus?.unfocus();
                              context.read<LoginBloc>().add(NormalLoginEvent(
                                userName: phoneController.text,
                                password: passwordController.text,
                              ));
                            
                          },
                        text: "Login");
                  }
                )
              ],
            ),
          ),
        ));
      }),
    );
  }
}

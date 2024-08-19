import 'package:boost_test/view/recources/color_manager.dart';
import 'package:boost_test/view/recources/values_manager.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool? isLoading;
  const CustomButton({super.key, required this.onPressed, required this.text ,this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (isLoading ?? false)
            ? null
            : onPressed,
        style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: ColorManager.pink,
                shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(AppSizeR.s4)),
                
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isLoading != true,
                child: Text(text)
            ),
            Visibility(
              visible: isLoading ?? false,
                child: const CircularProgressIndicator()
            ),
          ],
        ),

  ));
  }
}


class SecondaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const SecondaryButton({super.key, required this.onPressed, required this.text});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black , width: 1,) , borderRadius: BorderRadius.circular(AppSizeR.s4))
          ),
        ));
  }
}

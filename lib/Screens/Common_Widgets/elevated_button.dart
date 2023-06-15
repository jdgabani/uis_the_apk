import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_the_apk/Constants/color.dart';
import 'package:uis_the_apk/Constants/colors.dart';
import 'package:uis_the_apk/Constants/text_style.dart';


class CommonElevatedButton extends StatefulWidget {
  const CommonElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  State<CommonElevatedButton> createState() => _CommonElevatedButtonState();
}

class _CommonElevatedButtonState extends State<CommonElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          PickColor.secondaryColor,
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(388.w, 56.h),
        ),
      ),
      child: Text(
        widget.text,
        style: buttonText,
      ),
    );
  }
}


class CommonElevatedPerviousButton extends StatefulWidget {
  const CommonElevatedPerviousButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  State<CommonElevatedPerviousButton> createState() =>
      _CommonElevatedPerviousButtonState();
}

class _CommonElevatedPerviousButtonState
    extends State<CommonElevatedPerviousButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        minimumSize: MaterialStateProperty.all(Size(121.w, 56.h)),
        side: MaterialStateProperty.all(
          const BorderSide(color: AppColor.blueColor),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        "Pervious",
        style: TextStyle(fontSize: 20.sp,color: PickColor.secondaryColor,fontWeight: FontWeight.w400,),
      ),
    );
  }
}


class CommonElevatedSmallButton extends StatefulWidget {
  const CommonElevatedSmallButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  State<CommonElevatedSmallButton> createState() =>
      _CommonElevatedSmallButtonState();
}

class _CommonElevatedSmallButtonState extends State<CommonElevatedSmallButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(PickColor.secondaryColor),
        minimumSize: MaterialStateProperty.all(Size(121.w, 56.h)),
      ),
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w400,),
      ),
    );
  }
}
import 'package:doctorhunt/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:doctorhunt/core/theme/custom_text.dart';
import 'package:doctorhunt/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'reset_password_bottom_sheet.dart';

class EnterCodeBottomSheet extends StatefulWidget {
  const EnterCodeBottomSheet({super.key});

  @override
  State<EnterCodeBottomSheet> createState() => _EnterCodeBottomSheetState();
}

class _EnterCodeBottomSheetState extends State<EnterCodeBottomSheet> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void submit() {
    if (!formKey.currentState!.validate()) return;

    context.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const ResetPasswordBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 130.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xffC4C4C4),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            CustomText(
              text: 'Enter 4 Digits Code',
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: height * 0.012),
            CustomText(
              text: 'Enter the 4 digits code that you received on your email.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontColor: const Color(0xff677294),
            ),
            SizedBox(height: height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 54.w,
                  child: DefaultTextField(
                    hintText: "",
                    textAlign: TextAlign.center,  
                    controller: controllers[index],
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, 
                      LengthLimitingTextInputFormatter(
                        1,
                      ), 
                    ],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: height * 0.03),
            CustomButton(
              text: 'Continue',
              height: 50.h,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              radius: 12.r,
              onTap: submit,
            ),
            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    );
  }
}

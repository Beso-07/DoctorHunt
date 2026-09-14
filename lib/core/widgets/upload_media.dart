import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadMedia extends StatefulWidget {
  const UploadMedia({
    super.key,
    this.title = 'Upload Image For Your Profile',
    required this.onImageSelected,
    this.validator,
  });

  final String title;
  final ValueChanged<File?> onImageSelected;
  final String? Function(File?)? validator;

  @override
  State<UploadMedia> createState() => _UploadMediaState();
}

class _UploadMediaState extends State<UploadMedia> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.onImageSelected(_selectedImage);
    }
  }

  void _showImagePickerBottomSheet(
      BuildContext context, FormFieldState<File> state) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext ctx) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                        child: Text(
                          'Photo Gallery',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff04332D),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(ctx);
                        _pickImage(ImageSource.gallery).then((_) {
                          state.didChange(_selectedImage);
                        });
                      },
                    ),
                    const Divider(height: 1, color: Colors.grey),
                    ListTile(
                      title: Center(
                        child: Text(
                          'Camera',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff04332D),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(ctx);
                        _pickImage(ImageSource.camera).then((_) {
                          state.didChange(_selectedImage);
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff04332D),
                      ),
                    ),
                  ),
                  onTap: () => Navigator.pop(ctx),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<File>(
      validator: widget.validator,
      initialValue: _selectedImage,
      builder: (FormFieldState<File> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _showImagePickerBottomSheet(context, state),
              child: DottedBorder(
                color: state.hasError ? Colors.red : const Color(0xff04332D),
                strokeWidth: 1.5,
                dashPattern: const [6, 4],
                borderType: BorderType.RRect,
                radius: Radius.circular(10.r),
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: _selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/upload_icon.svg', width: 40.w),
                            SizedBox(height: 8.h),
                            Text(
                              'Select file',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff04332D),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            if (state.hasError) ...[
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
import 'dart:io';

import 'package:el_afrik_restaurant/controllers/main_nav/main_nav_controller.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../widgets/custom_card_widget.dart';

class QrScanScreen extends StatelessWidget {

   QrScanScreen({super.key});

   RxString debugCode = "SWB-QR-9842736590".obs;

  final MobileScannerController _controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text( "Qr Code",
        style: TextStyle(
          fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
        leading: SizedBox.shrink()
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: AppStrings.scanQrCode.tr,
                fontSize: 22,
                fontWeight: FontWeight.w900,
                textAlignment: TextAlign.left,
              ),
            ),
            SizedBox( height: 10.h,),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: AppStrings.pointYourCamera.tr,
                fontWeight: FontWeight.w800,
                textAlignment: TextAlign.left,
                fontSize: 16,
                fontColor: AppColors.black32,
              ),
            ),
            SizedBox(height: 44.h),
            SizedBox(
              width: 200.h,
              height: 200.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    //Live Camera
                  MobileScanner(
                  controller: _controller,
                  onDetect: (capture) async {
                    final barcode = capture.barcodes.first;
                    final String? code = barcode.rawValue;

                    if (code != null && code.isNotEmpty && code != debugCode.value) {
                      debugCode.value = code;
                      print("Codeeeeeeeeeeee: ${code}");
                      await _controller.stop(); // stop after scan
                    }
                  },
                ),

                    // 🎨 Corner Border Overlay
                    CustomPaint(
                      size: const Size(double.infinity, double.infinity),
                      painter: _ScannerCornerPainter(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
          TextWidget(
            text: "Show Code Here",
            fontColor: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          ),
            SizedBox(height: 16.h),
            CustomCard(
              height: 52.h,
              width: 279.w,
              child: Center(
                child:  Obx((){
                  return TextWidget(
                    text: debugCode.value,
                    fontColor: AppColors.greenPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  );
                }),
              ),
            ),
            SizedBox(height: 30.h,),
            GestureDetector(
              onTap: (){
                scanFromGallery();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.greenPrimary,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget(text: AppStrings.uploadFromGallery.tr,
                    fontColor: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    Icon(Icons.file_upload_outlined, color: AppColors.white,)
                  ],
                ),
              ),
            ),

            SizedBox( height: 25.h,),

            GestureDetector(
              onTap: (){
                _controller.start();
              },
              child: Container(
                padding: EdgeInsets.all( 8.r ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2.r,
                    color: AppColors.greenPrimary
                  )
                ),
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: AppColors.greenPrimary,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 1.r,
                          color: AppColors.greenPrimary
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

   //SCAN PICKED IMAGE
   Future<String?> scanFromGallery() async {
     final ImagePicker picker = ImagePicker();
     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
     if (image == null) return null;

     final BarcodeCapture? capture = await _controller.analyzeImage(image.path);

     if (capture != null && capture.barcodes.isNotEmpty) {
       final String? code = capture.barcodes.first.rawValue;
       debugCode.value = code!;
       print("Found QR Code: $code");
       return code;
     }

     print("No QR code found in image.");
     return null;
   }
}

//=============================
//Only Corner Painter
//=============================
class _ScannerCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 8
          .w
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const double cornerLength = 35;

    //top-left corner
    canvas.drawLine(const Offset(0, 0), Offset(cornerLength, 0), paint);
    canvas.drawLine(const Offset(0, 0), Offset(0, cornerLength), paint);

    //top-right corner
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width - cornerLength, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, cornerLength),
      paint,
    );

    //bottom-left corner
    canvas.drawLine(
      Offset(0, size.height),
      Offset(cornerLength, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(0, size.height - cornerLength),
      paint,
    );

    //bottom-right corner
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - cornerLength, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, size.height - cornerLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

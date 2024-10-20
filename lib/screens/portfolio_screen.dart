import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcg_collection_app/utils/extensions/extensions.dart';
import 'package:tcg_collection_app/widgets/app_assets.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('My Portfolio'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 39.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xffD8DADC),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xffD8DADC),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AppAssets.fruitsCat),
                    SizedBox(height: 8.h),
                    Text(
                      softWrap: true,
                      'Organic Bananas',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                        color: const Color(0xff181725),
                      ),
                    ),
                    Text('Qty:02'),
                  ],
                ).padAll(16),
              ),
            ],
          ),
        ],
      ).padAll(12),
    );
  }
}

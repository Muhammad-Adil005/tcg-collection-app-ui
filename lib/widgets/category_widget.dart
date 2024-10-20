import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcg_collection_app/screens/screens.dart';

import '../model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryWidget({
    required this.categoryModel,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenhight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          elevation: 0.0,
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) => _buildBottomSheetContent(context),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 150.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(categoryModel.image),
                    fit: BoxFit.scaleDown,
                    onError: (error, stackTrace) {
                      debugPrint("Failed to load image: $error");
                    },
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryModel.catName,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff181725),
                  ),
                ),
                Text(
                  categoryModel.catDescription,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff7C7C7C),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('\$4.99'),
                    Container(
                      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                      width: 46.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: const Color(0xff53B175),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ).padOnly(bottom: 8.h),
              ],
            ).padOnly(left: 8.w, right: 8.w),
          ],
        ),
      ),
    );
  }

// BottomSheet content
  Widget _buildBottomSheetContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(height: 16.h),
        Center(
          child: Image.asset(
            categoryModel.image,
            height: 150.h,
            width: 150.w,
          ),
        ),
        Text(
          categoryModel.catName,
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          categoryModel.catDescription,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Product Detail",
          style: GoogleFonts.montserrat(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff181725),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
          softWrap: true,
          style: GoogleFonts.montserrat(
            color: const Color(0xff7C7C7C),
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {},
              color: Colors.grey,
            ),
            SizedBox(width: 8.w),
            Container(
              width: 37.w,
              height: 37.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xffE2E2E2),
                ),
              ),
              child: const Center(
                child: Text('1'),
              ),
            ),
            SizedBox(width: 8.w),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
              color: Colors.green,
            ),
          ],
        ),
        SizedBox(height: 32.h),
      ],
    ).padOnly(left: 16.w, right: 16.w);
  }
}

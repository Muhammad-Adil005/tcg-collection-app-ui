import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcg_collection_app/screens/screens.dart';

class SearchButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isSelected;

  const SearchButtonWidget({
    super.key,
    this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150.w,
        height: 55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: const Color(0xff53B175),
          color: isSelected ? const Color(0xff53B175) : const Color(0xffEEEEEE),
        ),
        child: Center(
          child: Text(
            'Search',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: isSelected ? Colors.white : const Color(0xff53B175),
            ),
          ),
        ),
      ),
    );
  }
}

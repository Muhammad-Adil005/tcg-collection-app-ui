import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tcg_collection_app/providers/search_provider.dart';
import 'package:tcg_collection_app/utils/extensions/paddings_ext.dart';

import '../model/category_model.dart';
import '../widgets/app_assets.dart';
import '../widgets/app_strings.dart';
import '../widgets/category_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryList = [
      CategoryModel(
        image: AppAssets.fruitsCat,
        catName: AppStrings.fruits,
        catDescription: AppStrings.fruitsDesciption,
      ),
      CategoryModel(
        image: AppAssets.vegCat,
        catName: AppStrings.veg,
        catDescription: AppStrings.fruitsDesciption,
      ),
      CategoryModel(
        image: AppAssets.grainsCat,
        catName: AppStrings.grains,
        catDescription: AppStrings.fruitsDesciption,
      ),
      CategoryModel(
        image: AppAssets.nutsCat,
        catName: AppStrings.nuts,
        catDescription: AppStrings.fruitsDesciption,
      ),
      CategoryModel(
        image: AppAssets.spicesCat,
        catName: AppStrings.spices,
        catDescription: AppStrings.fruitsDesciption,
      ),
      CategoryModel(
        image: AppAssets.spinachCat,
        catName: AppStrings.spinach,
        catDescription: AppStrings.fruitsDesciption,
      )
    ];
    return ChangeNotifierProvider(
      lazy: false,
      create: (_) => SearchProvider(),
      child:
          Consumer<SearchProvider>(builder: (context, searchProvider, child) {
        return Scaffold(
          backgroundColor: const Color(0xfff1fdf3),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              TextFormField(
                initialValue: searchProvider.searchText,
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some value';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF6F6F6),
                  hintText: 'Search Catalog',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFFAAA6B9),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color(0xFFE8E8E8),
                      width: 1.w, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color(0xFFE8E8E8),
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: const Color(0xFFE8E8E8),
                      width: 1.w,
                    ),
                  ),
                ),
                onChanged: (text) {
                  searchProvider.updateSearchText(text);
                },
              ),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: categoryList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 180 / 200,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      categoryModel: categoryList[index],
                    );
                  },
                ),
              ),
            ],
          ).padOnly(top: 32, left: 16.w, right: 16.w),
        );
      }),
    );
  }
}

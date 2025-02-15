import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/Color.dart';
import '../../provider/CategoryProvider.dart';

class CategorySection extends StatelessWidget {
  final Categoryprovider categoryprovider;
  const CategorySection({super.key, required this.categoryprovider});

  @override
  Widget build(BuildContext context) {
    return categoryprovider.categoryList.isNotEmpty
        ? SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryprovider.categoryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 16.0),
            child: Column(
              children: [
                Center(
                  child: ClipOval(
                    child: Container(
                      height: 50,
                      width: 50,
                      color:
                      categorylistviewbackgroundColor,
                      child: Center(
                        child: SvgPicture.network(
                          categoryprovider
                              .categoryList[index]
                              .categoryIcon!,
                          placeholderBuilder: (context) =>
                              CircularProgressIndicator(
                                  color:
                                  categorylistviewbackgroundColor,
                                  backgroundColor:
                                  primaryBrown),
                          height: 25,
                          width: 25,
                          colorFilter: ColorFilter.mode(
                              primaryBrown,
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  categoryprovider
                      .categoryList[index].categoryName!,
                  style: TextStyle(
                    fontSize: 12,
                    color: primaryBrown,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    )
        : const Center(child: CircularProgressIndicator());
  }
}

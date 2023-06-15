import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/shared/shared.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 22.w),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.5),
              spreadRadius: 1.0,
              blurRadius: 30.0,
              offset: const Offset(0, 30),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 22.w,
                vertical: 16.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: FittedBox(
                        child: CachedNetworkImage(
                          imageUrl: "https://picsum.photos/200/300",
                          height: 80.h,
                          width: 80.w,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, download) {
                            return Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: CircularProgressIndicator(
                                value: download.progress,
                                strokeWidth: 1.5,
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Icon(Icons.image),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Gap.w16,
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Restuarant Name",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(fontSize: setFontSize(24))
                              .semiBold,
                        ),
                        Gap.h8,
                        Text(
                          "Restuara  sada d asdd nt Descrip sdtionsadasda ass asdda sasd asddsadsa",
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onPrimary,
              thickness: 0.8,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 22.0.w,
                vertical: 16.0.h,
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(
                          Icons.star_rounded,
                          color: Colors.white,
                          size: 22.0,
                        ),
                      ),
                      Gap.w16,
                      Text(
                        "4.5",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: setFontSize(
                                16,
                              ),
                            ),
                      ),
                    ],
                  ),
                  Gap.w24,
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(
                          Icons.location_on_rounded,
                          color: AppColors.white,
                          size: 22.0,
                        ),
                      ),
                      Gap.w16,
                      Text(
                        "Location Restaurant",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: setFontSize(
                                16,
                              ),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

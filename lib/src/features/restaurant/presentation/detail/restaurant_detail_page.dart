import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:readmore/readmore.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: [
        const BackButtonWidget(),
        Text(
          'Name Restaurant',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_rounded),
          splashRadius: 24.0,
          splashColor: Colors.grey[200],
          padding: EdgeInsets.zero,
          iconSize: 24.0,
        )
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 22.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageDetailWidget(),
              Gap.h16,
              Row(
                children: [
                  ChipWidget(name: "Makanan", isFirst: true, onTap: () {})
                ],
              ),
              Text("Name Restaurant",
                  style: Theme.of(context).primaryTextTheme.headlineMedium),
              Gap.h16,
              Row(
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
                      Text("4.5",
                          style: Theme.of(context).textTheme.titleMedium),
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
                        "Surabaya",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
              Gap.h8,
              ReadMoreText(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                trimLines: 5,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Tampilkan lebih banyak',
                trimExpandedText: 'Tampilkan lebih sedikit',
                textAlign: TextAlign.justify,
                colorClickableText: Theme.of(context).colorScheme.secondary,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(letterSpacing: 0.2),
                moreStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Gap.h8
            ],
          ),
        ),
      ),
    );
  }
}

class ImageDetailWidget extends StatelessWidget {
  const ImageDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: CachedNetworkImage(
        imageUrl:
            'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg?w=1380&t=st=1687648514~exp=1687649114~hmac=2958913942d0cb863d91355ef76ed5799455226dd18767baf3b28338cc559d02',
        fit: BoxFit.cover,
        height: 200.h,
        width: MediaQuery.of(context).size.width,
        progressIndicatorBuilder: (context, url, download) {
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: FittedBox(
              child: CircularProgressIndicator(
                value: download.progress,
                color: Theme.of(context).colorScheme.primary,
                strokeWidth: 1.5,
              ),
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
    );
  }
}

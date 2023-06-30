import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageDetailSection extends StatelessWidget {
  final String imageUrl;
  const ImageDetailSection({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
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

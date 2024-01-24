import 'package:flutter/material.dart';
import 'package:flutter_advance/model/banner/banner_model.dart';

class BannerList extends StatelessWidget {
  final List<BannerModel> banners;

  const BannerList({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: banners.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final banner = banners[index];

          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                banner.eventImage ?? '',
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }
}

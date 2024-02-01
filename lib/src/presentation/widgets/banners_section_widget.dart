

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/banner/banner_cubit.dart';
import 'banner_list.dart';

class BannersSectionWidget extends StatelessWidget {
  const BannersSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if (state is BannerSuccess) {
          return BannerList(banners: state.bannerList);
        }

        if (state is BannerError) {
          return Center(
            child: Text(state.errorMessage ?? 'Something Went Wrong'),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

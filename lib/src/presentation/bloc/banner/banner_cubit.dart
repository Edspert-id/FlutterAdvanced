import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/banner_repository.dart';
import '../../../domain/entities/banner_model.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  Future<void> getBanners() async {
    emit(BannerLoading());

    final bannerRepository = BannerRepository();

    final response = await bannerRepository.getBanners();

    emit(BannerSuccess(bannerList: response.data ?? []));
  }
}

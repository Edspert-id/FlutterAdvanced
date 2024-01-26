import 'package:flutter_advance/model/banner/banner_model.dart';
import 'package:flutter_advance/repository/banner_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  void getBanners() async {
    emit(BannerLoading());

    final bannerRepository = BannerRepository();

    final response = await bannerRepository.getBanners();

    emit(BannerSuccess(bannerList: response.data ?? []));
  }
}

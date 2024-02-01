part of 'banner_cubit.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerSuccess extends BannerState {
  final List<BannerModel> bannerList;

  BannerSuccess({required this.bannerList});
}

final class BannerError extends BannerState {
  final String? errorMessage;

  BannerError({this.errorMessage});
}

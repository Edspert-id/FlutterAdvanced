import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(const BaseState(featureIndex: 0));

  void changeFeature(int index) {
    emit(BaseState(featureIndex: index));
  }
}

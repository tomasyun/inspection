import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.banner: _initBannerData,
      HomeAction.getModels: _onGetHomeModels,
    },
  );
}

HomeState _onAction(
  HomeState state,
  Action action,
) {
  final HomeState newState = state.clone();
  return newState;
}

HomeState _onGetHomeModels(
  HomeState state,
  Action action,
) {
  HomeState newState = state.clone();
  newState.model = action.payload;
  return newState;
}

HomeState _initBannerData(
  HomeState state,
  Action action,
) {
  HomeState newState = state.clone();
  newState.banners = action.payload;
  return newState;
}


part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadHomeScreen() = _LoadHomeScreen;
  const factory HomeEvent.updateFocusedDate({required DateTime focusedDate}) = _UpdateFocusedDate;

  const factory HomeEvent.updateBottomNavigationIndex({required int index}) = _UpdateBottomNavigationIndex;
}
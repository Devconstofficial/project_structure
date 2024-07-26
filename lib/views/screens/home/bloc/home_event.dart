
part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadHomeScreen({required BuildContext context, required int stepCountStreamFrom}) = _LoadHomeScreen;
  const factory HomeEvent.updateFocusedDate({required DateTime focusedDate}) = _UpdateFocusedDate;

  const factory HomeEvent.updateBottomNavigationIndex({required int index}) = _UpdateBottomNavigationIndex;
}
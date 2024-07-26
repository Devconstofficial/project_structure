
part of 'home_bloc.dart';



enum HomeLoadingBlocStatus {
  isUnknown,
  isLoading,
  isSuccess,
  isFail
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required HomeLoadingBlocStatus homeLoadingBlocStatus,
    required int currentIndex,
    required int clockFrameValue,
    required int workOutStreakInDays,
    required int caloriesBurnt,
    required int proteinNeeded,
    required int carbsNeeded,
    required int totalWalkedSteps,
    required int totalWalkedStepsAndroidFirst,
    required int totalSleep,
    required int totalWaterConsumed,
    required int totalHeartBeat,
    required String fatRatio,
    required String todayWorkout,
    required DateTime focusedDate,
    required List<AssetImage> bottomNavigationImages,
    required List<HeartBeatModel> heartBeatModel,
    required List<MealModel> mealModel,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(
      homeLoadingBlocStatus: HomeLoadingBlocStatus.isUnknown,
      focusedDate: DateTime.now(),
      bottomNavigationImages: [const AssetImage(Assets.imagesHome),const AssetImage(Assets.imagesMeal),const AssetImage(Assets.imagesWorkout),const AssetImage(Assets.imagesGroceries),const AssetImage(Assets.imagesFitCoin),const AssetImage(Assets.imagesMenu)],
        mealModel: [
          MealModel(name: "Grilled Chicken Quinoa Bowl", calories: "250kcal, 14p, 10f, 32c", assets: Assets.imagesMeal1, isFavorite: true),
          MealModel(name: "Grilled Chicken Quinoa Bowl", calories: "250kcal, 14p, 10f, 32c", assets: Assets.imagesMeal2, isFavorite: false),
          MealModel(name: "Grilled Chicken Quinoa Bowl", calories: "250kcal, 14p, 10f, 32c", assets: Assets.imagesMeal3, isFavorite: false)
        ],
      heartBeatModel: [
        HeartBeatModel(beats: 70, minutes: 1),
        HeartBeatModel(beats: 75, minutes: 2),
        HeartBeatModel(beats: 80, minutes: 3),
        HeartBeatModel(beats: 72, minutes: 4),
        HeartBeatModel(beats: 78, minutes: 5),
        HeartBeatModel(beats: 76, minutes: 6),
        HeartBeatModel(beats: 70, minutes: 7),
        HeartBeatModel(beats: 75, minutes: 8),
        HeartBeatModel(beats: 80, minutes: 9),
        HeartBeatModel(beats: 72, minutes: 10),
        HeartBeatModel(beats: 78, minutes: 11),
        HeartBeatModel(beats: 76, minutes: 12),
        HeartBeatModel(beats: 70, minutes: 13),
        HeartBeatModel(beats: 75, minutes: 14),
        HeartBeatModel(beats: 80, minutes: 15),
        HeartBeatModel(beats: 72, minutes: 16),
        HeartBeatModel(beats: 78, minutes: 17),
        HeartBeatModel(beats: 76, minutes: 18),
        HeartBeatModel(beats: 70, minutes: 19),
        HeartBeatModel(beats: 75, minutes: 20),
        HeartBeatModel(beats: 80, minutes: 21),
        HeartBeatModel(beats: 72, minutes: 22),
        HeartBeatModel(beats: 78, minutes: 23),
        HeartBeatModel(beats: 76, minutes: 24),
      ],
      clockFrameValue: 0,
      totalWalkedSteps: 0,
      totalWalkedStepsAndroidFirst: 0,
      totalWaterConsumed: 3,
      totalSleep: 6,
      totalHeartBeat: 95,
      workOutStreakInDays: 11,
      proteinNeeded: 75,
      carbsNeeded: 300,
      fatRatio: "Flexible",
      todayWorkout: "Rest Day",
      caloriesBurnt: 3200,
      currentIndex: 0,
    );
  }
}
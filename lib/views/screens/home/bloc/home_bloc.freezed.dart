// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHomeScreen,
    required TResult Function(DateTime focusedDate) updateFocusedDate,
    required TResult Function(int index) updateBottomNavigationIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHomeScreen,
    TResult? Function(DateTime focusedDate)? updateFocusedDate,
    TResult? Function(int index)? updateBottomNavigationIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHomeScreen,
    TResult Function(DateTime focusedDate)? updateFocusedDate,
    TResult Function(int index)? updateBottomNavigationIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHomeScreen value) loadHomeScreen,
    required TResult Function(_UpdateFocusedDate value) updateFocusedDate,
    required TResult Function(_UpdateBottomNavigationIndex value)
        updateBottomNavigationIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHomeScreen value)? loadHomeScreen,
    TResult? Function(_UpdateFocusedDate value)? updateFocusedDate,
    TResult? Function(_UpdateBottomNavigationIndex value)?
        updateBottomNavigationIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHomeScreen value)? loadHomeScreen,
    TResult Function(_UpdateFocusedDate value)? updateFocusedDate,
    TResult Function(_UpdateBottomNavigationIndex value)?
        updateBottomNavigationIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadHomeScreenImplCopyWith<$Res> {
  factory _$$LoadHomeScreenImplCopyWith(_$LoadHomeScreenImpl value,
          $Res Function(_$LoadHomeScreenImpl) then) =
      __$$LoadHomeScreenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadHomeScreenImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LoadHomeScreenImpl>
    implements _$$LoadHomeScreenImplCopyWith<$Res> {
  __$$LoadHomeScreenImplCopyWithImpl(
      _$LoadHomeScreenImpl _value, $Res Function(_$LoadHomeScreenImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadHomeScreenImpl implements _LoadHomeScreen {
  const _$LoadHomeScreenImpl();

  @override
  String toString() {
    return 'HomeEvent.loadHomeScreen()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadHomeScreenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHomeScreen,
    required TResult Function(DateTime focusedDate) updateFocusedDate,
    required TResult Function(int index) updateBottomNavigationIndex,
  }) {
    return loadHomeScreen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHomeScreen,
    TResult? Function(DateTime focusedDate)? updateFocusedDate,
    TResult? Function(int index)? updateBottomNavigationIndex,
  }) {
    return loadHomeScreen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHomeScreen,
    TResult Function(DateTime focusedDate)? updateFocusedDate,
    TResult Function(int index)? updateBottomNavigationIndex,
    required TResult orElse(),
  }) {
    if (loadHomeScreen != null) {
      return loadHomeScreen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHomeScreen value) loadHomeScreen,
    required TResult Function(_UpdateFocusedDate value) updateFocusedDate,
    required TResult Function(_UpdateBottomNavigationIndex value)
        updateBottomNavigationIndex,
  }) {
    return loadHomeScreen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHomeScreen value)? loadHomeScreen,
    TResult? Function(_UpdateFocusedDate value)? updateFocusedDate,
    TResult? Function(_UpdateBottomNavigationIndex value)?
        updateBottomNavigationIndex,
  }) {
    return loadHomeScreen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHomeScreen value)? loadHomeScreen,
    TResult Function(_UpdateFocusedDate value)? updateFocusedDate,
    TResult Function(_UpdateBottomNavigationIndex value)?
        updateBottomNavigationIndex,
    required TResult orElse(),
  }) {
    if (loadHomeScreen != null) {
      return loadHomeScreen(this);
    }
    return orElse();
  }
}

abstract class _LoadHomeScreen implements HomeEvent {
  const factory _LoadHomeScreen() = _$LoadHomeScreenImpl;
}

/// @nodoc
abstract class _$$UpdateFocusedDateImplCopyWith<$Res> {
  factory _$$UpdateFocusedDateImplCopyWith(_$UpdateFocusedDateImpl value,
          $Res Function(_$UpdateFocusedDateImpl) then) =
      __$$UpdateFocusedDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime focusedDate});
}

/// @nodoc
class __$$UpdateFocusedDateImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$UpdateFocusedDateImpl>
    implements _$$UpdateFocusedDateImplCopyWith<$Res> {
  __$$UpdateFocusedDateImplCopyWithImpl(_$UpdateFocusedDateImpl _value,
      $Res Function(_$UpdateFocusedDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusedDate = null,
  }) {
    return _then(_$UpdateFocusedDateImpl(
      focusedDate: null == focusedDate
          ? _value.focusedDate
          : focusedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UpdateFocusedDateImpl implements _UpdateFocusedDate {
  const _$UpdateFocusedDateImpl({required this.focusedDate});

  @override
  final DateTime focusedDate;

  @override
  String toString() {
    return 'HomeEvent.updateFocusedDate(focusedDate: $focusedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFocusedDateImpl &&
            (identical(other.focusedDate, focusedDate) ||
                other.focusedDate == focusedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, focusedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFocusedDateImplCopyWith<_$UpdateFocusedDateImpl> get copyWith =>
      __$$UpdateFocusedDateImplCopyWithImpl<_$UpdateFocusedDateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHomeScreen,
    required TResult Function(DateTime focusedDate) updateFocusedDate,
    required TResult Function(int index) updateBottomNavigationIndex,
  }) {
    return updateFocusedDate(focusedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHomeScreen,
    TResult? Function(DateTime focusedDate)? updateFocusedDate,
    TResult? Function(int index)? updateBottomNavigationIndex,
  }) {
    return updateFocusedDate?.call(focusedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHomeScreen,
    TResult Function(DateTime focusedDate)? updateFocusedDate,
    TResult Function(int index)? updateBottomNavigationIndex,
    required TResult orElse(),
  }) {
    if (updateFocusedDate != null) {
      return updateFocusedDate(focusedDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHomeScreen value) loadHomeScreen,
    required TResult Function(_UpdateFocusedDate value) updateFocusedDate,
    required TResult Function(_UpdateBottomNavigationIndex value)
        updateBottomNavigationIndex,
  }) {
    return updateFocusedDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHomeScreen value)? loadHomeScreen,
    TResult? Function(_UpdateFocusedDate value)? updateFocusedDate,
    TResult? Function(_UpdateBottomNavigationIndex value)?
        updateBottomNavigationIndex,
  }) {
    return updateFocusedDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHomeScreen value)? loadHomeScreen,
    TResult Function(_UpdateFocusedDate value)? updateFocusedDate,
    TResult Function(_UpdateBottomNavigationIndex value)?
        updateBottomNavigationIndex,
    required TResult orElse(),
  }) {
    if (updateFocusedDate != null) {
      return updateFocusedDate(this);
    }
    return orElse();
  }
}

abstract class _UpdateFocusedDate implements HomeEvent {
  const factory _UpdateFocusedDate({required final DateTime focusedDate}) =
      _$UpdateFocusedDateImpl;

  DateTime get focusedDate;
  @JsonKey(ignore: true)
  _$$UpdateFocusedDateImplCopyWith<_$UpdateFocusedDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateBottomNavigationIndexImplCopyWith<$Res> {
  factory _$$UpdateBottomNavigationIndexImplCopyWith(
          _$UpdateBottomNavigationIndexImpl value,
          $Res Function(_$UpdateBottomNavigationIndexImpl) then) =
      __$$UpdateBottomNavigationIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$UpdateBottomNavigationIndexImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$UpdateBottomNavigationIndexImpl>
    implements _$$UpdateBottomNavigationIndexImplCopyWith<$Res> {
  __$$UpdateBottomNavigationIndexImplCopyWithImpl(
      _$UpdateBottomNavigationIndexImpl _value,
      $Res Function(_$UpdateBottomNavigationIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$UpdateBottomNavigationIndexImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateBottomNavigationIndexImpl
    implements _UpdateBottomNavigationIndex {
  const _$UpdateBottomNavigationIndexImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'HomeEvent.updateBottomNavigationIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBottomNavigationIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBottomNavigationIndexImplCopyWith<_$UpdateBottomNavigationIndexImpl>
      get copyWith => __$$UpdateBottomNavigationIndexImplCopyWithImpl<
          _$UpdateBottomNavigationIndexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHomeScreen,
    required TResult Function(DateTime focusedDate) updateFocusedDate,
    required TResult Function(int index) updateBottomNavigationIndex,
  }) {
    return updateBottomNavigationIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHomeScreen,
    TResult? Function(DateTime focusedDate)? updateFocusedDate,
    TResult? Function(int index)? updateBottomNavigationIndex,
  }) {
    return updateBottomNavigationIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHomeScreen,
    TResult Function(DateTime focusedDate)? updateFocusedDate,
    TResult Function(int index)? updateBottomNavigationIndex,
    required TResult orElse(),
  }) {
    if (updateBottomNavigationIndex != null) {
      return updateBottomNavigationIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHomeScreen value) loadHomeScreen,
    required TResult Function(_UpdateFocusedDate value) updateFocusedDate,
    required TResult Function(_UpdateBottomNavigationIndex value)
        updateBottomNavigationIndex,
  }) {
    return updateBottomNavigationIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHomeScreen value)? loadHomeScreen,
    TResult? Function(_UpdateFocusedDate value)? updateFocusedDate,
    TResult? Function(_UpdateBottomNavigationIndex value)?
        updateBottomNavigationIndex,
  }) {
    return updateBottomNavigationIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHomeScreen value)? loadHomeScreen,
    TResult Function(_UpdateFocusedDate value)? updateFocusedDate,
    TResult Function(_UpdateBottomNavigationIndex value)?
        updateBottomNavigationIndex,
    required TResult orElse(),
  }) {
    if (updateBottomNavigationIndex != null) {
      return updateBottomNavigationIndex(this);
    }
    return orElse();
  }
}

abstract class _UpdateBottomNavigationIndex implements HomeEvent {
  const factory _UpdateBottomNavigationIndex({required final int index}) =
      _$UpdateBottomNavigationIndexImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$UpdateBottomNavigationIndexImplCopyWith<_$UpdateBottomNavigationIndexImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  HomeLoadingBlocStatus get homeLoadingBlocStatus =>
      throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  int get clockFrameValue => throw _privateConstructorUsedError;
  int get workOutStreakInDays => throw _privateConstructorUsedError;
  int get caloriesBurnt => throw _privateConstructorUsedError;
  int get proteinNeeded => throw _privateConstructorUsedError;
  int get carbsNeeded => throw _privateConstructorUsedError;
  int get totalWalkedSteps => throw _privateConstructorUsedError;
  int get totalSleep => throw _privateConstructorUsedError;
  int get totalWaterConsumed => throw _privateConstructorUsedError;
  int get totalHeartBeat => throw _privateConstructorUsedError;
  String get fatRatio => throw _privateConstructorUsedError;
  String get todayWorkout => throw _privateConstructorUsedError;
  DateTime get focusedDate => throw _privateConstructorUsedError;
  List<AssetImage> get bottomNavigationImages =>
      throw _privateConstructorUsedError;
  List<HeartBeatModel> get heartBeatModel => throw _privateConstructorUsedError;
  List<MealModel> get mealModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {HomeLoadingBlocStatus homeLoadingBlocStatus,
      int currentIndex,
      int clockFrameValue,
      int workOutStreakInDays,
      int caloriesBurnt,
      int proteinNeeded,
      int carbsNeeded,
      int totalWalkedSteps,
      int totalSleep,
      int totalWaterConsumed,
      int totalHeartBeat,
      String fatRatio,
      String todayWorkout,
      DateTime focusedDate,
      List<AssetImage> bottomNavigationImages,
      List<HeartBeatModel> heartBeatModel,
      List<MealModel> mealModel});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeLoadingBlocStatus = null,
    Object? currentIndex = null,
    Object? clockFrameValue = null,
    Object? workOutStreakInDays = null,
    Object? caloriesBurnt = null,
    Object? proteinNeeded = null,
    Object? carbsNeeded = null,
    Object? totalWalkedSteps = null,
    Object? totalSleep = null,
    Object? totalWaterConsumed = null,
    Object? totalHeartBeat = null,
    Object? fatRatio = null,
    Object? todayWorkout = null,
    Object? focusedDate = null,
    Object? bottomNavigationImages = null,
    Object? heartBeatModel = null,
    Object? mealModel = null,
  }) {
    return _then(_value.copyWith(
      homeLoadingBlocStatus: null == homeLoadingBlocStatus
          ? _value.homeLoadingBlocStatus
          : homeLoadingBlocStatus // ignore: cast_nullable_to_non_nullable
              as HomeLoadingBlocStatus,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      clockFrameValue: null == clockFrameValue
          ? _value.clockFrameValue
          : clockFrameValue // ignore: cast_nullable_to_non_nullable
              as int,
      workOutStreakInDays: null == workOutStreakInDays
          ? _value.workOutStreakInDays
          : workOutStreakInDays // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurnt: null == caloriesBurnt
          ? _value.caloriesBurnt
          : caloriesBurnt // ignore: cast_nullable_to_non_nullable
              as int,
      proteinNeeded: null == proteinNeeded
          ? _value.proteinNeeded
          : proteinNeeded // ignore: cast_nullable_to_non_nullable
              as int,
      carbsNeeded: null == carbsNeeded
          ? _value.carbsNeeded
          : carbsNeeded // ignore: cast_nullable_to_non_nullable
              as int,
      totalWalkedSteps: null == totalWalkedSteps
          ? _value.totalWalkedSteps
          : totalWalkedSteps // ignore: cast_nullable_to_non_nullable
              as int,
      totalSleep: null == totalSleep
          ? _value.totalSleep
          : totalSleep // ignore: cast_nullable_to_non_nullable
              as int,
      totalWaterConsumed: null == totalWaterConsumed
          ? _value.totalWaterConsumed
          : totalWaterConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      totalHeartBeat: null == totalHeartBeat
          ? _value.totalHeartBeat
          : totalHeartBeat // ignore: cast_nullable_to_non_nullable
              as int,
      fatRatio: null == fatRatio
          ? _value.fatRatio
          : fatRatio // ignore: cast_nullable_to_non_nullable
              as String,
      todayWorkout: null == todayWorkout
          ? _value.todayWorkout
          : todayWorkout // ignore: cast_nullable_to_non_nullable
              as String,
      focusedDate: null == focusedDate
          ? _value.focusedDate
          : focusedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bottomNavigationImages: null == bottomNavigationImages
          ? _value.bottomNavigationImages
          : bottomNavigationImages // ignore: cast_nullable_to_non_nullable
              as List<AssetImage>,
      heartBeatModel: null == heartBeatModel
          ? _value.heartBeatModel
          : heartBeatModel // ignore: cast_nullable_to_non_nullable
              as List<HeartBeatModel>,
      mealModel: null == mealModel
          ? _value.mealModel
          : mealModel // ignore: cast_nullable_to_non_nullable
              as List<MealModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomeLoadingBlocStatus homeLoadingBlocStatus,
      int currentIndex,
      int clockFrameValue,
      int workOutStreakInDays,
      int caloriesBurnt,
      int proteinNeeded,
      int carbsNeeded,
      int totalWalkedSteps,
      int totalSleep,
      int totalWaterConsumed,
      int totalHeartBeat,
      String fatRatio,
      String todayWorkout,
      DateTime focusedDate,
      List<AssetImage> bottomNavigationImages,
      List<HeartBeatModel> heartBeatModel,
      List<MealModel> mealModel});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeLoadingBlocStatus = null,
    Object? currentIndex = null,
    Object? clockFrameValue = null,
    Object? workOutStreakInDays = null,
    Object? caloriesBurnt = null,
    Object? proteinNeeded = null,
    Object? carbsNeeded = null,
    Object? totalWalkedSteps = null,
    Object? totalSleep = null,
    Object? totalWaterConsumed = null,
    Object? totalHeartBeat = null,
    Object? fatRatio = null,
    Object? todayWorkout = null,
    Object? focusedDate = null,
    Object? bottomNavigationImages = null,
    Object? heartBeatModel = null,
    Object? mealModel = null,
  }) {
    return _then(_$HomeStateImpl(
      homeLoadingBlocStatus: null == homeLoadingBlocStatus
          ? _value.homeLoadingBlocStatus
          : homeLoadingBlocStatus // ignore: cast_nullable_to_non_nullable
              as HomeLoadingBlocStatus,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      clockFrameValue: null == clockFrameValue
          ? _value.clockFrameValue
          : clockFrameValue // ignore: cast_nullable_to_non_nullable
              as int,
      workOutStreakInDays: null == workOutStreakInDays
          ? _value.workOutStreakInDays
          : workOutStreakInDays // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurnt: null == caloriesBurnt
          ? _value.caloriesBurnt
          : caloriesBurnt // ignore: cast_nullable_to_non_nullable
              as int,
      proteinNeeded: null == proteinNeeded
          ? _value.proteinNeeded
          : proteinNeeded // ignore: cast_nullable_to_non_nullable
              as int,
      carbsNeeded: null == carbsNeeded
          ? _value.carbsNeeded
          : carbsNeeded // ignore: cast_nullable_to_non_nullable
              as int,
      totalWalkedSteps: null == totalWalkedSteps
          ? _value.totalWalkedSteps
          : totalWalkedSteps // ignore: cast_nullable_to_non_nullable
              as int,
      totalSleep: null == totalSleep
          ? _value.totalSleep
          : totalSleep // ignore: cast_nullable_to_non_nullable
              as int,
      totalWaterConsumed: null == totalWaterConsumed
          ? _value.totalWaterConsumed
          : totalWaterConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      totalHeartBeat: null == totalHeartBeat
          ? _value.totalHeartBeat
          : totalHeartBeat // ignore: cast_nullable_to_non_nullable
              as int,
      fatRatio: null == fatRatio
          ? _value.fatRatio
          : fatRatio // ignore: cast_nullable_to_non_nullable
              as String,
      todayWorkout: null == todayWorkout
          ? _value.todayWorkout
          : todayWorkout // ignore: cast_nullable_to_non_nullable
              as String,
      focusedDate: null == focusedDate
          ? _value.focusedDate
          : focusedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bottomNavigationImages: null == bottomNavigationImages
          ? _value._bottomNavigationImages
          : bottomNavigationImages // ignore: cast_nullable_to_non_nullable
              as List<AssetImage>,
      heartBeatModel: null == heartBeatModel
          ? _value._heartBeatModel
          : heartBeatModel // ignore: cast_nullable_to_non_nullable
              as List<HeartBeatModel>,
      mealModel: null == mealModel
          ? _value._mealModel
          : mealModel // ignore: cast_nullable_to_non_nullable
              as List<MealModel>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.homeLoadingBlocStatus,
      required this.currentIndex,
      required this.clockFrameValue,
      required this.workOutStreakInDays,
      required this.caloriesBurnt,
      required this.proteinNeeded,
      required this.carbsNeeded,
      required this.totalWalkedSteps,
      required this.totalSleep,
      required this.totalWaterConsumed,
      required this.totalHeartBeat,
      required this.fatRatio,
      required this.todayWorkout,
      required this.focusedDate,
      required final List<AssetImage> bottomNavigationImages,
      required final List<HeartBeatModel> heartBeatModel,
      required final List<MealModel> mealModel})
      : _bottomNavigationImages = bottomNavigationImages,
        _heartBeatModel = heartBeatModel,
        _mealModel = mealModel;

  @override
  final HomeLoadingBlocStatus homeLoadingBlocStatus;
  @override
  final int currentIndex;
  @override
  final int clockFrameValue;
  @override
  final int workOutStreakInDays;
  @override
  final int caloriesBurnt;
  @override
  final int proteinNeeded;
  @override
  final int carbsNeeded;
  @override
  final int totalWalkedSteps;
  @override
  final int totalSleep;
  @override
  final int totalWaterConsumed;
  @override
  final int totalHeartBeat;
  @override
  final String fatRatio;
  @override
  final String todayWorkout;
  @override
  final DateTime focusedDate;
  final List<AssetImage> _bottomNavigationImages;
  @override
  List<AssetImage> get bottomNavigationImages {
    if (_bottomNavigationImages is EqualUnmodifiableListView)
      return _bottomNavigationImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bottomNavigationImages);
  }

  final List<HeartBeatModel> _heartBeatModel;
  @override
  List<HeartBeatModel> get heartBeatModel {
    if (_heartBeatModel is EqualUnmodifiableListView) return _heartBeatModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_heartBeatModel);
  }

  final List<MealModel> _mealModel;
  @override
  List<MealModel> get mealModel {
    if (_mealModel is EqualUnmodifiableListView) return _mealModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mealModel);
  }

  @override
  String toString() {
    return 'HomeState(homeLoadingBlocStatus: $homeLoadingBlocStatus, currentIndex: $currentIndex, clockFrameValue: $clockFrameValue, workOutStreakInDays: $workOutStreakInDays, caloriesBurnt: $caloriesBurnt, proteinNeeded: $proteinNeeded, carbsNeeded: $carbsNeeded, totalWalkedSteps: $totalWalkedSteps, totalSleep: $totalSleep, totalWaterConsumed: $totalWaterConsumed, totalHeartBeat: $totalHeartBeat, fatRatio: $fatRatio, todayWorkout: $todayWorkout, focusedDate: $focusedDate, bottomNavigationImages: $bottomNavigationImages, heartBeatModel: $heartBeatModel, mealModel: $mealModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.homeLoadingBlocStatus, homeLoadingBlocStatus) ||
                other.homeLoadingBlocStatus == homeLoadingBlocStatus) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.clockFrameValue, clockFrameValue) ||
                other.clockFrameValue == clockFrameValue) &&
            (identical(other.workOutStreakInDays, workOutStreakInDays) ||
                other.workOutStreakInDays == workOutStreakInDays) &&
            (identical(other.caloriesBurnt, caloriesBurnt) ||
                other.caloriesBurnt == caloriesBurnt) &&
            (identical(other.proteinNeeded, proteinNeeded) ||
                other.proteinNeeded == proteinNeeded) &&
            (identical(other.carbsNeeded, carbsNeeded) ||
                other.carbsNeeded == carbsNeeded) &&
            (identical(other.totalWalkedSteps, totalWalkedSteps) ||
                other.totalWalkedSteps == totalWalkedSteps) &&
            (identical(other.totalSleep, totalSleep) ||
                other.totalSleep == totalSleep) &&
            (identical(other.totalWaterConsumed, totalWaterConsumed) ||
                other.totalWaterConsumed == totalWaterConsumed) &&
            (identical(other.totalHeartBeat, totalHeartBeat) ||
                other.totalHeartBeat == totalHeartBeat) &&
            (identical(other.fatRatio, fatRatio) ||
                other.fatRatio == fatRatio) &&
            (identical(other.todayWorkout, todayWorkout) ||
                other.todayWorkout == todayWorkout) &&
            (identical(other.focusedDate, focusedDate) ||
                other.focusedDate == focusedDate) &&
            const DeepCollectionEquality().equals(
                other._bottomNavigationImages, _bottomNavigationImages) &&
            const DeepCollectionEquality()
                .equals(other._heartBeatModel, _heartBeatModel) &&
            const DeepCollectionEquality()
                .equals(other._mealModel, _mealModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      homeLoadingBlocStatus,
      currentIndex,
      clockFrameValue,
      workOutStreakInDays,
      caloriesBurnt,
      proteinNeeded,
      carbsNeeded,
      totalWalkedSteps,
      totalSleep,
      totalWaterConsumed,
      totalHeartBeat,
      fatRatio,
      todayWorkout,
      focusedDate,
      const DeepCollectionEquality().hash(_bottomNavigationImages),
      const DeepCollectionEquality().hash(_heartBeatModel),
      const DeepCollectionEquality().hash(_mealModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final HomeLoadingBlocStatus homeLoadingBlocStatus,
      required final int currentIndex,
      required final int clockFrameValue,
      required final int workOutStreakInDays,
      required final int caloriesBurnt,
      required final int proteinNeeded,
      required final int carbsNeeded,
      required final int totalWalkedSteps,
      required final int totalSleep,
      required final int totalWaterConsumed,
      required final int totalHeartBeat,
      required final String fatRatio,
      required final String todayWorkout,
      required final DateTime focusedDate,
      required final List<AssetImage> bottomNavigationImages,
      required final List<HeartBeatModel> heartBeatModel,
      required final List<MealModel> mealModel}) = _$HomeStateImpl;

  @override
  HomeLoadingBlocStatus get homeLoadingBlocStatus;
  @override
  int get currentIndex;
  @override
  int get clockFrameValue;
  @override
  int get workOutStreakInDays;
  @override
  int get caloriesBurnt;
  @override
  int get proteinNeeded;
  @override
  int get carbsNeeded;
  @override
  int get totalWalkedSteps;
  @override
  int get totalSleep;
  @override
  int get totalWaterConsumed;
  @override
  int get totalHeartBeat;
  @override
  String get fatRatio;
  @override
  String get todayWorkout;
  @override
  DateTime get focusedDate;
  @override
  List<AssetImage> get bottomNavigationImages;
  @override
  List<HeartBeatModel> get heartBeatModel;
  @override
  List<MealModel> get mealModel;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

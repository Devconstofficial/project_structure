import 'dart:async';
import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';
import 'package:inner_journal_app/utils/permission_handler.dart';
import 'package:inner_journal_app/views/intermediate_widgets/gradient_text.dart';
import 'package:pedometer_2/pedometer_2.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/color_constant.dart';
import '../../../intermediate_widgets/3d_button.dart';
import '../bloc/home_bloc.dart';
import '../model/heart_beat_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeBloc homeBloc;
  final EasyInfiniteDateTimelineController _controller = EasyInfiniteDateTimelineController();
  DateTime now = DateTime.now();
  late DateTime startOfDay = DateTime(now.year, now.month, now.day);
  PermissionHandler permissionHandler = PermissionHandler();
  StreamSubscription? _stepStreamFrom;

  startStepCount() async {
    await permissionHandler.checkPermissionForStorage(context);
    PermissionStatus perm = Platform.isAndroid ? await Permission.activityRecognition.status : await Permission.sensors.status;
    if(perm.isGranted){

      if (Platform.isAndroid) {
        int stepCountStreamFrom = await Pedometer().getStepCount(from: startOfDay, to: now);
        int? androidFirstStepFrom;
        _stepStreamFrom = Pedometer().stepCountStream().listen((step) {
          if (androidFirstStepFrom == null) {
            androidFirstStepFrom = step;
            return;
          }
          homeBloc.add(HomeEvent.loadHomeScreen(context: context,stepCountStreamFrom: stepCountStreamFrom + step - androidFirstStepFrom!));
        });
      }
      else{
        _stepStreamFrom = Pedometer().stepCountStreamFrom(from: startOfDay).listen((step) {
          homeBloc.add(HomeEvent.loadHomeScreen(context: context,stepCountStreamFrom: step));
        });
      }

    }
  }

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBloc>();
    startStepCount();

  }

  @override
  void dispose() {
    if(_stepStreamFrom != null){
      _stepStreamFrom!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Scaffold(
              backgroundColor: scaffoldColor,
              body: Padding(
                padding: EdgeInsets.only(top: kToolbarHeight, bottom: isKeyboardVisible?0:32),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildDateTimeLine(state),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildClockFrame(state),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildWorkoutStreak(state),
                      _buildCaloriesProgress(state),
                      _buildHeader(),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildSensorWidgets(state),
                      SizedBox(height: Adaptive.sp(26)),
                      _buildNotificationSetupCard(),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildSectionTitle("Planned Meals"),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildMealTabs(state),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildMealActions(),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildSectionTitle("Weight Log"),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildWeightLog(),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildSectionTitle("Workout"),
                      SizedBox(height: Adaptive.sp(18)),
                      _buildWorkoutCard(),
                      SizedBox(height: Adaptive.sp(18)),
                    ],
                  ),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: isKeyboardVisible?const SizedBox.shrink():Image.asset(Assets.imagesPolygon, height: 56),
              bottomNavigationBar: _buildBottomNavigationBar(state,isKeyboardVisible),
            );
          },
        );
      }
    );
  }

  Widget _buildSensorWidgets(HomeState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSensorWidget(
                title: "Walk",
                image: Assets.imagesWalk,
                progress: state.totalWalkedSteps / 10000,
                value: state.totalWalkedSteps.toString(),
                unit: "Steps",
              ),
              const SizedBox(width: 20),
              _buildSensorWidget(
                title: "Sleep",
                image: Assets.imagesSleep,
                progressWidgets: _buildBarChart([40, 70, 40, 60, 25, 40]),
                value: state.totalSleep.toString(),
                unit: "Hours",
              ),
            ],
          ),
          SizedBox(height: Adaptive.sp(18)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSensorWidget(
                title: "Water",
                image: Assets.imagesWater,
                color: sensorWidgetColor2,
                textColor: Colors.white,
                progressWidgets: _buildBarChart([20, 80, 60, 15, 15, 15], color: Colors.white),
                value: state.totalWaterConsumed.toString(),
                unit: "Bottles",
              ),
              const SizedBox(width: 20),
              _buildSensorWidget(
                title: "Heart",
                image: Assets.imagesHeart,
                color: sensorWidgetColor2,
                textColor: Colors.white,
                chart: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(isVisible: false),
                  primaryYAxis: const CategoryAxis(isVisible: false),
                  plotAreaBorderWidth: 0,
                  margin: EdgeInsets.zero,
                  series: <LineSeries<HeartBeatModel, String>>[
                    LineSeries<HeartBeatModel, String>(
                      dataSource: state.heartBeatModel,
                      color: Colors.white,
                      xValueMapper: (HeartBeatModel sales, _) =>
                          (sales.minutes ?? 0).toString(),
                      yValueMapper: (HeartBeatModel sales, _) => sales.beats,
                    ),
                  ],
                ),
                value: state.totalHeartBeat.toString(),
                unit: "bpm",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMealActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildGradientButton(
          image: Assets.imagesMeal,
          text: "Prep",
        ),
        const SizedBox(width: 10),
        Button3d(
          onTap: () {},
          height: 36,
          width: 80,
          startColor: linearGradientColor1,
          endColor: linearGradientColor2,
          stretch: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check, color: Colors.white, size: 16),
              const SizedBox(width: 5),
              Text("Log", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGradientButton({required String image, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      height: 36,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: const GradientBoxBorder(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [linearGradientColor1, linearGradientColor2],
          ),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Image.asset(image, color: Colors.white, height: 14),
          const SizedBox(width: 5),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 16.sp)),
        ],
      ),
    );
  }

  Widget _buildWeightLog() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      decoration: const BoxDecoration(
        border: GradientBoxBorder(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [linearGradientColor1, linearGradientColor2],
          ),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            height: 36,
            width: Adaptive.sp(40),
            child: const TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              maxLength: 3,
              decoration: InputDecoration(
                counter: SizedBox.shrink(),
                counterText: "",
                contentPadding: EdgeInsets.only(top: 12, bottom: 10,left: 20,right: 0),
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                constraints: BoxConstraints(),
                prefixIconConstraints: BoxConstraints(),
                prefixIcon: Text(
                  "lbs ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Button3d(
            onTap: () {},
            height: 36,
            width: 80,
            startColor: linearGradientColor1,
            endColor: linearGradientColor2,
            stretch: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check, color: Colors.white, size: 16),
                const SizedBox(width: 5),
                Text("Log", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard() {
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 15, right: 15),
      width: double.infinity,
     clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: const AssetImage(Assets.imagesWorkoutImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
        )
      ),
      height: Adaptive.sp(62),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                Text(
                  "Rest Day",
                  style: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildMealTabs(HomeState state) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: tabBackgroundColor,
              borderRadius: BorderRadius.circular(20.0),
              border: const GradientBoxBorder(
                gradient: LinearGradient(
                  stops: [0.0, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [linearGradientColor1, linearGradientColor2],
                ),
                width: 1,
              ),
            ),
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              dividerHeight: 0,
              labelPadding: EdgeInsets.symmetric(horizontal: Adaptive.sp(5)),
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: const LinearGradient(
                  stops: [0.0, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [linearGradientColor1, linearGradientColor2],
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                const Tab(text: 'Breakfast'),
                const Tab(text: 'Lunch'),
                const Tab(text: 'Dinner'),
                const Tab(text: 'Snacks'),
              ],
            ),
          ),
          SizedBox(
            height: Adaptive.sp(112),
            child: TabBarView(
              children: List.generate(4, (index) => _buildMealList(state)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSetupCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: const GradientBoxBorder(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [linearGradientColor1, linearGradientColor2],
          ),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Image.asset(Assets.imagesNotifications, height: 28),
          const SizedBox(height: 10),
          Text(
            "Notification Setup",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20.sp),
          ),
          const SizedBox(height: 5),
          Text(
            "Reminders are powerful users who enable at\nleast two daily notifications are 78% more\nlikely to reach their fitness goals.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15.sp),
          ),
          SizedBox(height: Adaptive.sp(18)),
          Button3d(
            onTap: () {},
            startColor: linearGradientColor1,
            endColor: linearGradientColor2,
            height: 36,
            stretch: false,
            borderRadius: 100,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.imagesSetting, height: 18),
                const SizedBox(width: 10),
                Text("Settings", style: TextStyle(color: Colors.white, fontSize: 16.5.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMealList(HomeState state) {
    return ListView.builder(
      itemCount: state.mealModel.length,
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final meal = state.mealModel[index];
        return Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28)
          ),
          height: Adaptive.sp(62),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage(meal.assets),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          meal.name,
                          style: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Image.asset(Assets.imagesOptions, color: Colors.white, height: Adaptive.sp(18)),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Image.asset(Assets.imagesRedFire, height: 16),
                        Text(
                          meal.calories,
                          style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        if (meal.isFavorite)
                          Image.asset(Assets.imagesFavorite, color: Colors.white, height: Adaptive.sp(18)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            "Your activity",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          _buildLabel("Achievements"),
          const SizedBox(width: 8),
          _buildLabel("Badges"),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Container(
      decoration: BoxDecoration(
        color: brownOrangeColor,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSensorWidget({
    required String title,
    required String image,
    required String value,
    required String unit,
    Color color = sensorWidgetColor,
    Color textColor = Colors.black,
    Widget? chart,
    List<Widget>? progressWidgets,
    double progress = 0.0,
  }) {
    return Flexible(
      flex: 1,
      child: Container(
        height: Adaptive.sp(62),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: textColor,
                  ),
                ),
                const Spacer(),
                Image.asset(image, width: 15, color: textColor),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: chart ??
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: progressWidgets ??
                        [
                          GradientCircularProgressIndicator(
                            progress: progress,
                            gradient: const LinearGradient(
                              stops: [0.0, 1.0],
                              colors: [linearGradientColor2, linearGradientColor2],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                            ),
                            size: 100,
                            backgroundColor: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  value,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  unit,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 16.sp,
                                    height: 0.6,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                  ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  unit,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 17.sp,
                    height: 0.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBarChart(List<int> data, {Color color = linearGradientColor2}) {
    return data.map((height) {
      return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Center(
          child: Container(
            width: 10,
            height: height.toDouble(),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      );
    }).toList();
  }
  Widget _buildDateTimeLine(HomeState state) {
    return SizedBox(
      width: double.infinity,
      child: EasyInfiniteDateTimeLine(
        controller: _controller,
        headerBuilder: (context, dateTime) => const SizedBox.shrink(),
        dayProps: EasyDayProps(
          height: Adaptive.sp(36),
          width: Adaptive.sp(36),
          dayStructure: DayStructure.dayNameOnly,
          todayStyle: _buildDayStyle(),
          inactiveDayStyle: _buildDayStyle(),
          activeDayStyle: _buildActiveDayStyle(),
        ),
        timeLineProps: const EasyTimeLineProps(
          hPadding: 0,
          vPadding: 2,
          separatorPadding: 10,
        ),
        physics: const BouncingScrollPhysics(),
        firstDate: DateTime(1600),
        focusDate: state.focusedDate,
        lastDate: DateTime(2100),
        onDateChange: (selectedDate) {
          homeBloc.add(HomeEvent.updateFocusedDate(focusedDate: selectedDate));
        },
      ),
    );
  }

  DayStyle _buildDayStyle() {
    return DayStyle(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: linearGradientColor1),
        borderRadius: BorderRadius.circular(28),
      ),
      dayStrStyle: TextStyle(
        fontSize: 17.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  DayStyle _buildActiveDayStyle() {
    return DayStyle(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [linearGradientColor1, linearGradientColor2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      dayStrStyle: TextStyle(
        fontSize: 17.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildClockFrame(HomeState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: const AssetImage(Assets.imagesClockFrame), width: Adaptive.sp(25)),
        const SizedBox(width: 15),
        Text(
          (state.clockFrameValue ?? 0).toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 21.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutStreak(HomeState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Workout Streak:  ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        GradientText(
          "${state.workOutStreakInDays} days",
          gradient: const LinearGradient(
            stops: [0.0, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [linearGradientColor1, linearGradientColor2],
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(Assets.imagesFire, width: 16),
      ],
    );
  }

  Widget _buildCaloriesProgress(HomeState state) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          stops: [0.0, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [linearGradientColor1, linearGradientColor2],
        ),
      ),
      child: Column(
        children: [
          GradientCircularProgressIndicator(
            progress: 0.1,
            gradient: const LinearGradient(
              stops: [0.0, 1.0],
              colors: [linearGradientColor2, linearGradientColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
            size: Adaptive.sp(48),
            backgroundColor: Colors.white,
            child: Column(
              children: [
                SizedBox(height: Adaptive.sp(18)),
                Text(
                  state.caloriesBurnt.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "calories left",
                  style: TextStyle(
                    color: Colors.white,
                    height: 0.5,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.imagesTrophy, height: 16),
                    const SizedBox(width: 5),
                    Text(
                      state.caloriesBurnt.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Adaptive.sp(18)),
              ],
            ),
          ),
          SizedBox(height: Adaptive.sp(18)),
          _buildNutritionalInfo(state),
        ],
      ),
    );
  }

  Widget _buildNutritionalInfo(HomeState state) {
    return Container(
      decoration: BoxDecoration(
        color: midnightBlackColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Row(
        children: [
          _buildNutritionalColumn(
            value: ">${state.proteinNeeded}g",
            color: greenPinkColor,
            label: "protein needed",
          ),
          _buildNutritionalColumn(
            value: ">${state.carbsNeeded}g",
            color: greenBlueColor,
            label: "carbs needed",
          ),
          _buildNutritionalColumn(
            value: state.fatRatio,
            color: linearGradientColor2,
            label: "fat",
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionalColumn({required String value, required String label, required Color color}) {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Adaptive.sp(5)),
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(HomeState state, bool isKeyboardVisible) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 4,
      activeIndex: state.currentIndex,
      backgroundColor: bottomNavigationColor,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 24,
      notchMargin: 16,
      height: 60,
      rightCornerRadius: 24,
      onTap: (index) => homeBloc.add(HomeEvent.updateBottomNavigationIndex(index: index)),
      tabBuilder: (int index, bool isActive) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(isActive ? 10 : 0),
          decoration: isActive
              ? BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white, width: 2),
            shape: BoxShape.circle,
          )
              : null,
          child: Image(
            image: state.bottomNavigationImages[index],
            height: isActive ? 20 : 22,
            width: isActive ? 20 : 22,
            color: isActive ? activeIconColor : Colors.white,
          ),
        );
      },
    );
  }
}


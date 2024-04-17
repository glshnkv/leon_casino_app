import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leon_casino_app/models/wheel_model.dart';
import 'package:leon_casino_app/router/router.dart';
import 'package:leon_casino_app/screens/wheel/wheel_bloc/wheel_bloc.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';

@RoutePage()
class WheelsListScreen extends StatefulWidget {
  const WheelsListScreen({super.key});

  @override
  State<WheelsListScreen> createState() => _WheelsListScreenState();
}

class _WheelsListScreenState extends State<WheelsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.router.push(HomeRoute());
          },
          icon: Icon(Icons.arrow_back, color: AppColors.white),
        ),
        title: Text(
          'Wheels',
          style: AppStyles.Bold16(AppColors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocProvider(
              create: (context) => WheelBloc()..add(GetAllWheelsEvent()),
              child: BlocConsumer<WheelBloc, WheelState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadedAllWheelsState) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.wheels.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final WheelModel wheel = state.wheels[index];
                        return Center(
                          child: SizedBox(
                            width: 358,
                            height: 117,
                            child: Stack(
                              children: [
                                Image.asset('assets/images/home/button-1.png'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        wheel.question,
                                        style: AppStyles.ExtraBold22(
                                            AppColors.white),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.green,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100.0))),
                                            width: 8,
                                            height: 8,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '${wheel.options.length} options',
                                            style: AppStyles.News14(
                                                AppColors.white),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                context.router.push(WheelGameRoute(wheel: wheel));
                                              },
                                              child: SvgPicture.asset(
                                                  'assets/images/elements/play.svg')),
                                          SizedBox(width: 5),
                                          GestureDetector(
                                            onTap: () {
                                              context.router.push(EditWheelRoute(wheel: wheel));

                                            },
                                              child: SvgPicture.asset(
                                                  'assets/images/elements/edit.svg')),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          context.router.push(AddWheelRoute());
        },
        child: SvgPicture.asset('assets/images/elements/add.svg'),
      ),
    );
  }
}

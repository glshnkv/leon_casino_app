import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leon_casino_app/models/wheel_model.dart';
import 'package:leon_casino_app/router/router.dart';
import 'package:leon_casino_app/screens/wheel/wheel_bloc/wheel_bloc.dart';
import 'package:leon_casino_app/screens/wheel/widgets/add_options_button.dart';
import 'package:leon_casino_app/screens/wheel/widgets/option_tile.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';

@RoutePage()
class EditWheelScreen extends StatefulWidget {
  final WheelModel wheel;
  const EditWheelScreen({super.key, required this.wheel});

  @override
  State<EditWheelScreen> createState() => _EditWheelScreenState();
}

class _EditWheelScreenState extends State<EditWheelScreen> {
  final questionController = TextEditingController();
  final optionController = TextEditingController();

  @override
  void initState() {
    questionController.text = widget.wheel.question;
    questionLength = widget.wheel.question.length;
    options = widget.wheel.options;
    super.initState();
  }

  int questionLength = 0;
  int optionLength = 0;

  List<String> options = [];


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
            context.router.push(WheelsListRoute());
          },
          icon: Icon(Icons.arrow_back, color: AppColors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                if (questionController.text.isNotEmpty && options.length >= 2) {
                  context.read<WheelBloc>().add(EditWheelEvent(editedWheel: WheelModel(
                      options: options, question: questionController.text), wheel: widget.wheel));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.green,
                      content: Text(
                        'Wheel edited!',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  );
                  context.router.push(WheelsListRoute());
                } else {
                  if (questionController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.orange,
                        content: Text(
                          'Enter question!',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.orange,
                        content: Text(
                          'Enter more options!',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    );
                  }
                }
              },
              child: Text(
                'Edit',
                style: AppStyles.Bold16(AppColors.green),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Question',
                        style: AppStyles.Bold16(AppColors.white),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: questionController,
                      decoration: InputDecoration(
                        counter: Text(
                          '$questionLength/20',
                          style: AppStyles.News14(AppColors.textGrey),
                        ),
                        filled: true,
                        fillColor: AppColors.fieldGrey,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.all(Radius.circular(12))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.green, width: 2),
                            borderRadius:
                            BorderRadius.all(Radius.circular(12))),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      onChanged: (text) {
                        setState(() {
                          questionLength = text.length;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Options',
                        style: AppStyles.Bold16(AppColors.white),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: optionController,
                      decoration: InputDecoration(
                        counter: Text(
                          '$optionLength/20',
                          style: AppStyles.News14(AppColors.textGrey),
                        ),
                        filled: true,
                        fillColor: AppColors.fieldGrey,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.all(Radius.circular(12))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.green, width: 2),
                            borderRadius:
                            BorderRadius.all(Radius.circular(12))),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      onChanged: (text) {
                        setState(() {
                          optionLength = optionController.text.length;
                        });
                      },
                    ),
                    SizedBox(height: 15),
                    AddOptionsButton(
                      onTap: () {
                        if (options.length < 16) {
                          if (optionController.text.isNotEmpty) {
                            setState(() {
                              options.insert(0, optionController.text);
                              optionController.clear();
                              optionLength = 0;
                            });
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.orange,
                              content: Text(
                                'You can add only 16 options!',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: options.length,
                        separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                          height: 15,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return OptionTile(
                            option: options[index],
                            onPressed: () {
                              setState(() {
                                options.remove(options[index]);
                              });
                            },
                          );
                        }),
                    SizedBox(height: 45),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<WheelBloc>().add(DeleteWheelEvent(wheel: widget.wheel));
          context.router.push(WheelsListRoute());
        },
          backgroundColor: AppColors.orange,
        foregroundColor: AppColors.white,
        child: Icon(Icons.delete),
      ),
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first/shared/components/components.dart';
import 'package:first/shared/cubit/cubit.dart';
import 'package:first/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var dateController = TextEditingController();

  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..createDatabase(),
        child: BlocConsumer<AppCubit, AppStates>(builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titels[cubit.currentIndex]),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetLoadingDataBaseState,
              builder: (context) => cubit.screen[cubit.currentIndex],
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheet) {
                  cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text);
                } else {
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);

                  scaffoldKey.currentState
                      ?.showBottomSheet((context) => Container(
                            padding: const EdgeInsets.all(20.0),
                            color: Colors.grey[100],
                            child: Form(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormFeild(
                                      controller: titleController,
                                      type: TextInputType.text,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'title must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'task title',
                                      prefix: Icons.title_outlined),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormFeild(
                                      controller: timeController,
                                      type: TextInputType.datetime,
                                      label: 'task time',

                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'time must not be empty';
                                        }
                                        return null;
                                      },
                                      prefix: Icons.watch_later_outlined,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                        }).catchError((error) {
                                          print('error');
                                        });
                                      }),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormFeild(
                                      controller: dateController,
                                      type: TextInputType.text,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'date must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'task date',
                                      prefix: Icons.calendar_today_outlined,
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.parse(
                                                    '2022-12-17'))
                                            .then((value) {
                                          dateController.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      })
                                ],
                              ),
                            ),
                          ))
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                }
              },
              child: Icon(cubit.fab),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archived'),
              ],
              currentIndex: cubit.currentIndex,
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                AppCubit.get(context).changeIndex(index);

              },
            ),
          );
        }, listener: (context, state) {
          if (state is AppInsertDataBaseState) {
            Navigator.pop(context);
          }
        }));
  }
}

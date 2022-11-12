import 'package:first/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:first/modules/done_tasks/done_tasks_screen.dart';
import 'package:first/modules/new_tasks/new_tasks_screen.dart';
import 'package:first/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  late Database database;
  int currentIndex = 0;
  List<Widget> screen = [
     const NewTasksScreen(),
     const DoneTasksScreen(),
     const ArchivedTasksScreen(),
  ];
  List<String> titels = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      print('data base created');
      database
          .execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('error is${error.toString()} ');
      });
    }, onOpen: (database) {
      getDAtaFromDB(database);
      print('data base opened');
    }).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","new")',
      )
          .then((value) {
        print('$value inserted success');
        emit(AppInsertDataBaseState());
        getDAtaFromDB(database);
      }).catchError((error) {
        print('error is${error.toString()} ');
      });
      return null;
    });
  }
 void getDAtaFromDB(database)  {
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];
    emit(AppGetLoadingDataBaseState());
     database.rawQuery('SELECT * FROM tasks').then((value) {
       /*tasks = value;
       print(tasks);*/
       value.forEach((element) {
         if(element['status']=='new')newTasks.add(element);
         else if(element['status']=='done')doneTasks.add(element);
         else if(element['status']=='archive')archivedTasks.add(element);
             // enum
       });
       emit(AppGetDataBaseState());
     });
  }
  void upDateData({required String status, required dynamic task}){
     database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',[status, task['id']]).then((element) {
       getDAtaFromDB(database);
       emit(AppUpDateDataBaseState());
     });
  }
  void deleteData({required int id}){
    database.rawDelete('DELETE FROM tasks WHERE id = ?',[id]).then((value) {
      getDAtaFromDB(database);
      emit(AppDeleteDataBaseState());
    });
  }

  bool isBottomSheet = false;
  IconData fab = Icons.edit;

  void changeBottomSheetState({required bool isShow, required IconData icon}) {
    isBottomSheet = isShow;
    fab = icon;
    emit(AppChangeBottomSheetState());
  }
}

/*
       Map element =  {}; // element = task;
       element.addAll(task);

       element['status'] = status;

       if(status=='new') {
        newTasks.add(element);

      } else if(status=='done') {
         doneTasks.add(element);

         if (archivedTasks.contains(task)) {
           archivedTasks.remove(task);
         } else if (newTasks.contains(task)) {
           newTasks.remove(task);
         }

       } else if(status=='archive') {
         archivedTasks.add(element);

         if (doneTasks.contains(task)) {
           doneTasks.remove(task);
         } else if (newTasks.contains(task)) {
           newTasks.remove(task);
         }

       }
 */
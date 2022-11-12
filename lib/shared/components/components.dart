import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:first/shared/cubit/cubit.dart';

Widget defaultButton({
  required String text,
  required Function function,
  double width = double.infinity,
  Color background = Colors.blue,
  double hieght = 40.0,
  double radius = 5.0,
}) =>
    Container(
      height: hieght,
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(text.toUpperCase())),
    );

Widget defaultFormFeild({
  required TextEditingController controller,
  required TextInputType? type,

   //Add question mark
  required String? Function(String? value) validate,
  required var label,
  required IconData prefix,
  bool isPassword = false,
  IconData? suf,
  Function? onPress,
  GestureTapCallback? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,


      validator: validate,
      decoration: InputDecoration(
          suffixIcon: suf != null
              ? IconButton(
                  onPressed: () {
                    onPress!();
                  },
                  icon: Icon(suf))
              : null,
          labelText: label,
          prefixIcon: Icon(prefix),
          border: const OutlineInputBorder()),
    );

Widget buildTaskItem(Map model,context,) => Dismissible(
  key: Key(model['id'].toString()),
  onDismissed: (direction){
    AppCubit.get(context).deleteData(id: model['id'],);
  },
  child: Padding(

        padding: const EdgeInsets.all(20.0),

        child: Row(

          children: [

            CircleAvatar(

              radius: 40.0,

              child: Text('${model['time']}'),

            ),

            const SizedBox(

              width: 20.0,

            ),

            Expanded(

              child: Column(

                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(

                    '${model['title']}',

                    style: const TextStyle(

                        fontSize: 18.0, fontWeight: FontWeight.bold),

                  ),

                  Text(

                    '${model['date']}',

                    style: const TextStyle(color: Colors.grey),

                  )

                ],

              ),

            ),

            const SizedBox(

              width: 20.0,

            ),

            IconButton(

              onPressed: () {

                AppCubit.get(context).upDateData(status: 'done', task: model);

              },

              icon: const Icon(

                Icons.check_box,

                color: Colors.green,

              ),

            ),

            IconButton(

                onPressed: () {

                  AppCubit.get(context).upDateData(status: 'archive', task: model);

                },

                icon: const Icon(

                  Icons.archive,

                  color: Colors.black45,

                )),

          ],

        ),

      ),
);
Widget taskBuilder({required List<Map> tasks})=>ConditionalBuilder(
    condition: tasks.length > 0,
    builder: (context) => ListView.separated(
        itemBuilder: (context, index) =>
            buildTaskItem(tasks[index], context),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: tasks.length),
    fallback: (context) => Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.menu,
            size: 100.0,
            color: Colors.grey,
          ),
          Text(
            'NO TASKS YET PLEASE ADD SOME TASKS',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.grey),
          ),
        ],
      ),
    ));

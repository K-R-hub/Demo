import 'package:demo_1/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../layout/shop_app/cubit/cubit.dart';
import '../../modules/news_app/web_view/web_view_screen.dart';
import '../styles/colors.dart';

Widget defultButton({
  double width = double.infinity,
  Color Color = Colors.lightBlue,
  required String text,
  double fontSize = 20,
  Function? onpressed,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color,
      ),
      child: MaterialButton(
        onPressed: () {
          onpressed!();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defultFormField({
  required TextEditingController textControl,
  required TextInputType keyboardType,
  required String label,
  required Icon prefix,
  required String? Function(dynamic value) validator,
  bool obscureText = false,
  IconData? suffix,
  VoidCallback? suffixPressed,
  ValueChanged<String>? onSubmit,
  var onTap,
  ValueChanged<String>? onChange,
}) =>
    TextFormField(
      controller: textControl,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
      obscureText: obscureText,
      validator: validator,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      onChanged: onChange,
    );

Widget itemViweDatabase(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.lightBlue,
              child: Text(
                '${model['time']}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updatedb(status: 'done', id: model['id']);
              },
              icon: Icon(Icons.done_outline_sharp),
              color: Colors.green,
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updatedb(status: 'archived', id: model['id']);
                },
                icon: Icon(Icons.archive)),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deletFromDb(id: model['id']);
      },
    );

// Widget tasksBuilder({
//   required List<Map> tasks,
// }) => ConditionalBuilder(
//   condition: tasks.length > 0,
//   builder: (context) => ListView.separated(
//     itemBuilder: (context, index)
//     {
//       return itemViweDatabase(tasks[index], context);
//     },
//     separatorBuilder: (context, index) => Padding(
//       padding: const EdgeInsetsDirectional.only(
//         start: 20.0,
//       ),
//       child: Container(
//         width: double.infinity,
//         height: 1.0,
//         color: Colors.grey[300],
//       ),
//     ),
//     itemCount: tasks.length,
//   ),
//   fallback: (context) => Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.menu,
//           size: 100.0,
//           color: Colors.grey,
//         ),
//         Text(
//           'No Tasks Yet, Please Add Some Tasks',
//           style: TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     ),
//   ),
// );

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        goToScreen(
          context,
          WebViewScreen(article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
          ],
        ),
      ),
    );

Widget articalBuilder(list, context, {isSearch = false}) => list.length > 0
    ? ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, idex) => Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
        itemCount: 10)
    : isSearch
        ? Container()
        : Center(child: CircularProgressIndicator());

void goToScreen(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

void goToScreenAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
    (route) => false);

void showToast({
  required String msg,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: chooseToastColor(state: state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseToastColor({
  required ToastState state,
}) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildProductItem(model,context, {bool isSearch = false}) =>  Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120,
    color: Colors.white,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(
              image: NetworkImage(
                model!.image!,
              ),
              width: 120,
              height: 120,
            ),
            if(isSearch==false)
            if (model.discount != 0 )
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                color: Colors.red,
                child: Text(
                  'Discount',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.2,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '${model.price!}',
                    style: TextStyle(
                      fontSize: 15,
                      color: defultColor,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if(isSearch==false)
                  if (model.discount != 0)
                    Text(
                      '${model.oldPrice!}',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      ShopCubit.get(context).changeFavorites(model.id!);
                    },
                    icon: CircleAvatar(
                        backgroundColor:
                        ShopCubit.get(context).favorites[model.id]!
                            ? Colors.red
                            : Colors.grey,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

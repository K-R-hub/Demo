import 'package:demo_1/layout/news_layout/cubit/cubit.dart';
import 'package:demo_1/layout/news_layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {

          List<dynamic> list = NewsCubit.get(context).sports;

          return articalBuilder(list,context);



        }
    );
  }
}

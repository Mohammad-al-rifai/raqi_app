import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/layout_cubit/layout_cubit.dart';
import '../../widgets/articles_widget.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = LayoutCubit.get(context).businessNews.articles;
        return ArticlesWidget(articles: list);
      },
    );
  }
}

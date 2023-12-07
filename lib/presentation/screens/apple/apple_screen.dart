import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raqi_test_app/presentation/cubit/layout_cubit/layout_cubit.dart';

import '../../widgets/articles_widget.dart';

class AppleScreen extends StatelessWidget {
  const AppleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = LayoutCubit.get(context).appleNews.articles;
        return ArticlesWidget(articles: list);
      },
    );
  }
}

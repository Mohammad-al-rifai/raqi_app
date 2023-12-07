import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:raqi_test_app/presentation/widgets/shared_widgets.dart';

import '../../domain/models/responses/news_response_model.dart';
import 'article_widget.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({required this.articles, super.key});

  final List<Article>? articles;

  @override
  Widget build(BuildContext context) {
    return Conditional.single(
      context: context,
      conditionBuilder: (context) => articles != null && articles!.isNotEmpty,
      widgetBuilder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            OneArticleWidget(article: articles![index]),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: articles!.length,
      ),
      fallbackBuilder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

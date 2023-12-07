import 'package:flutter/material.dart';

import '../../domain/models/responses/news_response_model.dart';

class OneArticleWidget extends StatelessWidget {
  OneArticleWidget({required this.article, super.key});

  Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    article.urlToImage == null
                        ? 'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg'
                        : '${article.urlToImage}',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article.title}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article.publishedAt}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../data/hero_tag.dart';
import '../data/locations.dart';
import '../models/location.dart';
import '../models/review.dart';
import 'hero_widget.dart';

class ReviewsWidget extends StatelessWidget {
  final Location location;
  final Animation<double> animation;

  const ReviewsWidget({
    super.key,
    required this.location,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
      itemCount: location.reviews?.length ?? 0,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final review = location.reviews?[index];

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: const Interval(0.2, 1, curve: Curves.easeInExpo),
            ),
            child: child,
          ),
          child: buildReview(review!),
        );
      });

  Widget buildReview(Review review) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeroWidget(
                  tag: HeroTag.avatar(review, locations.indexOf(location)),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(review.urlImage ?? ''),
                  ),
                ),
                Text(
                  review.username ?? '',
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(),
                Text(
                  review.date ?? '',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const Icon(Icons.thumb_up_alt_outlined, size: 14)
              ],
            ),
            const SizedBox(height: 8),
            Text(
              review.description ?? '',
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
}

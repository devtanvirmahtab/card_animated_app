import 'package:card_animated_app/app/widgets/stars.dart';
import 'package:flutter/material.dart';

import '../data/hero_tag.dart';
import '../models/location.dart';
import 'hero_widget.dart';

class DetailedInfoWidget extends StatelessWidget {
  final Location location;

  const DetailedInfoWidget({super.key,
     required this.location,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeroWidget(
          tag: HeroTag.addressLine1(location),
          child: Text(location.addressLine1 ?? ''),
        ),
        const SizedBox(height: 8),
        HeroWidget(
          tag: HeroTag.addressLine2(location),
          child: Text(location.addressLine2 ?? ''),
        ),
        const SizedBox(height: 8),
        HeroWidget(
          tag: HeroTag.stars(location),
          child: StarsWidget(stars: location.starRating ?? 0),
        ),
      ],
    ),
  );
}

import 'package:boost_test/view/recources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RatingBarWidget extends StatelessWidget {
  final double rateValue;

  const RatingBarWidget({
    super.key,
    required this.rateValue,
  });
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      unratedColor: Colors.grey,
      itemSize: AppSizeSp.s12,
      rating: rateValue,
      itemBuilder: (context, _) => const Icon(
        Icons.star_rate_rounded,
        color: Colors.yellow,
      ),
    );
  }
}
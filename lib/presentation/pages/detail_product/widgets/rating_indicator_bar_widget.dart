import 'package:e_commerce_electronics/common/theme.dart';
import 'package:flutter/material.dart';

class RatingIndicatorBarWidget extends StatelessWidget {
  final double rating;
  final double maxRating;
  final int starCount;
  final int reviewsCount;

  const RatingIndicatorBarWidget({
    Key? key,
    required this.rating,
    required this.maxRating,
    this.starCount = 5,
    required this.reviewsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menghitung berapa banyak bintang yang harus diberi warna
    int filledStars = (rating / maxRating * starCount).floor();

    // Membuat daftar ikon bintang berdasarkan jumlah bintang yang harus diberi warna
    List<Widget> starIcons = List.generate(
      filledStars,
      (index) => Icon(
        Icons.star,
        color: Colors.blue[400],
        size: 18,
      ),
    );

    // Membuat daftar ikon bintang kosong (tanpa warna)
    List<Widget> emptyStars = List.generate(
      starCount - filledStars,
      (index) => Icon(
        Icons.star,
        color: greyColor.withOpacity(0.5),
        size: 18,
      ),
    );

    // Menggabungkan daftar ikon bintang berwarna dan kosong
    List<Widget> allStars = [...starIcons, ...emptyStars];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: allStars,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          '$reviewsCount Reviews',
          style: greyTextStyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
          ),
        ),
      ],
    );
  }
}

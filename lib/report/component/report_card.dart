import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final Image? image;
  final List<String> keywords;
  final String summary;
  final String date;

  const ReportCard({
    super.key,
    this.image,
    required this.keywords,
    required this.summary,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            width: 121,
            height: 121,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/image/onboarding/page1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: keywords.map((keyword) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "#$keyword",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Text(
                  summary,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  date,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

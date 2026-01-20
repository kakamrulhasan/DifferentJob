import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import '../../../../data/models/ad_model.dart';

class AdCard extends StatelessWidget {
  final AdModel ad;
  const AdCard({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Rounded Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              ad.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildPill(ad.category,ColorManager.white, const Color(0xFF7B1FA2)),
                    const Spacer(),
                    _buildStatusPill(ad.status),
                    const SizedBox(width: 8),
                    const Icon(Icons.more_horiz, color: Colors.black54, size: 20),
                  ],
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  ad.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // Location and Time Row
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        "${ad.location}  •  ${ad.postedTime}",
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ad.price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    if (ad.remainingTime.isNotEmpty)
                      _buildPill(ad.remainingTime, const Color(0xFFFFEBEE), Colors.red.shade400),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPill(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatusPill(AdStatus status) {
    Color bg;
    Color text;
    String label = status.name[0].toUpperCase() + status.name.substring(1);

    switch (status) {
      case AdStatus.active:
        bg = const Color(0xFFE8F5E9);
        text = Colors.green;
        break;
      case AdStatus.rejected:
        bg = const Color(0xFFFFEBEE);
        text = Colors.red;
        break;
      case AdStatus.pause:
      case AdStatus.pending:
        bg = const Color(0xFFFFF8E1);
        text = Colors.orange;
        break;
      case AdStatus.ended:
        bg = Colors.grey.shade100;
        text = Colors.grey;
        break;
    }
    return _buildPill(label, bg, text);
  }
}
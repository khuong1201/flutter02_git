import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowMoreFeatures extends StatefulWidget {
  final List<Map<String, String>> features;

  const ShowMoreFeatures({super.key, required this.features});

  @override
  State<ShowMoreFeatures> createState() => _ShowMoreFeaturesState();
}

class _ShowMoreFeaturesState extends State<ShowMoreFeatures> {
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final visibleItems = _showAll
        ? widget.features
        : widget.features.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...visibleItems.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                SvgPicture.asset(
                  item['icon']!,
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                Text(
                  item['label']!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3D3F40),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (widget.features.length > 5)
          InkWell(
            onTap: () {
              setState(() {
                _showAll = !_showAll;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              height: 46,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 2.0),
              ),
              child: Center(
                child: Text(
                  _showAll
                      ? 'Hide amenities'
                      : 'Show all ${widget.features.length} amenities',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

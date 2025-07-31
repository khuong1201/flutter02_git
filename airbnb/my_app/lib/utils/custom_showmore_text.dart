import 'package:flutter/material.dart';

class CustomExpandableTextRow extends StatefulWidget {
  final String text;
  final int charLimit;

  const CustomExpandableTextRow({
    super.key,
    required this.text,
    required this.charLimit,
  });

  @override
  State<CustomExpandableTextRow> createState() => _CustomExpandableTextRowState();
}

class _CustomExpandableTextRowState extends State<CustomExpandableTextRow> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isOverflowing = widget.text.length > widget.charLimit;
    final displayText = _isExpanded || !isOverflowing
        ? widget.text
        : '${widget.text.substring(0, widget.charLimit)}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 16),
        if (isOverflowing)
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                  child: Text(
                    _isExpanded ? 'Hide' : 'Show more',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.chevron_right,
                  color: Colors.black,
                  size: 24,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

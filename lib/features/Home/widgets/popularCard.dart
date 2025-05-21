import 'package:flutter/material.dart';

class PopularCard extends StatefulWidget {
  final String imageUrl;
  final String itemName;
  final String location;
  final double progressValue;

  const PopularCard({
    Key? key,
    required this.imageUrl,
    required this.itemName,
    required this.location,
    required this.progressValue,
  }) : super(key: key);

  @override
  _PopularCardState createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  bool isHovered = false;
  bool isImageHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedScale(
          scale: isHovered ? 1.05 : 1.0,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Container(
            width: double.infinity,
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isHovered ? 0.2 : 0.1),
                  blurRadius: 16,
                  spreadRadius: 4,
                  offset: Offset(0, isHovered ? 6 : 3),
                )
              ],
            ),
            child: Row(
              children: [
                MouseRegion(
                  onEnter: (_) => setState(() => isImageHovered = true),
                  onExit: (_) => setState(() => isImageHovered = false),
                  child: AnimatedScale(
                    scale: isImageHovered ? 1.1 : 1.0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.imageUrl,
                        width: 160,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      Text(
                        widget.itemName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.blue, size: 20),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              widget.location,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "Available",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(flex: 1),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 40, 
                                height: 40,
                                child: CircularProgressIndicator(
                                  value: widget.progressValue,
                                  backgroundColor: Colors.grey[300],
                                  color: widget.progressValue > 0.7
                                      ? Colors.green
                                      : widget.progressValue > 0.4
                                          ? Colors.orange
                                          : Colors.red,
                                  strokeWidth: 5,
                                ),
                              ),
                              Text(
                                "${(widget.progressValue * 100).toInt()}%",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: Row(
                          children: [
                            Expanded(
                              child: TweenAnimationBuilder<double>(
                                tween: Tween<double>(
                                    begin: 0, end: widget.progressValue),
                                duration: Duration(milliseconds: 600),
                                builder: (context, value, child) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: LinearProgressIndicator(
                                      value: value,
                                      backgroundColor: Colors.grey[300],
                                      color: widget.progressValue > 0.7
                                          ? Colors.green
                                          : widget.progressValue > 0.4
                                              ? Colors.orange
                                              : Colors.red,
                                      minHeight: 9,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

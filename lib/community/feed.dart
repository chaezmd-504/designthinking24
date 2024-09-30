import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  final String title;
  final String locationAndTime;
  final String price;
  final VoidCallback onTap;
  final String field; // New field parameter
  final Color backgroundColor; // New background color parameter

  const Feed({
    Key? key,
    required this.title,
    required this.locationAndTime,
    required this.price,
    required this.onTap,
    required this.field, // Initialize new field parameter
    this.backgroundColor = Colors.white, // Default background color
  }) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isFavorite = false;
  int favoriteCount = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: widget.backgroundColor, // Set background color
        padding: EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.field, // Display the field
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.locationAndTime,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.price,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isFavorite) {
                              favoriteCount--;
                            } else {
                              favoriteCount++;
                            }
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              isFavorite
                                  ? CupertinoIcons.heart_fill
                                  : CupertinoIcons.heart,
                              color: isFavorite ? Colors.pink : Colors.black,
                              size: 16,
                            ),
                            Text(
                              '$favoriteCount',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

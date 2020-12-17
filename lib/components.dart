// =========================== buildProgress
import 'package:flutter/material.dart';

void buildProgress({
  context,
  text,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(
                text,
              ),
            ),
          ],
        ),
      ),
    );

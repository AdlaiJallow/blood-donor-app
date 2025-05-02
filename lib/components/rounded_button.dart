import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback? onPressed;
  const RoundedButton({
    super.key,
    required this.color,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SizedBox(
          width: 200.0,
          height: 42.0,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              child: Text(
                title,
                style: const TextStyle(color: Colors.white),
              )),
        ));
  }
}


// MaterialButton(
//           onPressed: onPressed,
//           minWidth: 200.0,
//           height: 42.0,
//           child: Text(
//             title,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
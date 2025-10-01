import 'package:flutter/material.dart';

class PageNotFoundWidget extends StatelessWidget {
  const PageNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '404 - Page Not Found',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Center(
          child: Text(
            'Opps! The page you are looking for doesn\'t exist. It might have been moved or delete',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Go Back'),
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmployeeImagePreviewScreen extends StatelessWidget {

  const EmployeeImagePreviewScreen({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final isSvg = imageUrl.toLowerCase().endsWith('.svg');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Photo'),
      ),
      body: Center(
        child: InteractiveViewer(
          child: isSvg
              ? SvgPicture.network(imageUrl)
              : Image.network(imageUrl),
        ),
      ),
    );
  }
}
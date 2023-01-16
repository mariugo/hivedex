import 'package:flutter/material.dart';
import 'package:hivedex/constants/app_constants.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitComplete;

  const SplashPage({
    Key? key,
    required this.onInitComplete,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (_) => widget.onInitComplete(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(icon),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

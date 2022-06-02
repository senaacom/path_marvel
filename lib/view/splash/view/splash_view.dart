import 'package:flutter/material.dart';

import '../viewmodel/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashViewModel viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel();
  }

  void _viewModel() {
    viewModel = SplashViewModel();
    viewModel.route();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/marvel.jpeg",
      fit: BoxFit.cover,
    );
  }
}

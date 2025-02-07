import 'package:flutter/material.dart';

class StartupContainer extends StatefulWidget {
  final Function onInit;
  final Widget child;
  final Function? onDisposed;
  final int? delayInitDuration;
  const StartupContainer(
      {super.key,
      required this.onInit,
      required this.child,
      this.onDisposed,
      this.delayInitDuration});

  @override
  State<StartupContainer> createState() => _StartupContainerState();
}

class _StartupContainerState extends State<StartupContainer> {
  bool _isInit = false;
  late BuildContext buildContext;

  @override
  void didChangeDependencies() {
    initialize();
    super.didChangeDependencies();
  }

  initialize() async {
    if (!_isInit) {
      final duration = widget.delayInitDuration ?? 200;
      if (duration > 0) {
        await Future.delayed(Duration(microseconds: duration));
      }

      if (!mounted) return;
      widget.onInit();

      buildContext = context;
      _isInit = true;
    }
  }

  @override
  void dispose() {
    if (widget.onDisposed != null) widget.onDisposed!();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
late final Widget Function(BuildContext context, T model, Widget? child) builder;
  final T? model;
  final Widget? child;
 late final Function(T) onModelReady;

  BaseView({
    Key? key,
    required this.builder,
    this.model,
    this.child,
    required this.onModelReady,
  }) : super(key: key);

  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T? model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
    widget.onModelReady(model!) ;

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
        value: model!, child: Consumer<T>(builder:widget.builder));
  }
}

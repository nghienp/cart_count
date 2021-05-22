import 'dart:math';

import 'package:demo_cart_count/core/helpers/app_constants.dart';
import 'package:demo_cart_count/core/helpers/base_view.dart';
import 'package:demo_cart_count/features/main/presentation/viewmodel/main_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    titleHeaderWidget(),
                    Spacer(),
                    BaseView<MainScreenViewModel>(
                      model: sl(),
                      onModelReady: (model) {
                        model.counterIncrement();
                      },
                      builder: (context, model, child) {
                        return cartWidget(model.counter);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonResetWidget(),
                    buttonAddWidget()
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget cartWidget(int count) {
    return SizedBox(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          Icon(
            Icons.shopping_cart,
            size: 32,
            color: Colors.blue,
          ),
          Container(
            child: Center(
                child: Text(
              count.toString(),
              style: TextStyle(color: Colors.white),
            )),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
            constraints: BoxConstraints(minWidth: 15, maxWidth: 19, minHeight: 15, maxHeight: 18),
          ),
        ],
      ),
    );
  }

  Widget buttonResetWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingDefault,
      ),
      child: InkWell(
        onTap: () {
          sl<MainScreenViewModel>().reset();
        },
        child: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(30))),
          child:Center(
            child: Text(
              'Reset',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: AppConstants.fontSemiBold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonAddWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingDefault,
      ),
      child: InkWell(
        onTap: () {
          sl<MainScreenViewModel>().counterIncrement();
        },
        child: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Icon(
            Icons.add,
            size: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget titleHeaderWidget() {
    return Center(
      child: Text(
        'CART COUNTER',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0,
          fontWeight: AppConstants.fontSemiBold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:benjamin/core/widgets/reuseables/padding/pad.dart';
import 'package:benjamin/core/utils/extensions/utils_extensions.dart';
import 'package:benjamin/core/widgets/reuseables/appbar/iappbar.dart';
import 'package:benjamin/core/widgets/reuseables/formfields/customformfield.dart';
// ignore_for_file: prefer_const_constructors

class Benjamin extends StatefulWidget {
  const Benjamin({super.key});

  @override
  State<Benjamin> createState() => _BenjaminState();
}

class _BenjaminState extends State<Benjamin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.scaffold,
        appBar: IAppBar(),
        body: Pad(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              IFormField(
                context,
                title: "Street Address",
              ),
              SizedBox(
                height: 20.h,
              ),
              IFormField(
                context,
                title: "Street Address Line 2",
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (context.getWidth() / 2) - 13.w,
                    child: IFormField(
                      context,
                      title: "City",
                    ),
                  ),
                  SizedBox(
                    width: (context.getWidth() / 2) - 13.w,
                    child: IFormField(
                      context,
                      title: "Zip",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              IFormField(
                context,
                title: "State",
              ),
            ],
          ),
        ));
  }
}

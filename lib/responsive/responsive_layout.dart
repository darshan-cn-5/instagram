// ignore_for_file: use_super_parameters, unused_element, annotate_overrides

import 'package:flutter/material.dart';
import 'package:instagram1/providers/user_provider.dart';
import 'package:instagram1/utils/dimensions.dart';
import 'package:provider/provider.dart';


class ResponsiveLayout extends StatefulWidget{
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    Key? key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  

  @override

 void initState() {
    super.initState();
    addData() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }
  }

  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context, constraints){
        if (constraints.maxWidth > webScreenSize){
          return widget.webScreenLayout;
        }else{
          return widget.mobileScreenLayout;
        }
      },
    );
  }
}

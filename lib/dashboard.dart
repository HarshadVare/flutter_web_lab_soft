import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/core/utils/responsive.dart';
import 'package:primecare_lab_soft/presentation/screens/home_screen.dart';
import 'package:primecare_lab_soft/presentation/widgets/custom_header.dart';
import 'package:primecare_lab_soft/widgets/menu.dart';
import 'package:primecare_lab_soft/widgets/profile/profile.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(width: 250, child: Menu(scaffoldKey: _scaffoldKey))
          : SizedBox(width: 300, child: Menu(scaffoldKey: _scaffoldKey)),
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Profile(),
            )
          : SizedBox(width: 300, child: const Profile()),
      body: SafeArea(
        child: Column(
          children: [
            CustomeHeader(scaffoldKey: _scaffoldKey),
            if (Responsive.isDesktop(context) || Responsive.isTablet(context))
              HomeScreen(),
          ],
        ),
      ),
    );
  }
}


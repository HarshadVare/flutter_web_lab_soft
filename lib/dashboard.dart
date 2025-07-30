import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/pages/home/home_page.dart';
import 'package:primecare_lab_soft/responsive.dart';
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
          : null,
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Profile(),
            )
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Menu(scaffoldKey: _scaffoldKey),
                ),
              ),
            Expanded(flex: 9, child: HomePage(scaffoldKey: _scaffoldKey)),
            // if (!Responsive.isMobile(context))
            //   const Expanded(flex: 4, child: Profile()),
          ],
        ),
      ),
    );
  }
}

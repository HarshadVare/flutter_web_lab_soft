import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/common/utils/responsive.dart';
import 'package:primecare_lab_soft/features/dashboard/presentation/home_screen.dart';
import 'package:primecare_lab_soft/common/widgets/common_header.dart';
import 'package:primecare_lab_soft/features/side_menu/presentation/menu.dart';
import 'package:primecare_lab_soft/features/profile/presentation/profile.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: isDesktop
          ? SizedBox(width: 300, child: Menu(scaffoldKey: _scaffoldKey))
          : SizedBox(width: 250, child: Menu(scaffoldKey: _scaffoldKey)),
      endDrawer: SizedBox(
        width: isMobile ? MediaQuery.of(context).size.width * 0.8 : 300,
        child: const Profile(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ///
            CustomeHeader(scaffoldKey: _scaffoldKey),

            ///
            const HomeScreen(),
          ],
        ),
      ),
    );
  }
}

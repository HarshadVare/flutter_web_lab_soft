
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:primecare_lab_soft/core/utils/responsive.dart';

class CustomeHeader extends StatelessWidget {
  const CustomeHeader({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () => _scaffoldKey.currentState!.openDrawer(),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(Icons.menu, color: Colors.grey, size: 25),
                  ),
                ),
              ),

              Text(
                Responsive.isDesktop(context) || Responsive.isTablet(context)
                    ? 'Pathology Lab Software'
                    : 'PLABSOFT',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 300,
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    hintText: 'Search Patient By Id/Name',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 21,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset("assets/svg/Profile.svg", width: 22),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

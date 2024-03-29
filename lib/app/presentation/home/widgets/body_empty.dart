import 'package:flutter/material.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';

class DashboardBodyEmpty extends StatelessWidget {
  const DashboardBodyEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '/assets/images/Opps.png',
            package: 'ct_micro_commons_shared',
            width: 350,
          ),
          const SizedBox(height: 9),
          Text(
            "home-page-body-empty-list".i18n(),
            style: GoogleFonts.poppins(
              color: const Color(0xff393d6e),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 9),
          CuiaButtons.link(
            "home-page-body-empty-list-link".i18n(),
            onTap: () => Modular.to.pushNamed("/store"),
          ),
        ],
      ),
    );
  }
}

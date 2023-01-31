// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';

class DashboardBodyList extends StatelessWidget {
  const DashboardBodyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CuiaGridRow(
        children: List.generate(
          10,
          (index) => CuiaGridColumn(
            xs: 6,
            sm: 5,
            md: 4,
            lg: 3,
            xl: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xff2196f3),
                  width: 1,
                ),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      '/assets/images/system_page.png',
                      package: 'flut_micro_commons_shared',
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Syncro",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Síncronismo de produtos nos e-commerces",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff8f8f8f),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

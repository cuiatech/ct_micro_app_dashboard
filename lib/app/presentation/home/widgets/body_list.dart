// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';
import 'package:flut_micro_commons_shared/shared/domain/models/dto/app_dto.dart';

class DashboardBodyList extends StatelessWidget {
  const DashboardBodyList({
    Key? key,
    required this.apps,
  }) : super(key: key);

  final List<AppDto> apps;

  static loading(int lenght) {
    return CuiaGridRow(
      children: List.generate(
        lenght,
        (index) => CuiaGridColumn(
          xs: 6,
          sm: 5,
          md: 4,
          lg: 3,
          xl: 2,
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xff2196f3),
                width: 1,
              ),
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CuiaGridRow(
        children: apps
            .map((e) => _item(
                  title: e.title,
                  description: e.description,
                  onTap: () {},
                ))
            .toList(),
      ),
    );
  }

  CuiaGridColumn _item({
    required String title,
    required String description,
    String? urlImage,
    Function()? onTap,
  }) {
    return CuiaGridColumn(
      xs: 6,
      sm: 5,
      md: 4,
      lg: 3,
      xl: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xff2196f3),
            width: 1,
          ),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              urlImage == null
                  ? Image.asset(
                      '/assets/images/system_page.png',
                      package: 'flut_micro_commons_shared',
                    )
                  : Image.network(urlImage),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff8f8f8f),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

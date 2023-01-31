// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';

import 'widgets/body_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: const CuiaAppBar(),
      body: const DashboardBodyList(),
      endDrawer: const Drawer(
        backgroundColor: Colors.white,
        width: 500,
        child: SizedBox(),
      ),
    );
  }
}

class CuiaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CuiaAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: const Color(0xff2196f3),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: CuiaLogo.horizontal(
              text: "Workspace",
              width: 50,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  child: Text("A"),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: CuiaIcons.support(white: true, size: 28),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

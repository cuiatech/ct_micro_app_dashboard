// ignore_for_file: must_be_immutable, depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';

class ErrorMessageWidget extends StatefulWidget {
  const ErrorMessageWidget({
    required this.type,
    required this.message,
    this.actions,
    Key? key,
  }) : super(key: key);

  final String type;
  final String message;
  final List<Map<String, dynamic>>? actions;

  @override
  State<ErrorMessageWidget> createState() => _ErrorMessageWidgetState();
}

class _ErrorMessageWidgetState extends State<ErrorMessageWidget> {
  bool loading = false;

  Color colorType() {
    if (widget.type == "warning") {
      return const Color.fromARGB(255, 246, 246, 108);
    }
    if (widget.type == "danger") {
      return const Color.fromARGB(255, 246, 108, 108);
    }
    return const Color.fromARGB(255, 108, 214, 246);
  }

  Widget iconType() {
    if (widget.type == "warning") {
      return const Icon(Icons.warning);
    }
    if (widget.type == "danger") {
      return const Icon(Icons.error);
    }

    return const Icon(Icons.info);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorType(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          iconType(),
          const SizedBox(width: 10),
          Text(widget.message),
          const SizedBox(width: 10),
          Row(
            children: widget.actions != null
                ? widget.actions!
                    .map((e) => CuiaButtons.link(
                          e['value'],
                          onTap: () async {
                            setState(() => loading = true);
                            var res = await e['onTap']();
                            if (!res.success) {
                              CuiaToast.error(
                                res.message,
                                context: context,
                              );
                            }
                            setState(() => loading = false);
                          },
                          loading: loading,
                        ))
                    .toList()
                : [],
          ),
        ],
      ),
    );
  }
}

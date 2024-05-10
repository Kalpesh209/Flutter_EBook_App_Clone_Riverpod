import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../config/constants.dart';

class CountryDial extends StatelessWidget {
  final Function onChanged;
  const CountryDial({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CountryCodePicker(
          initialSelection: "in",
          favorite: ['+44','uk',"+91","in"],
          onChanged: (d) => {
            debugPrint("get number ${d.dialCode}"),
            countryCode = d.code ?? '+91',
            onChanged(d),
          },
          builder: (p0) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 16),
              Image.asset(
                p0?.flagUri?.toString() ?? '',
                package: 'country_code_picker',
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(p0?.dialCode?.toString() ?? ''),
              const SizedBox(width: 2),
              Transform.rotate(
                  angle: 90 * math.pi / 180,
                  child: const Icon(Icons.chevron_right)),
            ],
          ),
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}

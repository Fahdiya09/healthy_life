import 'package:flutter/material.dart';
import 'package:healthy_life/model/polahidup.dart';
import 'package:healthy_life/ui/polahidup/polahidup_detail.dart';

class PolahidupItem extends StatelessWidget {
  final Polahidup polahidup;

  const PolahidupItem({super.key, required this.polahidup});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        
        child: ListTile(
          title: Text(
            polahidup.hari,
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PolahidupDetail(polahidup: polahidup)));
      },
    );
  }
}

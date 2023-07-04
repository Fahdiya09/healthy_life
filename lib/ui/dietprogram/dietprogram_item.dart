import 'package:flutter/material.dart';
import 'package:healthy_life/model/dietprogram.dart';
import 'package:healthy_life/ui/beranda.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_detail.dart';

class DietprogramItem extends StatelessWidget {
  final Dietprogram dietprogram;

  const DietprogramItem({super.key, required this.dietprogram});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(
            dietprogram.jenis,
          ),
        ),
      ),
    
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DietprogramDetail(dietprogram: dietprogram)));
      },
    );
  }
}

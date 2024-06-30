import 'package:flutter/material.dart';

class TecaherCard extends StatelessWidget {
  const TecaherCard(
      {super.key, required this.materialName, required this.materialID});
  final String materialName;
  final String materialID;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 8,
            bottom: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                materialName,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'your code is $materialID',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:live_online_radio/Models/models.dart';

class RadioListPlayView extends StatelessWidget {
  const RadioListPlayView({
    Key? key,
    required this.radioData,
  }) : super(key: key);

  final RadioModel radioData;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.network(
            radioData.favicon,
            errorBuilder: (context, error, stackTrace) {
              return const Image(
                image: AssetImage(
                  'Asset/Images/radioImage.jpeg',
                ),
                height: double.maxFinite,
                width: double.infinity,
                fit: BoxFit.fill,
              );
            },
            fit: BoxFit.fill,
            height: 500,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

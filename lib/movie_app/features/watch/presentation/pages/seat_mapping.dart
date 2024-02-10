import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/place_holders.dart';
import 'package:movieapp/core/utils/utils.dart';
import 'package:movieapp/core/widgets/button_widget.dart';

class SeatMappingScreen extends StatelessWidget {
  const SeatMappingScreen({super.key, required this.name, required this.date});

  final String name;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              name ?? '',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
              textAlign: TextAlign.center,
            ),
            minPlaceHolder,
            Text(
              "In theaters ${formatReleaseDate(date) ?? ''}",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(),
            ButtonWidget(
              text: "Select Seats",
              width: MediaQuery.of(context).size.width,
              buttonType: ButtonType.fill,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

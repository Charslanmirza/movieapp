import 'package:flutter/material.dart';
import 'package:movieapp/movie_app/features/watch/widgets/movie_card_widget.dart';

import '../../../../../core/widgets/cvc_field_c.dart';

class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomTextField(
          isMainScreenText: true,
          hintText: "Tv shows,Movies and More",
          onTap: () {
            // Get.to(() => GoogleMapScreen());
          },
          prefixIcon: Container(
              margin: const EdgeInsets.only(right: 5),
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEEE),
                borderRadius: BorderRadius.all(Radius.circular(9.00)),
              ),
              child: const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
              )),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1.0,
                    // You can adjust the aspect ratio as needed
                    child: Image.network(
                      'https://plus.unsplash.com/premium_photo-1661481393984-b98db3900f3e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHx8MA%3D%3D',
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Text(
                      "",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

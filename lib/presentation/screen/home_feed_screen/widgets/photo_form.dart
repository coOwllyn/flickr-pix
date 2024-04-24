import 'package:flutter/material.dart';
import 'package:mobile_challenge/presentation/screen/home_feed_screen/widgets/full_screen_photo.dart';

import 'package:mobile_challenge/presentation/style/app_colors.dart';
import 'package:mobile_challenge/presentation/style/app_text_style.dart';

class PhotoForm extends StatelessWidget {
  const PhotoForm({
    super.key,
    required this.image,
    required this.title,
    required this.owner,
  });

  final String image;
  final String title;
  final String owner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   showDialog(
      //       context: context,
      //       builder: (context) {
      //         return Dialog(
      //           backgroundColor: Colors.transparent,
      //           child: Container(
      //             decoration: const BoxDecoration(
      //                 color: AppColors.bgLight,
      //                 borderRadius: BorderRadius.all(Radius.circular(10))),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 const SizedBox(height: 10),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10, right: 10),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text(
      //                         owner,
      //                         maxLines: 2,
      //                         textAlign: TextAlign.start,
      //                         style: getHeaderStyle(
      //                           fontSize: 18,
      //                           color: AppColors.textLight,
      //                         ),
      //                       ),
      //                       GestureDetector(
      //                         onTap: () {
      //                           Navigator.pop(context);
      //                         },
      //                         child: const Icon(
      //                           Icons.close,
      //                           color: AppColors.red,
      //                           size: 25,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 const SizedBox(height: 10),
      //                 SizedBox(
      //                   width: double.infinity,
      //                   child: Image.network(
      //                     image,
      //                     fit: BoxFit.fitWidth,
      //                   ),
      //                 ),
      //                 const SizedBox(height: 15),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10, right: 10),
      //                   child: Text(
      //                     title,
      //                     maxLines: 2,
      //                     overflow: TextOverflow.ellipsis,
      //                     textAlign: TextAlign.start,
      //                     style: getBodyStyle(
      //                       fontSize: 14,
      //                       color: AppColors.textLight,
      //                     ),
      //                   ),
      //                 ),
      //                 const SizedBox(height: 15),
      //               ],
      //             ),
      //           ),
      //         );
      //       });
      // },
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FullScreenPhoto(photoUrl: image),
        ));
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              owner,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: getHeaderStyle(
                fontSize: 18,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: getBodyStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

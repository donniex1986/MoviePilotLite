import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class MixedImgWidget extends StatelessWidget {
  const MixedImgWidget({super.key, this.imageUrls});
  final List<String>? imageUrls;
  @override
  Widget build(BuildContext context) {
    if (imageUrls == null || imageUrls!.isEmpty) {
      return Container();
    }
    if (imageUrls!.length == 1) {
      final imageUrl = imageUrls![0];
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: imageUrl.isNotEmpty
            ? CachedImage(imageUrl: imageUrl, fit: BoxFit.cover)
            : Container(
                color: CupertinoColors.systemGrey6,
                child: Center(
                  child: Icon(
                    CupertinoIcons.collections,
                    size: 48,
                    color: CupertinoColors.systemGrey4,
                  ),
                ),
              ),
      );
    }
    // 计算图片数量的平方根作为行/列数，最小为1
    final count = ((imageUrls?.length ?? 0) > 0)
        ? (sqrt(imageUrls!.length)).ceil()
        : 1;
    // 取图片数量的开方，若为0则设为1
    final crossAxisCount = count > 0 ? count : 1;
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      children:
          imageUrls
              ?.map(
                (e) => CachedImage(
                  imageUrl: e,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(12),
                ),
              )
              .toList() ??
          [],
    );
  }
}

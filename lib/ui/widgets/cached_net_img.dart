import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tlt_manager/ui/exports/styles.dart';

Widget cachedNetImgWithRadius(String url, double width, double height, double radius) => ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        height: height,
        width: width,
        fit: BoxFit.cover,
        //placeholder: (context, url) => CircularProgressIndicator(),
        imageUrl: url,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Lottie.asset('assets/animations/lottiefiles/loading-dots.json', repeat: true, width: 100, height: 100),
        errorWidget: (context, url, error) => Image.network(Strings.imgUrlNotFound),
      ),
    );

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget cachedNetImage(String url) => CachedNetworkImage(
  fit: BoxFit.cover,
  //placeholder: (context, url) => CircularProgressIndicator(),
  imageUrl: url,
  progressIndicatorBuilder: (context, url, downloadProgress) =>
      Lottie.asset('assets/animations/lottiefiles/loading-dots.json', repeat: true, width: 50, height: 100),
  errorWidget: (context, url, error) => Icon(Icons.image_not_supported_outlined),
);
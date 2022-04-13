import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:blurhash/blurhash.dart';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:wallpix/designs/designs.e.dart';

class DesignImage extends StatelessWidget {
  final String blurHash;
  final String imageUrl;
  final double? horizontalSlide;
  final BoxFit boxFit;

  const DesignImage(
      {Key? key,
      required this.blurHash,
      required this.imageUrl,
      this.horizontalSlide = 0,
      this.boxFit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurHashImage(
      image: imageUrl,
      blurHash: blurHash,
      fit: boxFit,
    );
  }
}
// BlurHash(
//       hash: blurHash,
//       image: imageUrl,
//       imageFit: BoxFit.cover,
//       curve: Curves.ease,
//     );

class BlurHashImage extends StatefulWidget {
  const BlurHashImage(
      {Key? key,
      required this.blurHash,
      required this.image,
      this.width,
      this.height,
      this.fit = BoxFit.cover})
      : super(key: key);

  final String blurHash;
  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  _BlurHashImageState createState() => _BlurHashImageState();
}

class _BlurHashImageState extends State<BlurHashImage> {
  Uint8List? _imageDataBytes;

  @override
  void initState() {
    super.initState();
    blurHashDecode();
  }

  Future blurHashDecode() async {
    Uint8List? imageDataBytes;

    try {
      imageDataBytes = await BlurHash.decode(widget.blurHash, 32, 32);
    } on PlatformException catch (e) {
      log(e.message.toString());
    }

    setState(() {
      _imageDataBytes = imageDataBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _imageDataBytes == null
        ? SizedBox(width: widget.width, height: widget.height)
        : Stack(
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 1,
                child: Image.memory(
                  _imageDataBytes!,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget.image,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                ),
              )
            ],
          );
  }
}

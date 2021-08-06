import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:myapp/data_provider/image_provider.dart';

class ImageZoom extends StatefulWidget {
  final int index;
  ImageZoom({Key? key, required this.index});
  @override
  _ImageZoomState createState() => _ImageZoomState();
}

class _ImageZoomState extends State<ImageZoom> {
  ImgProvider? imgProviderRead;
  ImgProvider? imgProviderWatch;

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) async {
      imgProviderWatch = context.read<ImgProvider>();
      imgProviderWatch!.setImageList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    imgProviderWatch = context.watch<ImgProvider>();

    return Scaffold(
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              ///Photo
              Positioned.fill(child: _carouselWidget(widget.index)),

              ///BackArrow
              Positioned(
                top: 20,
                left: 30,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
              ),
            ],
          )),
    );
  }

  ///Returns Photo of cloth
  Widget _carouselWidget(int currentIndex) {
    return CarouselSlider(
      options: CarouselOptions(
          height: double.infinity,
          viewportFraction: 1,
          scrollPhysics: ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          autoPlay: false,
          initialPage: currentIndex),
      items: <Widget>[
        for (var i = 0; i < imgProviderWatch!.imgList.length; i++)
          InteractiveViewer(
              maxScale: 10.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imgProviderWatch!.imgList[i].url ?? ""),
              ))
      ],
    );
  }
}

class ImagesList {
  final List<String> imagesList;
  final int currentIndex;
  ImagesList({required this.currentIndex, required this.imagesList});
}

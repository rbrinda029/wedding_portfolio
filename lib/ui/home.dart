import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myapp/ui/about.dart';
import 'package:myapp/utils/progressbar.dart';
import 'package:provider/provider.dart';
import 'package:myapp/data_provider/image_provider.dart';
import 'package:myapp/ui/image_zoom.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHover = false;
  ImgProvider? imgProviderRead;
  ImgProvider? imgProviderWatch;

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) async {
      imgProviderRead = context.read<ImgProvider>();
      imgProviderRead!.setImageList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    imgProviderWatch = context.watch<ImgProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "--: Gallery :--",
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          _menuButton("about", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => AboutPage()));
          }),
          SizedBox(
            width: 14,
          ),
          _menuButton("contact", () {}),
          SizedBox(
            width: 14,
          ),
          _menuButton("clients", () {}),
          SizedBox(
            width: 22,
          ),
        ],
      ),
      body: Stack(
        children: [
          imgProviderWatch!.isLoading
              ? Offstage()
              : GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 4 / 3),
                  itemCount: imgProviderWatch!.imgList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => ImageZoom(
                                      index: index,
                                    )));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imgProviderWatch!.imgList[index].url ?? "",
                          fit: BoxFit.fill,
                        ),

                        // "https://st2.depositphotos.com/2001755/5408/i/600/depositphotos_54081723-stock-photo-beautiful-nature-landscape.jpg"),
                      ),
                    );
                  },
                ),
          imgProviderWatch!.isLoading ? ProgressBar() : Offstage()
        ],
      ),
    );
  }

  Widget _menuButton(String title, var function) {
    return Center(
      child: TextButton(
        onPressed: function,
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered))
              return RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(8),
              );
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ); // Defer to the widget's default.
          }),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              decoration:
                  isHover ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}

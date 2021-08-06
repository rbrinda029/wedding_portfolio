import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "--: About :--",
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: Text(
            """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean rhoncus neque elementum mi posuere, sit amet laoreet est imperdiet. Aenean tempor turpis vel libero rutrum fringilla. Maecenas fringilla ante viverra metus gravida, sed iaculis nunc consectetur. Sed blandit lorem metus, non cursus nunc efficitur a. Suspendisse et nibh eu velit commodo luctus non quis ipsum. Aliquam tincidunt justo at iaculis venenatis. Fusce posuere quam sodales, ornare lacus a, malesuada lorem. Donec tempus rhoncus nunc sed iaculis. Pellentesque rhoncus vitae felis id congue. Nullam tincidunt mauris et leo sodales, in scelerisque metus placerat. Sed varius semper placerat. Etiam ac sollicitudin leo, at mattis magna. Nulla venenatis elit at ante hendrerit congue. Ut aliquet neque mauris, vitae eleifend nulla condimentum vestibulum. Morbi mattis ut leo a ultrices. Donec at nulla in felis tempus gravida.
    
    Curabitur gravida sollicitudin nibh nec volutpat. Quisque condimentum magna eros, sit amet viverra mauris ornare vitae. Etiam vel felis vel velit lacinia semper. Sed luctus nunc quis neque mollis, vel maximus turpis malesuada. Morbi quis velit at mauris facilisis iaculis in eu diam. Nulla eu dolor consectetur, congue velit nec, accumsan turpis. Ut non euismod ligula, nec imperdiet dolor. Vestibulum luctus in velit sed efficitur. Nullam luctus sem nisi, sit amet feugiat odio pretium ac. Curabitur ante erat, commodo nec dui sit amet, porttitor porta lorem. Nulla pretium nisl ex. Aliquam aliquet odio quis elementum efficitur. Donec gravida varius luctus. Morbi cursus tincidunt eros. Sed luctus vehicula enim, id consectetur magna finibus sit amet. Sed felis ante, bibendum sit amet sagittis vel, bibendum ut massa.
    
    Etiam vehicula diam sit amet orci consequat hendrerit. Mauris rutrum metus ac euismod eleifend. Ut eu odio sapien. Phasellus convallis nunc vel pharetra vulputate. Nunc euismod semper risus, at tristique lacus dignissim et. Sed sed faucibus mi, sed consectetur magna. Vivamus et urna at quam porttitor elementum at et ipsum.
    
    Aenean quis aliquet sem, nec aliquet metus. Vestibulum ornare erat id orci congue, non congue sapien placerat. Maecenas nec erat ut ligula consequat sagittis in quis leo. Sed velit nibh, tempus sit amet commodo nec, volutpat vel turpis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc ultrices orci id nisl hendrerit, ut viverra lacus lacinia. Ut volutpat quis nunc vitae imperdiet. Aenean volutpat justo ex, non venenatis quam vulputate sit amet. Proin a diam nunc. Suspendisse malesuada vitae enim eu pulvinar. Morbi laoreet nunc arcu. Integer a urna ac mauris congue malesuada.
    
    Aenean posuere feugiat arcu sed sagittis. Nulla auctor libero ut turpis imperdiet sodales nec non urna. Sed nec dolor a elit cursus pellentesque eget sed massa. Nullam eu lectus vel massa suscipit elementum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed eget lorem mi. Ut accumsan convallis suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."""),
      ),
    );
  }
}

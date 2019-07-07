import 'package:flutter/material.dart';
import 'package:movexp/home_tabs/vm/feature_vm.dart';
import 'package:movexp/utils/aaap_models.dart';
import 'package:movexp/utils/err.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Feature extends StatefulWidget {
  @override
  _FeatureState createState() => _FeatureState();
}

class _FeatureState extends State<Feature> {


  FeatureVM mFVM;

  Future<FeatureRes> mF;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    mFVM = FeatureVM();
    mF = mFVM.fetchShowAllImpl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xFF242830),
        key: _scaffoldKey,
        body: FutureBuilder(
            initialData: null,
            future: mF,
            builder: (context, snap) => _checkAPIData(context, snap)));

//    return Scaffold(
//      backgroundColor: const Color(0xFF242830),
//      body: ListView.builder(
//          itemCount: 10,
//          itemBuilder: (context, i){
//        return buidList(i);
//      })
//    );
  }


  Widget _checkAPIData(BuildContext c , AsyncSnapshot snap ){


    //ConnectionState.active = snap.connectionState
    if (snap.hasData) {

      // API
      // 404
      // catch
      FeatureRes _d = snap.data;





      if (_d.Status) {
        // API true
        return _buildList(c,_d);
      }else if (_d.is_loading) {

        return Center(child: CircularProgressIndicator(),);
      }


      else {
        return Scaffold(
          backgroundColor: const Color(0xFF242830),
          //backgroundColor: Theme.of(context).primaryColor,
//          appBar: AppBarr(),
          body: Err(
              bar_visibility: false,
              p_title: 'Fea',
              m: _d.Message, mL: () => setState(() {_d.is_loading = true;
            mF = mFVM.fetchShowAllImpl();
          })),
        );
      }
    } else {
      // initial loading
      return Center(child: CircularProgressIndicator(),);


    }

  }


  Widget _buildList(BuildContext c, FeatureRes d) {


    if(d.homeList.length == 0){
      return Container(
        width: double.infinity,
        height: 300,
        child: Center(
          child: Text('No Movies Found'),
        ),
      );
    }else {
      return ListView.builder(
        shrinkWrap: true,
          itemCount: d.homeList.length,
          itemBuilder: (context, i){
            return buidList(d,i);
          });
    }
  }

  Widget buidList(FeatureRes d, int i) {

    if(i == 0){
     // for banners
      return CarouselSlider(
        height: 200.0,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        //autoPlay: true,
//                autoPlayInterval: Duration(seconds: 3),
//                autoPlayAnimationDuration: Duration(milliseconds: 800),
//                pauseAutoPlayOnTouch: Duration(seconds: 10),
        enlargeCenterPage: true,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
        items: d.homeList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage(
                    width: double.infinity,
                    placeholder: AssetImage('assets/app_placeholder.png'),
                    image:  NetworkImage("http://image.tmdb.org/t/p/w500${i.movieList[0].backdrop_path}"),
                    fit: BoxFit.cover,
                    height: 180,
                  ),
                ),
              );
            },
          );
        }).toList(),
      );
  }else {

      // for movies
      //return Text('asdjasjkhd');

      return GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: d.homeList.length,
          gridDelegate:

          new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            HomeList _h = d.homeList[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FadeInImage(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  placeholder:
                  AssetImage('assets/app_logo_landscape.png'),
                  image: NetworkImage("http://image.tmdb.org/t/p/w200${_h.movieList[0].poster_path}"),
                  fit: BoxFit.cover,
                  height: 200,
                ),
              );
          });
//      return GridView.count(
//        crossAxisCount: 4,
//        children: <Widget>[
//          Text('asdjkashdka'),
//          Text('asdkasld'),
//          Text('asdkasld'),
//          Text('asdkasld'),
//          Text('asdkasld')
//        ]
//      );

    }
  }
}

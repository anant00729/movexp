import 'package:flutter/material.dart';
import 'package:movexp/home_tabs/feature.dart';
import 'package:movexp/home_tabs/movie_page.dart';
import 'package:movexp/home_tabs/tv_show.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {


  TabController _tab_controller;

  final List<String> data = ["FEATURE", "MOVIE", "TVSHOW"];


  @override
  void initState() {
    super.initState();
    _tab_controller = TabController(vsync: this, initialIndex: 0, length: 3);

//    mHVM = MovieHomeVM();
//    mF = mHVM.fetchShowAllImpl();
    //mHVM.getQuickTix();
  }



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          backgroundColor: Colors.grey.shade500,
        body: NestedScrollView(
//            key: _keyRed,
            physics: ClampingScrollPhysics(),
//            controller: _s_con,
            headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  //automaticallyImplyLeading: false,
//                  backgroundColor: const Color(0xff121416),
                  expandedHeight: 100,
                  snap: false,
                  centerTitle: false,
                  forceElevated: false,
                  pinned: true,
                  floating: true,
                  title:
                  Container(
                    //height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                        color: const Color(0xFF242830)
                    ),
                    margin: const EdgeInsets.only(top: 8,),
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: TextField(
                      //controller: _searchQuery,
                      //onChanged: (t)=> _onSearch(t),
                      decoration: InputDecoration(
                          enabled: false,
                          border: InputBorder.none,
                          icon: IconTheme(
                              data: IconThemeData(
                                color: const Color(0xFF8c9bad),
                              ),
                              child: Icon(Icons.search)),
                          //labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: const Color(0xFF8c9bad),fontSize: 14),
                          labelStyle: TextStyle(color: Colors.white,fontSize: 14),
                          hintText: 'Search'


                      ),
                    ),
                  ),
                  actions: <Widget>[
              Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                    padding: const EdgeInsets.only(left : 8.0 , right : 16.0, top: 8),
                    child: Container(
                    child: IconTheme(
                    data: IconThemeData(
                    color: Colors.white),
                    child: new Icon(Icons.language),
                    )),
                  ),
                  ),
              ),


                Material(
                type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.only(left : 8.0 , right : 16.0, top: 8),
                        child: Row(
                          children: <Widget>[
                            Container(
//                              color: Colors.white,
                                child:  IconTheme(
                                  data: IconThemeData(
                                      color: Colors.white),
                                  child: new Icon(Icons.account_circle),
                                ),),
                            //Text('${aap.mF.d_name ?? ''}' , style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 0.5),  maxLines: 1, overflow: TextOverflow.ellipsis, ),


                          ],
                        )
                    ),
                  ),
                ),

              ],

                  //automaticallyImplyLeading: true,

//                  flexibleSpace: FlexibleSpaceBar(
//                      collapseMode: CollapseMode.pin,
//                      //centerTitle: Text('asjhdkashdk'),
//                      background: Container(width: 100, height: 50, color: Colors.white,),
//                    title: Container(width: 100, height: 50, color: Colors.white,),
////                    centerTitle: Container(width: 100, height: 50, color: Colors.white,),
//                  ),
                  primary: false,
                  //titleSpacing: 20,
                  bottom: PreferredSize(
                    preferredSize: Size(double.infinity, 80),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left : 8.0, right: 8.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),

                              ),
                          //color: Colors.blue,
                          child: TabBar(

                          labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
                            labelColor: const Color(0xFF1c98ff),
                            unselectedLabelColor: const Color(0xFF8c9bad),
                            indicatorColor: const Color(0xFF1c98ff),
                            controller: _tab_controller,
                            isScrollable: true,

                            tabs: data.map((t) => Tab(


                                text: t)).toList()
                        ))
                      ],
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(

                controller: _tab_controller, children: buidComp())),
          );
  }


  List<Widget> buidComp() {
    return [
      Feature(),
      MoviePage(),
      TvShowPage(),
    ];
  }
}

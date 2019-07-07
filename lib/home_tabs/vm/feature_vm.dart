//import 'package:ticketak/app_models.dart';
import 'package:http/http.dart' as http;
import 'package:movexp/utils/aaap_models.dart';
import 'dart:convert';

import 'package:movexp/utils/connection_helper.dart';
import 'package:movexp/utils/constants.dart';


class FeatureVM{


  ConnectionHelper mCH;
//  SharedPreferenceHelper mSP;
//  AAAppSingleton aap;

  FeatureVM(){
    mCH = ConnectionHelper.getInstance();
//    mSP = SharedPreferenceHelper.getInstance();
//    aap = AAAppSingleton();
  }


  //@route    /GetAllShow/
  //@desc     get all the shows data
  //@access   public

  Future<FeatureRes> fetchShowAllImpl() async {

    FeatureRes res_d;
    bool con = await mCH.checkConnection();
    if(con){
      try {



        const URL = '${BASE_URL}d_movies_d/';
        //const URL = 'https://some-app-fo.herokuapp.com/homeTTAPI';
        //const URL = 'https://some-app-fo.herokuapp.com/home';

        print('URL ---> $URL');


        //final res = await http.get(URL);


        final res = await http.get(URL);

        switch (res.statusCode) {
          case 200:
            final j_data = json.decode(res.body);
            print('Res ---> ${res.body}');
            res_d = FeatureRes.fromJson(j_data);


            // delay for 700 milliseconds
            await Future.delayed(const Duration(milliseconds: 500), () {});


            return res_d;
          default:
            return FeatureRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // self created
        return FeatureRes.buildErr(0, message: err.toString());
      }

    }else {
      // self created
      return FeatureRes.buildErr(1);
    }

  }




}
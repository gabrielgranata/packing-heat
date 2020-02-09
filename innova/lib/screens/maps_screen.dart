import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

final apiKey = 'AIzaSyCCa30P9-jhu-MNAF8GlZ1hP5nSF1Lz_jo';

class MapsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapSample(startingLat: 33.8160679, startingLng: -117.9225314,
      legs:[
        {
          'distance': {
            'text': "10 ft",
            'value': 3
          },
          'duration': {
            'text': "1 min",
            'value': 0
          },
          'end_location': {
            'lat': 33.8160679,
            'lng': -117.9225314
          },
          'html_instructions': "Head <b>southwest</b>",
          'polyline': {
            'points': "qukmEvvvnUB@"
          },
          'start_location': {
            'lat': 33.8160897,
            'lng': -117.9225226
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "397 ft",
            'value': 121
          },
          'duration': {
            'text': "1 min",
            'value': 11
          },
          'end_location': {
            'lat': 33.8155824,
            'lng': -117.9235917
          },
          'html_instructions': "Keep <b>right</b>",
          'maneuver': "keep-right",
          'polyline': {
            'points': "mukmExvvnUZPLJLLBBFJFLHPBPBL@N?L?J@l@"
          },
          'start_location': {
            'lat': 33.8160679,
            'lng': -117.9225314
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "417 ft",
            'value': 127
          },
          'duration': {
            'text': "1 min",
            'value': 58
          },
          'end_location': {
            'lat': 33.816278,
            'lng': -117.9242395
          },
          'html_instructions': "Slight <b>right</b> toward <b>Southwest Pl</b>/<wbr/><b>West Pl</b><div style=\"font-size:0.9em\">Restricted usage road</div>",
          'maneuver': "turn-slight-right",
          'polyline': {
            'points': "krkmEl}vnUKTAFAF?D?x@?F?DABABCBC?C@E?eB?"
          },
          'start_location': {
            'lat': 33.8155824,
            'lng': -117.9235917
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "0.1 mi",
            'value': 164
          },
          'duration': {
            'text': "1 min",
            'value': 72
          },
          'end_location': {
            'lat': 33.817613,
            'lng': -117.924097
          },
          'html_instructions': "Turn <b>right</b> onto <b>Southwest Pl</b>/<wbr/><b>West Pl</b><div style=\"font-size:0.9em\">Partial restricted usage road</div>",
          'maneuver': "turn-right",
          'polyline': {
            'points': "wvkmEnawnUEe@O?[BI?C?MEY?c@@E?G?EBKDk@?Q?_@?"
          },
          'start_location': {
            'lat': 33.816278,
            'lng': -117.9242395
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "243 ft",
            'value': 74
          },
          'duration': {
            'text': "1 min",
            'value': 27
          },
          'end_location': {
            'lat': 33.8179964,
            'lng': -117.9235637
          },
          'html_instructions': "Turn <b>right</b> toward <b>W Ball Rd</b>",
          'maneuver': "turn-right",
          'polyline': {
            'points': "a_lmEr`wnU?S?O?O?AA?AA?AMKGGCCKGMGECCACAGA"
          },
          'start_location': {
            'lat': 33.817613,
            'lng': -117.924097
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "374 ft",
            'value': 114
          },
          'duration': {
            'text': "1 min",
            'value': 50
          },
          'end_location': {
            'lat': 33.8179846,
            'lng': -117.9223305
          },
          'html_instructions': "Turn <b>right</b> onto <b>W Ball Rd</b><div style=\"font-size:0.9em\">Pass by Staybridge Suites Anaheim at the Park (on the right)</div>",
          'maneuver': "turn-right",
          'polyline': {
            'points': "oalmEf}vnU?k@@iA@_C"
          },
          'start_location': {
            'lat': 33.8179964,
            'lng': -117.9235637
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "0.2 mi",
            'value': 352
          },
          'duration': {
            'text': "1 min",
            'value': 71
          },
          'end_location': {
            'lat': 33.8207878,
            'lng': -117.9230963
          },
          'html_instructions': "Turn <b>left</b> onto <b>Disneyland Dr</b>",
          'maneuver': "turn-left",
          'polyline': {
            'points': "kalmEpuvnUAs@_@Bk@HA?UFKBa@JuCp@{@T_@LYLKJUJc@LEBeAX"
          },
          'start_location': {
            'lat': 33.8179846,
            'lng': -117.9223305
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "22.3 mi",
            'value': 35884
          },
          'duration': {
            'text': "27 mins",
            'value': 1641
          },
          'end_location': {
            'lat': 34.0256221,
            'lng': -118.2059515
          },
          'html_instructions': "Slight <b>right</b> to merge onto <b>I-5 N</b> toward <b>Los Angeles</b>",
          'maneuver': "ramp-right",
          'polyline': {
            'points': "}rlmEjzvnUi@MICEASIcA]{@[C?SGSGMEMEC?KCSAEAMAO?E?]@C?E@E?MBE@I@IBKBA@UJE@EBIDGDKF}ArAs@l@y@r@y@r@}@v@WTs@l@qAjA_@\]p@}ApAg@b@iAdA}BbCSTYXw@z@[ZyB`CsAxAOP[^cBlBw@x@qBtB}@~@_AbA{@|@s@x@KLEBEDSPGF_BhCa@r@Wh@Wf@Sf@c@jAOb@K^ITW`AMd@_@xAWnAU`Bm@jEi@`Eu@hFOv@GXWlAMh@e@|AM`@M^KX{@vBuAzCSd@aGrMwDvISd@aEjJgB|DoApCyCzGuBxEy@lBu@~AWl@Q^Uf@_@t@a@r@a@r@A@Yd@y@zA}@|AQZYd@[h@U`@QZ[l@c@|@_@v@{@rBUn@s@hB_BjE_BtDSd@aCbGSb@k@zAu@hB[t@aChGQf@{CjHyAjDiAhCoAxCmDhIkApCkAdCEFoA|B_@j@Yf@gA~Aa@l@g@p@W^a@j@GHgAtAu@dAcDnEaB|Be@z@?@A@IPKRA@?@GJSd@_@~@Qh@Qh@WdAADAFGZYrA[xAId@GREVSbAU~@k@vB[lACF_AzE?@YlAMl@ADWbAOn@}@hCQh@k@~AcB~DYp@Wh@qAjCc@x@QZgBzC_BpC[f@c@t@U^KPqB`ESb@ABQ^g@fASb@Sf@c@`AoAtCe@fAaBtDg@hAy@jBsAbD}@nBOZKV]v@oArCSb@Q`@?@Sb@aBpDi@hAy@lBKVsAnCABGHGNINEJCJGJGRc@`A[t@c@`AoAlCmBjEMZ]t@_@z@w@bBe@|@c@r@OTOTA@SZCBc@r@a@h@g@n@e@j@Y^QRi@l@_@b@MPA?_@f@GFw@`AiBjCe@r@S^a@t@Ub@g@fACD_@x@CDMXm@tAqAxCiBbEg@lAcAzBYl@Wn@GJIRaBxDsBvEa@~@CFSb@g@hAGLITmApCg@fAMZ_ArB{@lBSb@Yp@}@rBcAzBGN_@x@Qb@w@fBkBdEqA|CiAtB_BxCaAfBuAhCS`@s@xAO\_@z@w@rBa@fAIVq@xAcA|BGLgBfDYh@GJGLMVGNsA`Dc@bASj@y@rBa@~@aA|B[x@e@hA]z@a@bAsAhD?@uCbHSd@O`@g@jAABm@vAsA`DmB`FIPwC~GiF|Ky@`BGJmBvD{AzCqDjHiBnDkCpFiEbJ{@hBmCzFkAhCcArCi@jAQd@g@fAGLKTcBtDaAhBmAzBa@t@a@t@mAlBmAlBaB~BW\qAdBi@p@m@r@EDgBnBaChCmChCEBwBpBeBfBeAdAKLmBlBgBbBsAnAeAdAQVi@n@kA~A{@dA_@h@e@z@Yf@[l@IN[n@MVeA~Bw@|AIPm@vAq@|A[r@Sb@Yn@MVu@pAq@hAg@p@gBnCcBzB_ApA{D`EkAbAeAx@QJYVYVgDzBw@f@w@d@{CnBmAx@IDwA~@OJQJEBQJCB]NqD|BiBhAyClB}@l@WN}H|E_@T{A~@}BtA]T{D`C}@h@}BrAwA|@{BvAg@Xg@Ze@XcBlAwCpB{@l@kD`CgA|@_@ReCxAoG`EcAn@SLm@^wAz@a@Ve@ZiEdCq@`@_@R?@wBlAGBoBjA}BrAKFGDu@b@k@Xi@XWNcB`Aa@VoDvBwCbBcAn@}@h@yBlA_@Re@V[RMF_@Ru@b@GDm@\yAz@SJc@VeAn@q@`@}A|@sBjA}@h@]TcDjBkAp@cAl@ID}@h@wCdB_@T_@T_Ap@y@n@g@b@i@f@_@^a@`@UXm@r@_@b@a@j@QVwAvBk@|@A@W^cA~AeA`B{BhDeA~A_@l@iAfB}@rAuCnEo@`Ao@bAMPSZCBuAvByBhDgA`BW^_AxAiIhMW^uBbDW^gAdBSXSZg@n@MPEDe@j@_@^[\kAdAe@\UNOLs@d@CB}@j@sAr@e@TC@MD[Lq@Vs@R_B`@iE|@WFqDr@sAZs@NWDcB^ODc@HcB\C@]HaAP}A\c@Jg@JgAZi@Nu@XiAd@gAh@eAl@MHKFe@TGDSL{@h@i@^s@j@cAr@}B~A[PeAr@SNyB|A_@\cAz@qAnAoApA_A|@{A|AYX_A~@}@|@eAbAs@t@uBtBoBpBmAlA{AzAm@j@YZ]\kAhAeAhAg@f@KLOPs@|@a@n@QXq@fA{@vAy@tA]l@[b@w@pA[b@a@d@CBYZ[\w@v@YT?@CBKJA?ON]\s@r@wAxAmAlA}@x@y@v@A@wErEmJzIiJ|IONoBjB_@Zc@^EB]Zo@n@q@l@MNc@\o@d@m@`@y@d@IDULk@Zq@Xq@Zq@^ID_@TC@k@\cAt@}@t@CBoBjByCpCkB`B}AzA_CvB}AvAu@r@cA`AoAtAgEhFgBvBY\aCtCwAbBa@r@[d@i@|@S`@Ud@g@bAYj@o@fASZQVcAnAeAnAi@h@UTs@l@uBhBw@r@_@\MJYVg@f@g@j@e@p@MPMTW^k@dAy@lBeAxCQ`@GPYx@Qd@KZCH}@jCy@|BQd@iCpHeAzCcA|CYfAW~A}@nECRk@~B]`AYp@KVg@dAq@pAOXIPA@A@Ud@MXABEJGNCFAB[t@ADADi@~ASl@EPITWt@cAbDaAnCkCrHa@hAA@GNq@lBe@vAYbAK`@ABU~@CLMt@m@vDOrAEh@Eh@GjAGfBAtBAL@|J@xM@lB?nE?rEAbD?@Ct@EhAA`@C`@It@MrAE^Ih@Mz@QfAKh@Mf@Qt@Of@W|@Sp@wBpGiAfD{@jCQf@Od@q@pBOf@eBdFAFaB|EaBfF}AvEm@xAK`@[lAWfAELGZK^"
          },
          'start_location': {
            'lat': 33.8207878,
            'lng': -117.9230963
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "11.7 mi",
            'value': 18811
          },
          'duration': {
            'text': "17 mins",
            'value': 1037
          },
          'end_location': {
            'lat': 34.1294658,
            'lng': -118.3475583
          },
          'html_instructions': "Keep <b>left</b> at the fork to continue on <b>US-101 N</b>, follow signs for <b>Los Angeles N</b>/<wbr/><b>Civic Center</b>",
          'maneuver': "fork-left",
          'polyline': {
            'points': "cstnEdbnpU@d@?@?@?@CJELg@xBW`AMf@Od@Ut@cArCmAnDKXKVsA~D_C|GwAhEGPKXa@hA[~@aApCe@vAi@zACDWn@a@hAUn@w@hBOZS`@[p@INCFGJOVOX]j@]h@MTg@r@W\UZe@j@KLGDABC@C@SHiAhAA?EDw@x@[Zs@h@m@`@]TKDQLQF[NEBSJE@KDMDiAXC@]JWDg@FOB]Dy@DU?_@@u@As@EoBWy@Gu@Ek@?MAQ?_@@[BmAFy@Fa@@U@a@?W?a@Aa@CC?]C]Cm@KWCKCmASyC]}CU]Ak@Ae@?wA@iB@oC@k@?}AFi@@aAHS@k@Di@Hm@Fm@JyAXi@L_Bb@C@_A\c@PsAh@UHeAh@_@L]Nc@Pc@Pe@R}@\{An@WNUNA?ML_@XMNIJQRQVGJABIJQ^[z@A??BEJOd@CLAHCJAHCP?HCNAPARAb@Er@?HAF?DAJ?DADG^AJC^AFATCJ?DAJOnAU~BKhAEZC`@CNMrAKpAQzBMtAOzBCRGbAAJK|ACRAT?TCv@ARCVEZIdAGbA?BCZEbACj@CdAAz@Bv@@J@PDbA@d@@P?R?N?PALALARCPCPERCNGZG\I^GPCJUl@Wn@CHCDIPOZOVa@v@_@n@MVS\QZGLYh@e@z@GJGJIPKPGJmA|Bk@fA_@p@k@dAS`@o@jA]n@QZ]n@_@p@KNs@lAMRKP]h@w@pAk@v@W\CBSZEBSXkAzAST_@`@i@h@g@d@g@b@URUPUPo@h@gA|@gA|@k@d@eBvAEBi@b@ED]XEBUPWTED_@ZYVSRQNY\QTY^UZW^g@x@]h@GHq@dASXW`@[`@S\e@p@w@lAINe@p@U`@m@|@A@cA~Aa@p@OXg@`AMXYl@Q`@O\Wr@O^GPGR[~@ELMd@?@K\_@tA?B[nAi@tB[nAiAnE_@xAWdAQp@e@lBCD[nAK`@ADe@jBMf@Mf@Mf@YhAQj@Oh@q@vBi@|Ai@zAc@nAa@nAADc@jA]fAABQd@a@jACL[~@M\c@tA]hAa@pAABCHCJIViApDc@jAGPIRu@jBg@lAc@fAM^K\Od@m@nBa@|AYdAKb@Mj@ETu@vDa@zB]~Au@~Dq@rDS|@Y|ACHAJMn@I`@I`@If@YjB]`CO`A?@Kr@?DCP_@nCm@~DQpAAJQdACTETc@fDMjAShBKlACPGh@Ij@Ij@Mx@[hBId@Ot@c@hBKf@Wz@c@lAKZUj@CDk@pAYr@CDg@dAMZEJ_AvBeAhCO^}@dC}@`Cm@dBQd@Up@wB~FSh@g@rAEHSb@_@x@?Ba@t@KRSb@Wd@CD]n@c@x@o@bAe@t@c@t@_@l@ILILABMTKPMPqBfD{AbCu@hAOVmAjBQTILg@l@g@n@i@f@k@j@k@d@e@^m@b@_@V_@VC@ABSPQHUL{Av@iExB_@R}@d@[NCBq@\k@XUN[P]To@d@URc@`@g@h@WVe@l@QTOVMR_@l@i@`AGJAB[l@q@lA_AdB_@r@}@`Bc@v@_A|As@hAKNMPg@n@c@h@QPEF_@`@_@^KHYXYTq@j@YPaAt@eAj@IFq@\kB|@oHrDwAr@a@Pe@Re@Vs@\s@b@[R_@X[VSRSR[Zc@h@UXQTU^i@~@i@hA_@~@Y`Ak@|BG\Mv@E`@E\Gx@A@Cl@C|@A^?h@?^?TA^Av@?F?Z?~@Cn@?@A`@Cb@G|@ALCRE\G\CRABEVEPAHK`@K`@Oj@i@xAQ^Wj@Wh@]l@u@vAu@vAOZEFU`@]p@Uf@s@vAqDnHu@zAkAzBm@lAQXkA`Cg@|@[n@[j@KL[f@W\EFY^[^c@b@GFCD]XMJ_@\SP]XKF]Tg@TMHMDMFUHMBIBE@k@NC@[FSFYFIB_@H]HgBb@yD|@m@T?@oDr@iB^sATw@NQBKBiANaB^gAVc@Pa@Nw@Xk@VaAb@]Na@ToAt@qBlAqAfA_Av@kAjAgBlBYXCFEDEFCB?@KLGFKJq@x@a@h@i@n@QXSVSVcAlAY^Y\[^UXWZc@f@g@f@ONg@b@KHMJk@^A@}@j@eB`AWL[RYRWPQNQLa@\ONQPi@h@iBjBEFMJWVMNYVUV_@^uAvAo@p@"
          },
          'start_location': {
            'lat': 34.0256221,
            'lng': -118.2059515
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "0.1 mi",
            'value': 180
          },
          'duration': {
            'text': "1 min",
            'value': 11
          },
          'end_location': {
            'lat': 34.1307998,
            'lng': -118.3485738
          },
          'html_instructions': "Take exit <b>11B</b> toward <b>Universal Studios Blvd</b>",
          'maneuver': "ramp-right",
          'polyline': {
            'points': "e|hoEfwiqUAACAA?A?C?E?A@C@MHURYXA?IHa@^WV[VKJEDGFIFIFKHCBA?A?A@A?A?C?CA"
          },
          'start_location': {
            'lat': 34.1294658,
            'lng': -118.3475583
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "0.3 mi",
            'value': 447
          },
          'duration': {
            'text': "1 min",
            'value': 32
          },
          'end_location': {
            'lat': 34.1338819,
            'lng': -118.3515888
          },
          'html_instructions': "Merge onto <b>W.C. Fields Dr</b>",
          'maneuver': "merge",
          'polyline': {
            'points': "odioEp}iqUMLSLYNEBYNe@Xk@`@]V]VSJMH]TEBKJIHMLKLSVU\S\CDQZGLKNGLGFCFEDCBCBCBC@EDEBEBC@EDCBEBEBCB?@CBC@CBEFCBCDEDEFINUd@"
          },
          'start_location': {
            'lat': 34.1307998,
            'lng': -118.3485738
          },
          'travel_mode': "DRIVING"
        },
        {
          'distance': {
            'text': "0.1 mi",
            'value': 234
          },
          'duration': {
            'text': "1 min",
            'value': 29
          },
          'end_location': {
            'lat': 34.1358593,
            'lng': -118.3511633
          },
          'html_instructions': "Turn <b>right</b> onto <b>Universal Studios Blvd</b><div style=\"font-size:0.9em\">Destination will be on the right</div>",
          'maneuver': "turn-right",
          'polyline': {
            'points': "wwioElpjqUQNA@A@A?A@C?C?A?A?A?C?CAA?CAAAA??AA?CAEAC?A?A?A?A?A?A?OQCAAAECUMGCGCECGCGCICICICGAECKACAGAIAGAGAG?IAQAWAIAI?K?I@O@IA"
          },
          'start_location': {
            'lat': 34.1338819,
            'lng': -118.3515888
          },
          'travel_mode': "DRIVING"
        }
      ],
      ),
    );
  }
}

class MapSample extends StatefulWidget {

  MapSample({this.startingLat, this.startingLng, this.legs});
  final double startingLat;
  final double startingLng;
  final List legs;

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  final bool isProduction = false;
  List<Marker> markers = [];
  List<MarkerInfo> currentMarkerInfo = [];

  List steps = [];

  int currentMarker = 1;

  double startingLat;
  double startingLng;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    startingLat = this.widget.startingLat;
    startingLng = this.widget.startingLng;
    steps = this.widget.legs;
  }

  @override
  Widget build(BuildContext context) {

    for (int i = 1; i < steps.length; i++) {
      var marker = MarkerInfo(lat: steps[i]['end_location']['lat'], lng: steps[i]['end_location']['lng']);
      addMarker(marker);
      print(marker.lat);
      print(marker.lng);
    }

    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(startingLat, startingLng),
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.toSet()),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (nextMarkerExists()) {
            nextMarker();
            await changeLocation(getCurrentMarker().lat, getCurrentMarker().lng);
          } else {
            // DONE
          }
        },
        label: Text('Next'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  getLegs() async {

    var jsonBody;
    try {
      var response = await http.get('https://maps.googleapis.com/maps/api/directions/'
          'json?origin=Disneyland&destination=Universal%20Studios%20Hollywood&key=$apiKey&optimize=true');
      jsonBody = jsonDecode(response.body);
    } catch (e) {
    }
    setState(() {
      steps = jsonBody['routes'][0]['legs']['steps'];
    });
  }

  void addMarker(MarkerInfo markerInfoObject) {
    // generate marker ID
    final MarkerId markerId = MarkerId('markerId');

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
          markerInfoObject.lat,
          markerInfoObject.lng
      ),
      infoWindow: InfoWindow(title: 'markerId', snippet: '*'),

    );
    setState(() {
      var currentLength = markers.length;
      markers.add(marker);
      currentMarkerInfo.add(markerInfoObject);
    });
  }

  Future<Map<String, double>> getLatLong(String address) async {
    var lat;
    var lng;

    try{
      var response = await http.get(isProduction ? 'http://uottahack2020.herokuapp.com/latlong?q=$address' : "http://10.0.2.2:3000/latlong?q=$address");

      var jsonBody = jsonDecode(response.body);

      lat = jsonBody["lat"];
      lng = jsonBody["lng"];

    } catch (e) {
      print(e);
    }

    return {'lat': lat, 'lng': lng};
}


  void nextMarker() {
    setState(() {
      currentMarker++;
    });
  }

  bool nextMarkerExists() {
    return currentMarker < steps.length - 1;
  }

  MarkerInfo getCurrentMarker() {
    return currentMarkerInfo[currentMarker];
  }

  Future<void> changeLocation(lat, lng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lat, lng),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414),
    ));
  }

}
class MarkerInfo {

  MarkerInfo({this.lat, this.lng});

  final lng;
  final lat;
}

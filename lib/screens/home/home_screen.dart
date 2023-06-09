import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zabardash/screens/login/login_screen.dart';

import '../../core/utils/preference_keys.dart';
import 'home_widgets/export_widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit? _homeCubit;
  var emailaddress = "";

  Future _getLocationPermission() async {
    if (await Permission.locationWhenInUse.request().isGranted) {
      setState(() {
        PermissionStatus.granted;
      });
    } else if (await Permission.locationWhenInUse
        .request()
        .isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.locationWhenInUse.request().isDenied) {
      setState(() {
        PermissionStatus.denied;
      });
    }
  }

  Future getUserData() async {
    final SharedPreferences prefe = await SharedPreferences.getInstance();
    emailaddress = prefe.getString(PreferenceKeys.EMAIL)!;
  }

  Position? currentLocation;

  Future getlocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();
    getUserData();
    _homeCubit = HomeCubit()..homeData();
    _getLocationPermission().whenComplete(() {
      getlocation().then((value) {
        setState(() {
          currentLocation = value;
        });
        print("call" + currentLocation.toString());
      });
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Cre

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      key: _key,
      drawer: MakeDrawer(context),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          topWidget(),
          searchFieldWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FavoriteStoreWidget(
                    homeCubit: _homeCubit,
                  ),
                  FeaturedPageWidget(
                    homeCubit: _homeCubit,
                  ),
                  FeaturedProductWidget(homeCubit: _homeCubit),
                  FeaturedStoreWidget(),
                  BlocConsumer<HomeCubit, HomeState>(
                    bloc: _homeCubit,
                    listener: (context, state) {
                      if (state is Error) {
                        return ShowErrorAlert.showAdaptiveDialog(context,
                            message: state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is Loading) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 16.flexibleWidth,
                              right: 28.flexibleWidth,
                              top: 24.flexibleHeight),
                          child: ShimmerEffect(
                            height: 139.flexibleHeight,
                            width: 382.flexibleWidth,
                          ),
                        );
                      }
                      if (state is Loaded) {
                        return Column(
                          children: [
                            storeTitleWidget(),
                            StoresWidget(
                              readStoresData: state.homeDataModel!.storeData,
                            ),
                          ],
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Drawer MakeDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            width: 300.0,
            height: 500.0,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //   image: NetworkImage(
            //       "https://media.istockphoto.com/vectors/dark-abstract-background-vector-illustration-vector-id929619614?b=1&k=6&m=929619614&s=612x612&w=0&h=bzXWUYZ7R9wMSTmWANhfhh2ct3RAnOBVKMhqLDE1KiY="),
            //   // fit: BoxFit.cover
            // )),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon((Icons.supervised_user_circle_rounded)),
                  color: UIColors.primaryColor,
                  iconSize: 60,
                  onPressed: () {},
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   ("User"),
                    //   style: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
                    // ),
                    Text(
                      emailaddress,
                      style: TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
                    )
                  ],
                )
              ],
            )),
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                child: (Row(
                  children: <Widget>[
                    // ...
                    Expanded(
                      child: Column(
                        children: <Widget>[Divider(color: Colors.black)],
                      ),
                    )
                  ],
                )),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context)=>Home()));
                },
                child: ListTile(
                    leading: IconButton(
                      icon: Icon((Icons.home)),
                      color: UIColors.primaryColor,
                      iconSize: 30,
                      onPressed: () {},
                    ),
                    title: Text("Home")),
              ),
              ListTile(
                  leading: IconButton(
                    icon: Icon((Icons.contact_page)),
                    color: UIColors.primaryColor,
                    iconSize: 30,
                    onPressed: () {},
                  ),
                  title: Text("Terms & Conditions")),
              ListTile(
                  leading: IconButton(
                    icon: Icon((Icons.app_blocking_rounded)),
                    color: UIColors.primaryColor,
                    iconSize: 30,
                    onPressed: () {},
                  ),
                  title: Text("About")),
              ListTile(
                  leading: IconButton(
                    icon: Icon((Icons.settings_sharp)),
                    color: UIColors.primaryColor,
                    iconSize: 30,
                    onPressed: () {},
                  ),
                  title: Text("Setting")),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: ListTile(
                    leading: IconButton(
                      icon: Icon((Icons.login_outlined)),
                      color: UIColors.primaryColor,
                      iconSize: 30,
                      onPressed: () {},
                    ),
                    title: Text("Log Out")),
              ),
            ],
          ),
          // GestureDetector(onTap: (){},child:ListTile(title:Text("hello"))),  //GestureDetector used for Drawer move one page to other
        ],
      ),
    );
  }

  Widget topWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 17.flexibleWidth, top: 40.flexibleHeight),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Image(
              image: AssetImage('assets/images/drawer.png'),
              height: 14.34.flexibleHeight,
              width: 19.9.flexibleWidth,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Deliver to ',
                    style: StyleText.regularShadowGray14,
                    children: [
                      TextSpan(
                          text: 'Home',
                          style: StyleText.regularGreen14.copyWith(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: UIColors.darkGray,
                  size: 20.flexibleHeight,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget searchFieldWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: 24.flexibleWidth,
          top: 8.7.flexibleHeight,
          right: 20.flexibleWidth,
          bottom: 10.flexibleHeight),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 45.flexibleHeight,
                width: 308.flexibleWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                        bottomLeft: Radius.circular(6)),
                    boxShadow: [
                      BoxShadow(
                          color: UIColors.shadowGrey,
                          blurRadius: 16,
                          spreadRadius: -10,
                          offset: Offset(0, 2)
                          // spreadRadius:1,
                          ),
                    ]),
              ),
              SizedBox(
                height: 45.flexibleHeight,
                width: 308.flexibleWidth,
                child: TextFormFieldWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid search!';
                    }
                    return null;
                  },
                  textStyle: StyleText.mediumDarkGreySpacing14,
                  textInputAction: TextInputAction.next,
                  hintText: 'Search for stores, products & deals',
                  hintStyle: StyleText.regularLightGray14,
                  fillColor: UIColors.white,
                  trbr: 6,
                  tlbr: 6,
                  blbr: 6,
                  trfbr: 6,
                  tlfbr: 6,
                  blfbr: 6,
                  hcontentPadding: 19.flexibleWidth,
                  vcontentPadding: 17.flexibleHeight,
                  prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 17.1.flexibleWidth, right: 16.9.flexibleWidth),
                      child: Icon(
                        Icons.search,
                        color: UIColors.primaryColor,
                        size: 24.flexibleHeight,
                      )),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 14.flexibleWidth),
            padding: EdgeInsets.symmetric(horizontal: 12.flexibleWidth),
            width: 48.flexibleWidth,
            height: 45.flexibleHeight,
            decoration: BoxDecoration(
                color: UIColors.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6))),
            child: Image(image: AssetImage('assets/images/filters.png')),
          )
        ],
      ),
    );
  }

  Widget storeTitleWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: 16.flexibleWidth,
          right: 28.flexibleWidth,
          top: 24.flexibleHeight),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'All Stores',
              style: StyleText.regularDarkGray14,
            ),
            SizedBox(
              width: 42.flexibleWidth,
              child: Divider(
                height: 9,
                color: UIColors.primaryColor,
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

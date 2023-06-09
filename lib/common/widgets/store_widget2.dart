import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zabardash/common/widgets/shimmerEffect.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/models/home_data_model/home_data_model.dart';
import 'package:zabardash/screens/home/home_bloc/home_cubit.dart';

import '../../screens/store/store_screen.dart';

class StoresWidget2 extends StatefulWidget {
  final List<StoreDataModel>? readStoresData;
  var id;
   StoresWidget2({Key? key, this.readStoresData,this.id}) : super(key: key);

  @override
  State<StoresWidget2> createState() => _StoresWidgetState(id);
}

class _StoresWidgetState extends State<StoresWidget2> {
  var id;
  _StoresWidgetState(this.id);
  void initState(){
    super.initState();
    print("id :"+id.toString());
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13.flexibleHeight),
      padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
      // height: 175.flexibleHeight,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 13.flexibleHeight),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // print(widget.readStoresData![0].toJson());
            return

            id==widget.readStoresData?[index].id ?

             GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(StoreScreen.routeName,
                    arguments: widget.readStoresData![index]);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "${widget.readStoresData?[index].storePicturePath}",
                      height: 139.flexibleHeight,
                      width: 382.flexibleWidth,
                      placeholder: (context, url) => ShimmerEffect(
                        height: 139.flexibleHeight,
                        width: 382.flexibleWidth,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 8.flexibleWidth,
                        right: 8.flexibleWidth,
                        bottom: 25.flexibleHeight,
                        top: 8.flexibleHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.readStoresData![index].title!,
                              style: StyleText.boldDarkGray14,
                            ),
                            Spacer(
                              flex: 2,
                            ),
                            Text(
                              '${widget.readStoresData![index].rating}',
                              style: StyleText.regularDarkGray13,
                            ),
                            Icon(
                              Icons.star,
                              color: UIColors.yellow,
                              size: 18.flexibleHeight,
                            ),
                          ],
                        ),
                        Text(
                          "${widget.readStoresData![index].address}",
                          style: StyleText.regular1LightGray13,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ):Container();
          },
          itemCount:widget.readStoresData!.length,
        ),
      ),
    );
  }
}

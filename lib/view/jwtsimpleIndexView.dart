import 'package:flutter/material.dart';
import 'package:hostelpedia/model/hostelViaIdModel.dart';
import 'package:hostelpedia/viewModel/hostelViaIdVM.dart';
import 'package:provider/provider.dart';

class CircleAvatarWedgite extends StatefulWidget {
  const CircleAvatarWedgite({
    super.key,
    required this.cityNames,
    required this.imageList,
  });

  final List<String> cityNames;
  final List<String> imageList;

  @override
  State<CircleAvatarWedgite> createState() => _CircleAvatarWedgiteState();
}

class _CircleAvatarWedgiteState extends State<CircleAvatarWedgite> {
  @override
  void initState() {
    super.initState();
    Provider.of<HostelViaIdProvider>(context, listen: false).getHostelViaIdVM();
  }

  @override
  Widget build(BuildContext context) {
    // final hostvia =
    //     Provider.of<HostelViaIdProvider>(context).getHostelViaIdVM();
    return Consumer<HostelViaIdProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: value.hostelViaIdVM.data!.data!.length,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              NetworkImage(widget.imageList[index]),
                          // onBackgroundImageError: (exception, stackTrace) {
                          //   // Fallback image in case the image fails to load
                          //   Image.asset('assets/images/fallback.png');
                          // },
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        value.hostelViaIdVM.data!.data![index].cityName
                            .toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 26, 21, 21),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );
                },
              );
      },
    );
  }
}

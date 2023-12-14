import 'package:chargemod_assign/app/profile/model/profiletile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettingList extends StatelessWidget {
  const ProfileSettingList({
    super.key,
    required this.list,
  });

  final List<ProfileTileModel> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 232, 232, 232),
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 3,
          )
        ],
      ),
      child: ListView.separated(
        itemCount: list.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Row(
          children: [
            CircleAvatar(
                radius: 19.h,
                backgroundColor: const Color(0xffEBEBEB),
                child: SvgPicture.asset(list[index].icon)),
            SizedBox(width: 12.w),
            Text(
              list[index].title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: const Divider(),
        ),
      ),
    );
  }
}

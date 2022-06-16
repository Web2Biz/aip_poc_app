import 'package:aip_poc/config/app_color_constants.dart';
import 'package:aip_poc/config/app_font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _isSelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColorConstants.primaryColor,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 12.0,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Drawer Header
              _buildDrawerHeader(),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 16.0,
              ),
              // ListTile Items
              // Care Team
              _buildCareTeamListItem(),
              // Care Team Child List Items
              // is selected or not checking
              _isSelected
                  ? _buildCareTeamChildListItems()
                  : const SizedBox(
                      height: 8.0,
                    ),
              // Devices
              _buildDeviceListItem(),
              const SizedBox(
                height: 8.0,
              ),
              // Thresold
              _buildThresoldListItem(),
              const SizedBox(
                height: 8.0,
              ),
              // Orders
              _buildOrderListItem(),
            ],
          ),
        ),
      ),
    );
  }

  // Order List Item
  Widget _buildOrderListItem() {
    return Card(
      color: AppColorConstants.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      elevation: 0.0,
      child: ListTile(
        dense: true,
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/svg-icons/orders.svg"),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              "Orders",
              style: TextStyle(
                color: Colors.white,
                fontFamily: AppFontConstants.nunitaSans,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Thresold List Item
  Widget _buildThresoldListItem() {
    return Card(
      color: AppColorConstants.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      elevation: 0.0,
      child: ListTile(
        dense: true,
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/svg-icons/user-avatar.svg"),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              "Thresold",
              style: TextStyle(
                color: Colors.white,
                fontFamily: AppFontConstants.nunitaSans,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Device List Item
  Widget _buildDeviceListItem() {
    return Card(
      color: AppColorConstants.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      elevation: 0.0,
      child: ListTile(
        dense: true,
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/svg-icons/device.svg"),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              "Devices",
              style: TextStyle(
                color: Colors.white,
                fontFamily: AppFontConstants.nunitaSans,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            )
          ],
        ),
        // trailing: SvgPicture.asset("assets/svg-icons/down-arrow.svg"),
      ),
    );
  }

  // Care Team Lsit Item
  Widget _buildCareTeamListItem() {
    return Card(
      color: AppColorConstants.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      elevation: 0.0,
      child: ListTile(
        dense: true,
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/svg-icons/user-avatar.svg"),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              "Care Team",
              style: TextStyle(
                color: Colors.white,
                fontFamily: AppFontConstants.nunitaSans,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            )
          ],
        ),
        trailing: SvgPicture.asset(_isSelected
            ? "assets/svg-icons/up-arrow.svg"
            : "assets/svg-icons/down-arrow.svg"),
      ),
    );
  }

  // Drawer Header
  Widget _buildDrawerHeader() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 48.0,
          right: 24.0,
          bottom: 12.0,
          left: 24.0,
        ),
        child: Column(
          children: [
            // Avatar and notification icon row
            Row(
              children: [
                // avatar icon
                SvgPicture.asset("assets/svg-icons/avatar.svg"),
                const SizedBox(
                  width: 20.0,
                ),
                // Name
                Expanded(
                  child: Text(
                    "Admin",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFontConstants.nunitaSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                // notification icon
                Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1081DD),
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child:
                          SvgPicture.asset("assets/svg-icons/notification.svg"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 36.0,
            ),
            // mail box and messages row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Mail box
                SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg-icons/mail-box.svg"),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Mailbox",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFontConstants.nunitaSans,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      SvgPicture.asset("assets/svg-icons/right-arrow.svg"),
                    ],
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                      height: 24, child: VerticalDivider(color: Colors.white)),
                ),
                // Messages
                SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg-icons/mail-box.svg"),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Mailbox",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFontConstants.nunitaSans,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      SvgPicture.asset("assets/svg-icons/right-arrow.svg"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Care Team Child List Of Items
  Widget _buildCareTeamChildListItems() {
    return Container(
      padding: const EdgeInsets.only(
        top: 0.0,
        right: 8.0,
        bottom: 4.0,
        left: 40.0,
      ),
      child: Column(
        children: [
          // Patient Info
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/svg-icons/auth-avatar.svg",
                    width: 16.0,
                    height: 16.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "Patient Information",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFontConstants.nunitaSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Provider
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/svg-icons/auth-avatar.svg",
                    width: 16.0,
                    height: 16.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "Provider",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFontConstants.nunitaSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Care Coordinator
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/svg-icons/mobile.svg",
                    width: 16.0,
                    height: 16.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "Care Coordinator",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFontConstants.nunitaSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Coach
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/svg-icons/user-avatar.svg",
                    width: 16.0,
                    height: 16.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "Coach",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFontConstants.nunitaSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

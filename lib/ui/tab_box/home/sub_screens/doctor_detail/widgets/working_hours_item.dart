import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/home/sub_screens/doctor_detail/widgets/work_hour_item.dart';

class WorkingHoursItem extends StatelessWidget {
  const WorkingHoursItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: const Column(
        children: [
          WorkHourItem(dayName: 'Monday', dayHour: '00:00 - 00:00'),
          WorkHourItem(dayName: 'Tuesday', dayHour: '00:00 - 00:00'),
          WorkHourItem(dayName: 'Wednesday', dayHour: '00:00 - 00:00'),
          WorkHourItem(dayName: 'Thursday', dayHour: '00:00 - 00:00'),
          WorkHourItem(dayName: 'Friday', dayHour: '00:00 - 00:00'),
          WorkHourItem(dayName: 'Saturday', dayHour: '00:00 - 00:00'),
          WorkHourItem(dayName: 'Sunday', dayHour: '00:00 - 00:00'),
        ],
      ),
    );
  }
}

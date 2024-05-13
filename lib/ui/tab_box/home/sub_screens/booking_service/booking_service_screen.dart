import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/calendar_doctors/calendar_doctors_cubit.dart';
import 'package:medify/cubits/calendar_services/calendar_services_cubit.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/home/sub_screens/booking_doctor/widgets/hours_button.dart';
import 'package:medify/ui/tab_box/profile/widgets/select_photo.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingServicesScreen extends StatefulWidget {
  const BookingServicesScreen({super.key});

  @override
  State<BookingServicesScreen> createState() => _CalendarServicesScreenState();
}

class _CalendarServicesScreenState extends State<BookingServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          title: "Booking Services Estate",
          onTap: () {
            Navigator.pop(context);
          }),
      body: BlocBuilder<CalendarServicesCubit, CalendarServicesState>(
        builder: (context, state) {
          // print("${state.startDate} checkIn");
          return Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                    //   child: Text(
                    //     tr("select_date"),
                    //     style: TextStyle(
                    //         fontSize: 20.sp,
                    //         fontWeight: FontWeight.w700,
                    //         color: AppColors.c_900),
                    //   ),
                    // ),
                    // 20.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TableCalendar(
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        calendarStyle: CalendarStyle(
                            outsideDaysVisible: true,
                            holidayDecoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(width: 4.h, color: AppColors.primary, style: BorderStyle.solid)
                                )
                            ),
                            // selectedDecoration: BoxDecoration(
                            // color: AppColors.c_900,
                            //   borderRadius: BorderRadius.circular(16.r),
                            //   border: Border.all(width: 10.r,color: AppColors.white)
                            // ),
                            holidayTextStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            defaultTextStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            weekendTextStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600)),
                        calendarBuilders: CalendarBuilders(
                          headerTitleBuilder:
                              (context, DateTime focusedDay) {
                            final monthName =
                            DateFormat.MMMM(context.locale.toString())
                                .format(focusedDay);
                            final year = DateFormat.y().format(focusedDay);
                            return Center(
                              child: Text(
                                '$monthName $year',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors
                                      .c_900, // Customize the color as needed
                                ),
                              ),
                            );
                          },
                          dowBuilder: (context, day) {
                            if (day.weekday == DateTime.sunday) {
                              final text =
                              DateFormat.E(context.locale.toString())
                                  .format(day);
                              return Center(
                                child: Text(
                                  text,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );
                            }
                            return null;
                          },
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.c_900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        locale: context.locale.toString(),
                        firstDay: DateTime.now(),
                        rowHeight: 55.h,
                        lastDay: DateTime(2040),
                        focusedDay: state.focusedDay,
                        // holidayPredicate: (day) {
                        //   for(int i=0; i<state.messages.length; i++){
                        //     if(state.messages[i].startDate == day){
                        //       return true;
                        //     }
                        //   }
                        //   return false;
                        // },
                        selectedDayPredicate: (day) =>
                            isSameDay(state.selectedDate, day),
                        rangeStartDay: state.startDate,
                        calendarFormat: CalendarFormat.month,
                        rangeSelectionMode:
                        state.rangeSelectionMode,
                        onRangeSelected: (start, end, focusedDay) {
                          context
                              .read<CalendarServicesCubit>()
                              .initializeRanges(start, start);
                          context
                              .read<CalendarServicesCubit>()
                              .initializeRanges(end, start);
                        },
                        onPageChanged: (v) {
                          context
                              .read<CalendarServicesCubit>()
                              .changeFocusDay(v);
                        },
                      ),
                    ),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              9,
                                  (index) => Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 5.h),
                                child: HoursButton(
                                    index: index + 1,
                                    onTap: () {
                                      context
                                          .read<CalendarServicesCubit>()
                                          .setSelectHour(index);
                                    },
                                    isSelect: state.selectHour == index),
                              ))
                        ],
                      ),
                    ),
                    24.ph,
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                      leading: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.purple),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset(AppIcons.camera,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.white, BlendMode.srcIn)),
                        ),
                      ),
                      title: Text(
                        tr("select_image"),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900,
                        ),
                      ),
                      subtitle: state.image != null
                          ? Text(
                        state.image!.substring(state.image!.length - 15),
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_700,
                        ),
                      )
                          : null,
                      trailing: state.image != null
                          ? SvgPicture.asset(AppIcons.checked)
                          : SvgPicture.asset(AppIcons.unchecked),
                      onTap: () {
                        showCameraAndGalleryDialog(context, (xfile) {
                          if (xfile != null) {
                            context
                                .read<CalendarServicesCubit>()
                                .updateImage(xfile.path);
                            print(xfile.path.split(".").last);
                          }
                        });
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                      leading: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.orange),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset(AppIcons.folder,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.white, BlendMode.srcIn)),
                        ),
                      ),
                      title: Text(
                        tr("select_file"),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900,
                        ),
                      ),
                      subtitle: state.file != null
                          ? Text(
                        state.file!.paths.first!.split("/").last,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_700,
                        ),
                      )
                          : null,
                      trailing: state.file != null
                          ? SvgPicture.asset(AppIcons.checked)
                          : SvgPicture.asset(AppIcons.unchecked),
                      onTap: () async {
                        context
                            .read<CalendarServicesCubit>()
                            .updateFile(await _openFilePicker(context));
                        setState(() {});
                      },
                    ),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        tr("note_to_owner"),
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.c_900),
                      ),
                    ),
                    16.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: GlobalTextField(
                        focusNode: state.notesFocus,
                        controller: state.notes,
                        hintText: tr("notes"),
                        maxLines: 4,
                        contentPadding: EdgeInsets.all(20.r),
                      ),
                    ),
                    20.ph,
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GlobalButton(
                  title: tr("continue"),
                  onTap: () async{
                    Navigator.pushNamed(
                        context, RouteNames.bookingInfoDetailScreen);
                  },
                  radius: 100.r,
                  color: AppColors.primary,
                  textColor: Colors.white,
                ),
              ),
              40.ph,
            ],
          );
        },
      ),
    );
  }

  Future<FilePickerResult?> _openFilePicker(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null) {
        print("RESULT: ${result.files.first.path}");
        ApiService apiService = ApiService();
        UniversalData data = await apiService.uploadToInnerFolder(token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjJkZTliNGE2OTE4NzQyMzc4ZmYwYTEiLCJlbWFpbCI6InNheWl0cXVsb3ZkaWxzaG9kYmVrQGdtYWlsLmNvbSIsImlhdCI6MTcxNDI4NDk4MSwiZXhwIjoxNzE0MzcxMzgxfQ.1V4Vh-0ro8iiCWB-aFn8U2PM1qnxbl7hJ17HEQN3EkM', folderName: "Sunnatilla-Akfa-Medline", file: result.files.first);
        String filesNa = data.data;
        print("Data: $filesNa");
        // File picked successfully
        print('File picked: ${result.files.first.path?.split(".").last}');
        return result;
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      // Handle exception
      print('Error picking file: $e');
    }
    return null;
  }
}

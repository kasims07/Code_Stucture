import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DateTimeUtils {
  DateTimeUtils._();

  static final _formatBirthDate = DateFormat('yyyy-MM-dd');
  static final _formatBirthDatePayment = DateFormat('MM/dd/yyyy');
  static final _formatBirthDateForProfile = DateFormat('MM-dd-yyyy');
  static final _formatBirthDateForServer = DateFormat('yyyy-MM-dd');
  static final _formatOverviewBirthDate = DateFormat('dd, MMM yyyy');
  static final _formatDateTime = DateFormat('dd-MM-yyyy');
  static final _formatDisplayDate = DateFormat('dd MMM, yyyy');
  static final _formatTime = DateFormat('HH:mm');

  static String formatBirthDate(DateTime? date) {
    if (date == null) return '';
    return _formatBirthDateForProfile.format(date);
  }

  static String formatBirthDateForServer(DateTime? date) {
    if (date == null) return '';
    return _formatDateTime.format(date);
  }

  static String formatBirthDateForShown(DateTime? date) {
    if (date == null) return '';
    return _formatDisplayDate.format(date);
  }

  static String formatPaymentDate(DateTime? date) {
    if (date == null) return '';
    return _formatBirthDatePayment.format(date);
  }

  static String formatBirthDateForSendToServer(String? date) {
    if (date == null) return '';
    DateTime dateForSend = DateTime.parse(date);
    return _formatBirthDateForProfile.format(dateForSend);
  }

  static String formatDateOfBirthFromServer(String? dateOfBirth) {
    if (dateOfBirth == null) return '';
    DateTime date = DateTime.parse(dateOfBirth);
    return _formatBirthDate.format(date);
  }

  static String formatStartDateFromServer(DateTime? dateOfBirth) {
    if (dateOfBirth == null) return '';
    // DateTime date = DateTime.parse(dateOfBirth);
    return DateFormat.yMMMMd().format(dateOfBirth);
  }

  static String formatTimeOfDayFromServer(TimeOfDay? tod) {
    if (tod == null) return '';
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();  //"6:00 AM"
    return format.format(dt);
  }

  static DateTime? parseBirthDateFromServer(String? dateOfBirth) {
    if (dateOfBirth == null) return null;
    return Intl.withLocale('en', () => _formatBirthDate.parse(dateOfBirth));
  }

  static String? formatBirthDateUserToServer(String? dateOfBirth) {
    if (dateOfBirth == null) return null;
    final dateTime =
        Intl.withLocale('en', () => _formatBirthDate.parse(dateOfBirth));
    return _formatBirthDateForServer.format(dateTime);
  }

  static String formatDisplayDate(DateTime? date) {
    if (date == null) return '';
    return _formatDisplayDate.format(date);
  }

  static String calculateDifference(String? dateTimeString) {
   // if (date == null) return '';
    var currentTime = DateTime.now();
    var diff =DateTime.now().difference(DateTime.parse(dateTimeString!));
    return diff.inHours.toString();
  }
}

import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_foreground_task_method_channel.dart';
import 'models/foreground_service_types.dart';
import 'models/foreground_task_options.dart';
import 'models/notification_button.dart';
import 'models/notification_icon.dart';
import 'models/notification_options.dart';
import 'models/notification_permission.dart';
import 'task_handler.dart';

abstract class FlutterForegroundTaskPlatform extends PlatformInterface {
  /// Constructs a FlutterForegroundTaskPlatform.
  FlutterForegroundTaskPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterForegroundTaskPlatform _instance =
      MethodChannelFlutterForegroundTask();

  /// The default instance of [FlutterForegroundTaskPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterForegroundTask].
  static FlutterForegroundTaskPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterForegroundTaskPlatform] when
  /// they register themselves.
  static set instance(FlutterForegroundTaskPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // ====================== Service ======================

  Future<void> startService({
    required AndroidNotificationOptions androidNotificationOptions,
    required IOSNotificationOptions iosNotificationOptions,
    required ForegroundTaskOptions foregroundTaskOptions,
    int? serviceId,
    List<ForegroundServiceTypes>? serviceTypes,
    required String notificationTitle,
    required String notificationText,
    NotificationIcon? notificationIcon,
    List<NotificationButton>? notificationButtons,
    String? notificationInitialRoute,
    Function? callback,
  }) {
    throw UnimplementedError('startService() has not been implemented.');
  }

  Future<void> restartService() {
    throw UnimplementedError('restartService() has not been implemented.');
  }
  Future<Map<Object?, Object?>> getSpeed() async {
    final MethodChannel mMDChannel =
      const MethodChannel('flutter_foreground_task/methods');
    var speed=   await mMDChannel.invokeMethod('getSpeed') ;
    //print("this is native side 1 $speed");
    return speed;
  }

  Future<void> updateService({
    ForegroundTaskOptions? foregroundTaskOptions,
    String? notificationTitle,
    String? notificationText,
     String? smalliconText,
    NotificationIcon? notificationIcon,
    List<NotificationButton>? notificationButtons,
    String? notificationInitialRoute,
    Function? callback,
  }) {
    throw UnimplementedError('updateService() has not been implemented.');
  }

  Future<void> stopService() {
    throw UnimplementedError('stopService() has not been implemented.');
  }

  Future<bool> get isRunningService {
    throw UnimplementedError('isRunningService has not been implemented.');
  }

  Future<bool> get attachedActivity {
    throw UnimplementedError('attachedActivity has not been implemented.');
  }

  void setTaskHandler(TaskHandler handler) {
    throw UnimplementedError('setTaskHandler() has not been implemented.');
  }

  // =================== Communication ===================

  void sendDataToTask(Object data) {
    throw UnimplementedError('sendDataToTask() has not been implemented.');
  }

  // ====================== Utility ======================

  void minimizeApp() {
    throw UnimplementedError('minimizeApp() has not been implemented.');
  }

  void launchApp([String? route]) {
    throw UnimplementedError('launchApp() has not been implemented.');
  }

  void setOnLockScreenVisibility(bool isVisible) {
    throw UnimplementedError(
        'setOnLockScreenVisibility() has not been implemented.');
  }

  Future<bool> get isAppOnForeground {
    throw UnimplementedError('isAppOnForeground has not been implemented.');
  }

  void wakeUpScreen() {
    throw UnimplementedError('wakeUpScreen() has not been implemented.');
  }

  Future<bool> get isIgnoringBatteryOptimizations {
    throw UnimplementedError(
        'isIgnoringBatteryOptimizations has not been implemented.');
  }

  Future<bool> openIgnoreBatteryOptimizationSettings() {
    throw UnimplementedError(
        'openIgnoreBatteryOptimizationSettings() has not been implemented.');
  }

  Future<bool> requestIgnoreBatteryOptimization() {
    throw UnimplementedError(
        'requestIgnoreBatteryOptimization() has not been implemented.');
  }

  Future<bool> get canDrawOverlays {
    throw UnimplementedError('canDrawOverlays has not been implemented.');
  }

  Future<bool> openSystemAlertWindowSettings() {
    throw UnimplementedError(
        'openSystemAlertWindowSettings() has not been implemented.');
  }

  Future<NotificationPermission> checkNotificationPermission() {
    throw UnimplementedError(
        'checkNotificationPermission() has not been implemented.');
  }

  Future<NotificationPermission> requestNotificationPermission() {
    throw UnimplementedError(
        'requestNotificationPermission() has not been implemented.');
  }

  Future<bool> get canScheduleExactAlarms {
    throw UnimplementedError(
        'canScheduleExactAlarms has not been implemented.');
  }

  Future<bool> openAlarmsAndRemindersSettings() {
    throw UnimplementedError(
        'openAlarmsAndRemindersSettings() has not been implemented.');
  }
}

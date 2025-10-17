import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/messages.g.dart',
  kotlinOut: 'android/app/src/main/kotlin/com/example/pigeon_demo/Messages.kt',
  kotlinOptions: KotlinOptions(package: 'com.example.pigeon_demo'),
))
@HostApi()
abstract class BatteryApi {
  int getBatteryLevel();
}

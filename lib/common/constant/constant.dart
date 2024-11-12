import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

const basePath = 'assets/image';
const baseImageSvgPath = "assets/svg";

const ACCESS_TOKEN = "acessToken";
const REFRESH_TOKEN = "refreshToken";

final storage = FlutterSecureStorage();

// const emulatorIp = "http://10.0.2.2:8000";
// const emulatorIp = "https://backend-wandering-glitter-8053.fly.dev";
// const simulatorIp = "https://backend-wandering-glitter-8053.fly.dev";
// final ip = Platform.isIOS ? simulatorIp : emulatorIp;
final ip = "https://backend-wandering-glitter-8053.fly.dev";

const deployIp = "/";

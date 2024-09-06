import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

const basePath = 'assets/image';
const baseImageSvgPath = "assets/svg";

const ACCESS_TOKEN = "acessToken";
const REFRESH_TOKEN = "refreshToken";

final storage = FlutterSecureStorage();

// const emulatorIp = "10.0.2.2:8000";
const emulatorIp = "https://backend-wandering-glitter-8053.fly.dev";
const simulatorIp = "127.0.0.1:8000";
final ip = Platform.isIOS ? simulatorIp : emulatorIp;

const deployIp = "/";

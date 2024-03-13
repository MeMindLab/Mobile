import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const basePath = 'assets/image';
const baseImageSvgPath = "assets/svg";

final dio = Dio();

const ACCESS_TOKEN = "acessToken";
const REFRESH_TOKEN = "refreshToken";

final storage = FlutterSecureStorage();



class HeadersManager {
  HeadersManager._privateConstructor();

  // Static final instance
  static final HeadersManager _instance = HeadersManager._privateConstructor();

  // Static method
  static HeadersManager get instance {
    return _instance;
  }

  Map<String, dynamic>? headers;

  void configure() async {
    // late String deviceInfo;
    // await DeviceManager.instance.info().then((value) => deviceInfo = value);
    headers = {
      // 'os': DeviceManager.instance.os(),
      // 'os-version': DeviceManager.instance.osVersion(),
      // 'device': deviceInfo,
      // 'version': VersionManager.instance.version(),
      // 'language': 'en'
    };
  }
}

import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  // GMMSServices.provideAPIKey("AIzaSyChT-gBEmoUHZLyRh7cg9cBTAEnVPGSCGQ");
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

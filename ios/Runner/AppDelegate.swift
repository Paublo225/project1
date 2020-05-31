import UIKit
import Flutter
import HomeKit
import Foundation

enum ChannelName {
  static let actionCh = "com.channel.app/actionset"
    static let homeCh = "com.channel.app/home"
  static let eventCh = "com.channel.app/eventus"
}

enum BatteryState {
  static let charging = "charging"
  static let discharging = "discharging"
}

enum MyFlutterErrorCode {
  static let unavailable = "UNAVAILABLE"
}


@available(iOS 11.0, *)

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
   private var eventSink: FlutterEventSink?
    
    let homeDataStore = HomeData()
    

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
 
    guard let controller = window?.rootViewController as? FlutterViewController else {
        fatalError("rootViewController is not type FlutterViewController")
    }
   
    let  homeChannel = FlutterMethodChannel(name:ChannelName.homeCh,binaryMessenger: controller.binaryMessenger)
    
    homeChannel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        switch call.method {
        case "getHome":
        self?.homeDataStore.getHomes(result:result)
        print("Poluchili Dom")
        case "getActions":
        print("Poluchili Scenes")
        self?.homeDataStore.getActionList(result:result)
       /* case "TriggerList":
        print("Poluchili triggers")
        self?.homeDataStore.triggerlist(result:result)
        case "createTrigger":
            self?.homeDataStore.createNewTrigger(name: "novoe", weekdays: 2, hour: 14, minute: 30, result: result)*/
        default :
        result(FlutterMethodNotImplemented)
        
    }
    })
    
   
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    
   
   
    
}









//
//  ViewController.swift
//  FluNative
//
//  Created by 冯才凡 on 2019/5/25.
//  Copyright © 2019 冯才凡. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pushFlutterAction(_ sender: Any) {
        let flutter = FlutterViewController()
        flutter.hidesBottomBarWhenPushed = true
        
        flutter.setInitialRoute("myApp")
        let methodChannel:FlutterMethodChannel = FlutterMethodChannel(name: "com.pages.your/native_get", binaryMessenger: flutter)
        
        methodChannel.setMethodCallHandler {[weak self] (call, result) in
            guard let `self` = self else {return}
            /*
             *
             */
            print("method:\(call.method);narguments:\(String(describing: call.arguments))")
            
            if "iOSFlutter" == call.method {
                
                let target = TargetViewController()
                self.navigationController?.pushViewController(target, animated: true)
            }else if "iOSFlutter1" == call.method {
                if let dic = call.arguments as? [NSString:Any] {
                    print("code:\(dic["code"] ?? "-1")")
                    print("data:\(dic["data"] ?? "-1")")
                }
            }else if "iOSFlutter2" == call.method {
                let batterylevel = self.getBatteryLevel()
                if batterylevel == -1 {
                    result(FlutterError(code: "UNAvailable", message: "battery info unavailabel", details: nil))
                }else{
                    result("\(batterylevel)")
                }
            }
            
        }
        
        self.navigationController?.pushViewController(flutter, animated: true)
    }
    
    
    
    func getBatteryLevel()->Int {
        return 50
    }
    
}




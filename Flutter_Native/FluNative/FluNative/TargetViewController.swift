//
//  TargetViewController.swift
//  FluNative
//
//  Created by 冯才凡 on 2019/5/28.
//  Copyright © 2019 冯才凡. All rights reserved.
//

import UIKit
import Flutter


class TargetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "target"
        view.backgroundColor = .white
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.pushFlutter_eventChannel()
    }
    
    
    func pushFlutter_eventChannel() {
        let flutter = FlutterViewController()
        flutter.title = "home"
        flutter.hidesBottomBarWhenPushed = true
        
        flutter.setInitialRoute("home")
        let eventChannel:FlutterEventChannel = FlutterEventChannel(name: "com.pages.your/native_post", binaryMessenger: flutter)
        
        eventChannel.setStreamHandler(self)
        
        self.navigationController?.pushViewController(flutter, animated: true)
    }
}

extension TargetViewController:FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        
        events("push传值给flutter的vc")
        
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        
        print(arguments)
        
        return nil
    }
    
    
    
}

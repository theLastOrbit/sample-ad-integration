//
//  AppDelegate.swift
//  AdSDKSample
//
//  Created by MD RUBEL on 5/11/25.
//

import UIKit
import KahfAdSDK

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        // FIXME: Replace with your actual token
        let token = ""
        KahfAdProvider.shared.initialize(withToken: token)
        
        return true
    }
}

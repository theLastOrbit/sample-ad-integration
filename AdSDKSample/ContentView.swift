//
//  ContentView.swift
//  AdSDKSample
//
//  Created by MD RUBEL on 5/11/25.
//

import SwiftUI
import KahfAdSDK

struct ContentView: View {
    
    let adConfig = KahfAdConfig(
        adType: .BANNER_AD,
        divId: "under-saalat-time",
        screenName: "home-page-ios"
    )
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            KahfAdProvider.shared.getView(for: adConfig)
                .padding(Edge.Set.horizontal, 16)
            
        }
        .padding()
        .onAppear {
            // Must call this to get an ad.
            // Call this on ViewDidLoad or ViewDidAppear on UIKit
            KahfAdProvider.shared.refreshAd(for: adConfig)
        }
        .onDisappear {
            // Stop refreshing the ad when the view disappears.
            KahfAdProvider.shared.stopAutoRefresh(for: adConfig)
        }
        .onReceive(KahfAdProvider.shared.listener) { listener in
            // handle firebase log or othrer events here.
            switch listener {
            case .onAdLoaded:
                print("Ad loaded successfully")
                
            case .onAdFailedToLoad(let message):
                print("Ad failed to load with message: \(String(describing: message))")
                
            case .onAdClicked:
                print("Ad clicked")
            
            default:
                break
            }
        }
    }
}

#Preview {
    ContentView()
}

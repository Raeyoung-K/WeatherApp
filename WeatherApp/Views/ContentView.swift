//
//  ContentView.swift
//  WeatherApp
//
//  Created by Raeyoung Kim on 2023-09-25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
            
            VStack {
                
                if let location = locationManager.location {
                    Text("Your coordinates are: \(location.longitude), \(location.latitude)")
                } else {
                    if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomeView()
                            .environmentObject(locationManager)
                    }
                }
                
            } // VStack
            .background(Color(hue: 0.671, saturation: 0.638, brightness: 0.649))
            .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

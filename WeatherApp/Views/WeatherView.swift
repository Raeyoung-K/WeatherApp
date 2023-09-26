//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Raeyoung Kim on 2023-09-25.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            VStack {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        } //VStack
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .bold()
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://previews.123rf.com/images/blamb/blamb1310/blamb131000001/24466540-une-lumi%C3%A8re-bande-dessin%C3%A9e-l%C3%A2che-de-la-ville-de-new-york-%C3%A9tats-unis.jpg")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                } //VStack
                .frame(maxWidth: .infinity)
                
            } // VStack
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
        } // ZStack
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.671, saturation: 0.638, brightness: 0.649))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

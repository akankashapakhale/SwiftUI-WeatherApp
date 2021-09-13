//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Akanksha pakhale on 08/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNight = false
    
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityView(cityName: "Bhopal")
                MainWeatherStatus(imageName: "cloud.sun.fill", temperature: 38)
              //  .padding(.bottom, 40)
                HStack(spacing: 40)
                {
                    WeatherDayView(day: "Tues", imageName: "cloud.sun.fill", temperature: 26)
                    WeatherDayView(day: "Wed", imageName: "cloud.sun.bolt.fill", temperature: 28)
                    WeatherDayView(day: "Thrus", imageName: "sun.haze.fill", temperature: 29)
                    WeatherDayView(day: "Fri", imageName: "cloud.fill", temperature: 20)
                }
                
                Spacer()
                Button  {
                    //print("Button Tapped")
                    isNight.toggle()
                } label : {
                    WeatherButton(title: "Change day and Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct WeatherDayView: View {
    var day: String
    var imageName: String
    var temperature: Int
    
    var body: some View { 
        VStack {
            Text(day)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium, design: .default))
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium, design: .default))
        }
    }
}
struct BackgroundView: View {
    @Binding var isNight: Bool
    //var topColor: Color
    //var bottomColor: Color
    var body: some View {
        
        LinearGradient(gradient:Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")])
                       ,startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
struct CityView: View {
    var cityName: String
    var body: some View {
        
                    Text(cityName)
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .medium, design: .default))
    }
}
struct MainWeatherStatus: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        
        VStack{
            Image(systemName: imageName )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Text("\(temperature)°")
                .font(.system(size: 60, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


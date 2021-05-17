//
//  MainView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct MainView: View {
    //Selected tab
    @State var selectedTab = "Home"
    //Animation namespace
    @Namespace var animation
    
    var body: some View {
        ZStack {
            Color.purpleTheme
                .ignoresSafeArea()
            
            //Боковое меню
            VStack(alignment: .leading, spacing: 15) {
                
                //Profile
                Image("profile2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70, alignment: .top)
                    .cornerRadius(10)
                    
                //Padding top for Top Close Button
                    .padding(.top, 50)
                VStack(alignment: .leading, spacing: 6) {
                    Text("Monika Deep")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Button(action: {}) {
                        Text("View Profile")
                            .fontWeight(.semibold)
                            .opacity(0.7)
                    }
                }
                .foregroundColor(.white)
                
                //tab Buttons
                VStack(alignment: .leading, spacing: 10) {
                    TabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(image: "clock.arrow.circlepath", title: "History", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(image: "bell.badge", title: "Notification", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(image: "gearshape", title: "Settings", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(image: "questionmark.circle", title: "Help", selectedTab: $selectedTab, animation: animation)
                }
                .padding(.leading, -15)
                .padding(.top, 50)
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

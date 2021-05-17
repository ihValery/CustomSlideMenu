//
//  Home.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String
    
    //Hiding tab bar
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        //Tab View with tabs
        TabView(selection: $selectedTab) {
            
            //Views
            HomePage().tag("Home")
            History().tag("History")
            Settings().tag("Settings")
            Notifications().tag("Notification")
            Help().tag("Help")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomePage: View {
    
    var body: some View {
        NavigationView {
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getRect().width - 50, height: 500)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.4), radius: 4, x: 5, y: 5)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Monika Deep")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Text("Very beautiful girl, youtuber, sportswoman, junior teacher ...")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .navigationTitle("Home")
            }
        }
    }
}

struct History: View {
    
    var body: some View {
        NavigationView {
            Text("History")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("History")
        }
    }
}

struct Settings: View {
    
    var body: some View {
        NavigationView {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Settings")
        }
    }
}

struct Notifications: View {
    
    var body: some View {
        NavigationView {
            Text("Notification")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Notification")
        }
    }
}

struct Help: View {
    
    var body: some View {
        NavigationView {
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Help")
        }
    }
}

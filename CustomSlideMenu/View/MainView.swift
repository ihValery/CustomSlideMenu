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
    @State var showMenu = false
    
    var body: some View {
        ZStack {
            Color.purpleTheme
                .ignoresSafeArea()
            
            //Боковое меню
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                SideMenu(selectedTab: $selectedTab)
            }
            
            ZStack {
                
                //two background cards
                Color.white
                    .opacity(0.6)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical, 30)
                
                Color.white
                    .opacity(0.4)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical, 60)
                
                Home(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
                
            }
            //Scaling and moving the view
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? getRect().width - 120 : 0)
            .ignoresSafeArea()
            .overlay(
                Button(action: {
                    withAnimation(.spring()) {
                        showMenu.toggle()
                    }
                }, label: {
                    //animate Drawing Button
                    VStack(spacing: 5) {
                        Capsule()
                            .fill(showMenu ? Color.white : Color.black)
                            .frame(width: 30, height: 3)
                        //Rotating
                            .rotationEffect(.init(degrees: showMenu ? -45 : 0))
                            .offset(x: showMenu ? 2.5 : 0, y: showMenu ? 9 : 0)
                        VStack(spacing: 5) {
                            Capsule()
                                .fill(showMenu ? Color.white : Color.black)
                                .frame(width: 30, height: 3)
                            //Moving Up when clicked
                            Capsule()
                                .fill(showMenu ? Color.white : Color.black)
                                .frame(width: 30, height: 3)
                                .offset(y: showMenu ? -8 : 0)
                        }
                        .rotationEffect(.init(degrees: showMenu ? 45 : 0))
                    }
                })
                .padding()
                , alignment: .topLeading)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

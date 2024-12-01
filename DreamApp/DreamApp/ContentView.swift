//
//  ContentView.swift
//  Dream
//
//  Created by Yahan Yang on 11/20/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var context
    var body: some View {
        NavigationStack{
            ZStack{
                AngularGradient(colors: [Color("Color2"),Color("Color1"), Color("DreamInput"),Color("Color1"),Color("DreamInput"),Color("Color1"),Color("Color2"),Color("DreamInput"),Color("Color1")], center: .center)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    NavigationLink("Write"){
                        AddDream()
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .font(.title)
                    .padding()
                    .padding(.bottom, 35)
                    NavigationLink("Build"){
                        BuildDream()
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .font(.title)
                    NavigationLink("Dreams"){
                        DreamRecord()
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .font(.title)
                    .padding()
                    .padding(.top, 35)
                    Spacer()
                }
                .foregroundColor(.black)
                .fontWeight(.heavy)
            }
        }
    }
}


#Preview {
    ContentView()
}


//
//  ContentView.swift
//  DreamApp
//
//  Created by Yahan Yang on 11/20/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var context
    var body: some View {
        NavigationStack{
            ZStack{
                Color("DreamInput")
                    .ignoresSafeArea()
                VStack{
                    NavigationLink("Log Your Dreams"){
                        AddDream()
                    }
                    .padding()
                    NavigationLink("Build Your Dreams"){
                    }
                    NavigationLink("Dream Records"){
                        DreamRecord()
                    }.padding()
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


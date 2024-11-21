//
//  ContentView.swift
//  DreamApp
//
//  Created by Yahan Yang on 11/20/24.
//

import SwiftUI

struct ContentView: View {
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




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

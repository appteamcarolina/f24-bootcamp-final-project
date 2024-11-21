//
//  DreamRecord.swift
//  DreamApp
//
//  Created by Yahan Yang on 11/20/24.
//

import SwiftUI

struct DreamRecord: View {
    var body: some View {
        DreamView()
    }
}


struct DreamView: View {
    
    //@Query var entry: DreamEntry
    //Change all temp to Query
    @State var tempFill = Date()
    @State var tempFill1 = ""
    @State var tempFill2 = ""
    let Moods = ["Depressed","Sad","Calm","Happy","Excited"]
    var body: some View {
        ZStack{
            Color("DreamInput")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    DatePicker("",selection: $tempFill, displayedComponents: .date)
                    Picker("Mood from data", selection:$tempFill1){//entry.Mood){
                        ForEach(Moods, id: \.self){ mood in
                            Text(mood)
                        }
                    } .pickerStyle(.menu)
                        .accentColor(.black)
                    Spacer()
                        .padding(.trailing, 10)
                }
                TextField("",text: $tempFill2, axis:.vertical)
                    .lineLimit(10, reservesSpace: true)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 360)
            }
        }
    }
}

struct DreamRecord_Previews: PreviewProvider {
    static var previews: some View {
        DreamRecord()
    }
}

//
//  DreamRecord.swift
//  DreamApp
//
//  Created by Yahan Yang on 11/20/24.
//

import SwiftUI
import SwiftData

struct DreamRecord: View {
    @Query var entries: [DreamEntry]
    @State private var dataUpdated = false
    
    @State var SampleEntries = [DreamEntry(Content: "Test1", EntryDate: Date(), Mood: "Happy"), DreamEntry(Content: "Test2", EntryDate: Date(), Mood: "Sad"),DreamEntry(Content: "Test3", EntryDate: Date(), Mood: "Excited")]
    
    var body: some View {
        ZStack{
            Color("DreamInput")
                .ignoresSafeArea()
            VStack{
                ScrollView{
                    ForEach(SampleEntries,id:\.self){ entryDream in
                        Section{
                            DreamView(entry: entryDream)
                        }
                    }
                }
            }
        }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
            ForEach(entries,id:\.self){ entryDream in
                    DreamView(entry: entryDream)
                }
            .onAppear {
                       print(entries) // Debug entries being fetched
                   }
        
        
        
            }
        }

struct DreamView: View {
    @Bindable var entry: DreamEntry
    //Change all temp to Query
    let Moods = ["Depressed","Sad","Calm","Happy","Excited"]
    var body: some View {
        ZStack{
            Color("DreamInput")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    DatePicker("",selection: $entry.EntryDate, displayedComponents: .date)
                    Picker("Mood from data", selection: $entry.Mood){
                        ForEach(Moods, id: \.self){ mood in
                            Text(mood)
                        }
                    } .pickerStyle(.menu)
                        .accentColor(.black)
                    Spacer()
                        .padding(.trailing, 10)
                }
                TextField("",text: $entry.Content, axis:.vertical)
                    .lineLimit(10, reservesSpace: true)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 360)
        }
        }
    }
}

#Preview{
    DreamRecord()
        .modelContainer(for: DreamEntry.self)
}

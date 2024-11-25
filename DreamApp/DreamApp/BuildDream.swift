//
//  BuildDream.swift
//  DreamApp
//
//  Created by Yahan Yang on 11/24/24.
//

import SwiftUI
import SwiftData

struct BuildDream: View {
    @Query var Entries: [DreamEntry]
    @State private var Summary = "Summary of Dreams"
    @State private var Input = ""
    
    @State var SampleEntries = [DreamEntry(Content: "Test1", EntryDate: Date(), Mood: "Happy"), DreamEntry(Content: "Test2", EntryDate: Date(), Mood: "Sad"),DreamEntry(Content: "Test3", EntryDate: Date(), Mood: "Excited"), DreamEntry(Content: "Test4", EntryDate: Date(), Mood: "Happy")]
    
    
    
    var body: some View {
        Button("Build Your Dreams"){
            Task{
                getEntriesTest()
                Summary = await UseAI.generateSummary(entry: Input)
            }
        }
        Text("\(Summary)")
    }
    /*
    func getEntries() {
        let NewEntries: [DreamEntry]
        if Entries.count > 7 {
            let arraySlice = Entries.suffix(7)
            NewEntries = Array(arraySlice)
        }
        else {
            NewEntries = Entries
        }
        
        for entry in NewEntries{
            Input = "\(Input) \(entry.Content) \n"
        }
    }
    */
    func getEntriesTest() {
        let NewEntries: [DreamEntry]
        if SampleEntries.count > 7 {
            let arraySlice = SampleEntries.suffix(7)
            NewEntries = Array(arraySlice)
        }
        else {
            NewEntries = SampleEntries
        }
        
        for entry in NewEntries{
            Input = "\(Input) \(entry.Content) \n"
        }
    }
}

#Preview {
    BuildDream()
        .modelContainer(for: DreamEntry.self)
}

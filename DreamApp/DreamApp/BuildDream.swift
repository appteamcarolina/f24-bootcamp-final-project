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
    
    @State private var pressed:Bool = false;
    
    
    var body: some View {
        
        ZStack{
            AngularGradient(colors: [Color("Color1"), Color("ButtonColor"),Color("DreamInput"),Color("Color1")], center: .center)
                .ignoresSafeArea()
            
            VStack{
                Button(){
                    Task{
                        getEntriesTest()
                        Summary = await UseAI.generateSummary(entry: Input)
                        self.pressed = true;
                    }
                    
                } label:{
                    Image(systemName: pressed ? "seal.fill" : "seal")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        
                }
                .padding(.top, 25)
                Text("\(Summary)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(20)
            }
        }
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

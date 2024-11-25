//
//  AddDream.swift
//  Dream
//
//  Created by Yahan Yang on 11/20/24.
//

import SwiftUI
import SwiftData

struct AddDream: View {
    @Environment(\.modelContext) private var context
    
    @State var InputDream = ""
    @State var InputDate: Date = Date()
    @State var InputMood = "Calm"
    let Moods = ["Depressed","Sad","Calm","Happy","Excited"]
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    var body: some View {
        NavigationStack{
            ZStack{
                Color("DreamInput")
                    .ignoresSafeArea()
                VStack{
                    Form{
                        Section("Write Your Dreams"){
                            TextField("", text: $InputDream, axis: .vertical)
                                .lineLimit(10, reservesSpace: true)
                                .textFieldStyle(.roundedBorder)
                            DatePicker("Date", selection: $InputDate, displayedComponents: .date)
                            Picker("Mood", selection: $InputMood){
                                ForEach(Moods, id: \.self){ mood in
                                    Text(mood)
                                }
                            }.pickerStyle(.segmented)
                        }.foregroundColor(.black)
                    }
                    .navigationTitle("Dream")
                    .navigationBarTitleDisplayMode(.inline)
                    
                    //SUBMIT BUTTON
                    Button{
                        addEntry()
                        InputDream = ""
                        InputDate = Date()
                        InputMood = "Calm"
                        
                    }label:{
                        Image(systemName: "plus.diamond")
                            .font(.system(size:50))
                            .foregroundColor(.white)
                            .padding(.bottom,100)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
    func addEntry() {
        
        guard !InputDream.isEmpty else {
            print("Error: InputDream is empty")
            return
        }
        print("InputDream: \(InputDream), InputDate: \(InputDate), InputMood: \(InputMood)")
        let entry = DreamEntry(Content: InputDream, EntryDate: InputDate, Mood: InputMood)
        context.insert(entry)
        do{
            try context.save()
        }
        catch{
            print("Error saving entry: \(error)")
        }
        
    }

}

    #Preview {
            AddDream()

    }


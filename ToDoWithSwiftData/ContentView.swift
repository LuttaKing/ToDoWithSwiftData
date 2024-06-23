//
//  ContentView.swift
//  ToDoWithSwiftData
//
//  Created by Denilson Washuma on 24/06/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    @Environment(\.modelContext) private var modelContext
    @State private var todoText:String = ""
    @Query private var toDos: [ToDo]
    
    
    var body: some View {
        VStack {
            List {
                ForEach(toDos){ item in //item is ToDo
                    
                    
                    HStack {
                        Text(item.title)
                        Image(systemName: "pencil")
                            .onTapGesture {
                                updateToDo(item)
                            }
                    }
                    
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        deleteTodo(toDos[index])
                    }
                })
            }
            
            TextField("Enter to do", text: $todoText)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Add ToDo to Database") {
                addTodDo()
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
    
    func addTodDo(){
        if todoText.count > 3 {
            
            //create item
            let todo = ToDo(title: todoText)
            // add item
            modelContext.insert(todo)
            
        }
        
    }
    
    func deleteTodo(_ todo: ToDo){
        modelContext.delete(todo)
        
    }
    
    func updateToDo(_ todo: ToDo){
        //edit
        todo.title = "Updated title"
        // save
        try? modelContext.save()
        
    }
    
}

#Preview {
    ContentView()
}

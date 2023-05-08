//
//  QuestionView12.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI


struct QuestionView12: View {
    @State private var column1 = ""
    @State private var column2 = ""
    @State private var column3 = ""
    @State private var column4 = ""
    @State private var isEditing = false
    @State private var isCompleted = false

    var body: some View {
        VStack {
            List {
                HStack {
                    TextField("Column 1", text: $column1)
                    Spacer()
                    Button(action: {
                        self.isEditing = true
                    }) {
                        if isCompleted {
                            Image(systemName: "heart")
                        } else {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                HStack {
                    TextField("Column 2", text: $column2)
                    Spacer()
                    Button(action: {
                        self.isEditing = true
                    }) {
                        if isCompleted {
                            Image(systemName: "heart")
                        } else {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                HStack {
                    TextField("Column 3", text: $column3)
                    Spacer()
                    Button(action: {
                        self.isEditing = true
                    }) {
                        if isCompleted {
                            Image(systemName: "heart")
                        } else {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                HStack {
                    TextField("Column 4", text: $column4)
                    Spacer()
                    Button(action: {
                        self.isEditing = true
                    }) {
                        if isCompleted {
                            Image(systemName: "heart")
                        } else {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            Button("Complete Creation") {
                self.isCompleted = true
            }
            .padding()
            .disabled(!isAllColumnsFilled())
            .sheet(isPresented: $isEditing) {
                EditList()
            }
        }
    }

    func isAllColumnsFilled() -> Bool {
        !column1.isEmpty && !column2.isEmpty && !column3.isEmpty && !column4.isEmpty
    }
}

struct EditList: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            // Editing view content
            Button("Save") {
                // Save the edited list and dismiss the editing view
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}


struct QuestionView12_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView12()
    }
}

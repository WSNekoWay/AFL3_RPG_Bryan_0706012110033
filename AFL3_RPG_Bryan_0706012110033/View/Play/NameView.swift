//
//  NameView.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI
//this is view for asking the player name
struct NameView: View {
    @State private var playerName: String = ""
    @State private var isEditing: Bool = false
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Enter Your Name")
                        .font(.custom("PixelOperator-Bold", size: 40))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    TextField("", text: $playerName, onEditingChanged: { editing in
                        self.isEditing = editing
                    })
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .background(
                        ZStack(alignment: .leading) {
                            if playerName.isEmpty && !isEditing {
                                Text("Your Name")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .padding(.horizontal, 40)
                    .frame(width: 400, height: 40, alignment: .center)
                    .textContentType(.name)
                    .onChange(of: playerName) { newValue in
                        var filteredName = ""
                        for char in newValue {
                            if char.isLetter {
                                filteredName.append(char)
                            }
                        }
                        playerName = String(filteredName.prefix(16)).trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    
                    
                    NavigationLink(destination: PlayView().environmentObject(Player(name: playerName)).navigationBarHidden(true)) {
                        Text("Submit")
                            .font(.custom("PixelOperator-Bold", size: 24))
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8.0)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .disabled(playerName.isEmpty)
                    .padding(.top,20)
                    
                }
            }
        }
    }
}




struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}

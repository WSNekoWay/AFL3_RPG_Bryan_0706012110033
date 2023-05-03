//
//  MaterialRow.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI
//this is potion row
struct MaterialRow: View {
    var material: MaterialItem

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)

            HStack {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                    material.image
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.trailing, 8)

                VStack(alignment: .leading) {
                    Text(material.name)
                        .font(.custom("PixelOperator", size: 24))
                        .bold()
                        .foregroundColor(.white)
                    Text(material.type)
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.gray)
                }

                Spacer()

                
            }
            .padding(.vertical, 4)
            .padding(.horizontal)
        }
    }
}


struct MaterialRow_Previews: PreviewProvider {
    static var materials = Player(name: "WanSen").materials

    static var previews: some View {
        Group {
            MaterialRow(material: materials[0])
            MaterialRow(material: materials[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

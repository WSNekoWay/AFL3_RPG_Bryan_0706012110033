//
//  EquipmentRow.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
//this is equipment row
struct EquipmentRow: View {
    var equipment: EquipmentItem
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
            
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                    equipment.image
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text(equipment.name)
                        .font(.custom("PixelOperator", size: 24))
                        .bold()
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(equipment.type)
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.gray)
                }
                
                
                Spacer()
                if equipment.equipped {
                    Text("Equipped")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }

                
            }
            .padding(.vertical, 4)
            .padding(.horizontal)
        }
    }
}


           
       

struct EquipmentRow_Previews: PreviewProvider {
    static var equipments = Player(name: "WanSen").equipments

    static var previews: some View {
        Group {
            EquipmentRow(equipment: equipments[0])
            EquipmentRow(equipment: equipments[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

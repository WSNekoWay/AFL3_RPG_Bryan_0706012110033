//
//  MaterialDetail.swift
//  AFL3_RPG_Bryan_0706012110033
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI
//this is material detail
struct MaterialDetail: View {
    @EnvironmentObject var player: Player
    var material: MaterialItem

    var materialIndex: Int {
        player.materials.firstIndex(where: { $0.id == material.id })!
    }

    var filteredMaterial: [MaterialItem] {
        player.materials.filter { $0.type == material.type }
    }

    var body: some View {
        ScrollView {
            Image("background")
                .resizable()
                .ignoresSafeArea(edges: .top)
                .frame(height: 250)

            CircleImage(image: material.image)
                .offset(y: -200)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(material.name)
                        .font(.custom("PixelOperator", size: 40))
                        .foregroundColor(.white)

                }

                HStack {
                    Text(material.type)
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Owned: \(material.owned) x")
                        .font(.custom("PixelOperator", size: 20))
                        .foregroundColor(.gray)
                }
                .font(.subheadline)

                Divider()
                    .background(Color.gray)

                Text("About \(material.name)")
                    .font(.custom("PixelOperator", size: 28))
                    .foregroundColor(.white)
                Text(material.description)
                    .padding(.bottom,10)
                    .font(.custom("PixelOperator", size: 20))
                    .foregroundColor(.white)
                Text("Price: \(material.price)")
                    .font(.custom("PixelOperator", size: 20))
                    .foregroundColor(.white)
            }
            .padding()
        }
        .navigationTitle(material.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.black)
    }
}



struct MaterialDetail_Previews: PreviewProvider {
    static let player = Player(name: "WanSen")

    static var previews: some View {
        MaterialDetail(material: player.materials[0])
                .environmentObject(player)
    }
}

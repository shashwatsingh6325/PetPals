//
//  OnboardingView.swift
//  PetPals
//
//  Created by Avya Rathod on 16/12/23.
//

import SwiftUI

struct PalView: View {
    var palName: String
    var palPets: String
    var imageName: String
    @State private var isFavorite: Bool = false
    
    var body: some View {
        NavigationLink(destination: PalProfileView(palName: palName)) {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(8)
                    
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .white)
                            .padding(8)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                    .offset(x: -5, y: 10)
                }
                
                Text(palName)
                    .font(.headline)
                    .foregroundColor(.white) // White font color for the text
                    .padding([.horizontal], 8)
                    .lineLimit(1)
                Text(palPets)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding([.leading, .bottom], 8)
                    .lineLimit(1)
            }
            .frame(width: 150, height: 190)
            .background(Color.clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .shadow(radius: 10) // Shadow for the card
        }
    }
}

struct PalProfileView: View {
    var palName: String

    var body: some View {
        Text("Profile of \(palName)")
            .navigationTitle(palName)
    }
}

// Preview
#Preview {
    PalView(palName: "Lorem ipsun", palPets: "Dog, cat", imageName: "user image")
        .previewLayout(.sizeThatFits)
                    .padding()
                    .background(Color(white: 0.9))
}

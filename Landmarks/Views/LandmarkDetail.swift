//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Mithilesh Kumar on 29/03/21.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom,-130)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding(16)
        }.navigationTitle(landmark.name).navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}

//
//  ModelData.swift
//  Landmarks
//
//  Created by Mithilesh Kumar on 29/03/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}



func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Invalid file name: \(fileName)");
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Clund not load: \(fileName) from main numbler, Error: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parse \(fileName) as \(T.self) \n\nError: \(error)")
    }
}

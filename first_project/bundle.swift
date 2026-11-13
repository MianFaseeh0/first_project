//
//  bundle.swift
//  first_project
//
//  Created by Mian Faseeh on 13/11/2026.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable> (_ file: String) -> T {
     guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate the file \(file)")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load the data from file \(file)")
        }
        
        let decode = JSONDecoder()
        
        do {
            return try decode.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context){
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context){
            fatalError("failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type , let context){
            fatalError("failed to decode \(file) from bundle due to missing \(type) - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context){
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        }  catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}

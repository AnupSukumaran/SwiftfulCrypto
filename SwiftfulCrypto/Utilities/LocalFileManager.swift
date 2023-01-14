//
//  LocalFileManager.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 10/01/2023.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let shared = LocalFileManager()
    private init() {}
    
    func saveImage(image: UIImage?, imageName: String, folderName: String) {
        
        createFolderIfNeeded(folderName: folderName)
        
        guard let data = image?.pngData(),
                let url = getURLForImage(imageName: imageName, folderName: folderName)
                else {return}
        do {
            debugPrint("<LocalFileManager> image saved at url = \(url.absoluteString)")
            try data.write(to: url)
        } catch {
            debugPrint("<LocalFileManager> Failed to write Image: ImageName: \(imageName), Error - \(error.localizedDescription)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName), FileManager.default.fileExists(atPath: url.path) else {return nil}
        
        
        return UIImage(contentsOfFile: url.path)
        
    }
    
    func getURLForFolder(folderName: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
        
        return url.appendingPathComponent(folderName)
        
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let urlString = getURLForFolder(folderName: folderName)?.path else {
            
            debugPrint("<LocalFileManager> getURLForFolder func failed")
            return
            
        }
        guard !FileManager.default.fileExists(atPath: urlString) else {
            debugPrint("<LocalFileManager> File already exists")
            return
            
        }
        
        do {
            try FileManager.default.createDirectory(atPath: urlString, withIntermediateDirectories: true)
        } catch {
            debugPrint("<LocalFileManager> Failed to create directory For FolderName: - \(folderName), error = \(error.localizedDescription)")
        }
        
    }
    
    func getURLForImage(imageName: String, folderName: String) -> URL? {
        
        guard let folderPath = getURLForFolder(folderName: folderName) else {return nil}
        
        return folderPath.appendingPathComponent(imageName + ".png")
    }
    
    
    
}

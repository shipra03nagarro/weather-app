//
//  ImageDownloader.swift
//  WeatherApp
//
//  Created by Shipra Dhooper on 09/04/25.
//

import UIKit

class ImageDownloader {

    static let shared = ImageDownloader()
    private let imageCache = NSCache<NSString, UIImage>()

    func cachedImage(for url: URL) -> UIImage? {
        return imageCache.object(forKey: url.absoluteString as NSString)
    }

    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {

        // Check if image is in cache
        if let cachedImage = cachedImage(for: url) {
            DispatchQueue.main.async {
                completion(cachedImage)
            }
            return
        }

        // If not cached, download the image
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error downloading image: \(error)")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid data or unable to create image")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            // Cache the downloaded image
            self.imageCache.setObject(image, forKey: url.absoluteString as NSString)

            // Perform the completion handler on the main thread
            DispatchQueue.main.async {
                completion(image)
            }
        }

        task.resume()
    }

    // This method allows you to clear the cache
    func clearCache() {
        imageCache.removeAllObjects()
    }
}

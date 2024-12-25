//
//  Ext.swift
//  MusicPlayerAss34
//
//  Created by beqa on 24.12.24.
//

import UIKit
import CoreImage

extension UIImage {
    var dominantColor: UIColor? {
        guard let cgImage = self.cgImage else { return nil }
        let context = CIContext()
        let inputImage = CIImage(cgImage: cgImage)
        let filter = CIFilter(name: "CIAreaAverage")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        if let outputImage = filter?.outputImage {
            let extent = outputImage.extent
            let bitmap = context.createCGImage(outputImage, from: extent)
            let data = bitmap?.dataProvider?.data
            let ptr = CFDataGetBytePtr(data)
            let r = CGFloat(ptr![0]) / 255.0
            let g = CGFloat(ptr![1]) / 255.0
            let b = CGFloat(ptr![2]) / 255.0
            return UIColor(red: r, green: g, blue: b, alpha: 1.0)
        }
        return nil
    }
}

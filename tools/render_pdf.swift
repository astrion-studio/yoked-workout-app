import Foundation
import PDFKit
import AppKit

func usage() {
    let message = "Usage: render_pdf.swift <input.pdf> <output_dir> <prefix> [scale]"
    FileHandle.standardError.write(message.data(using: .utf8)!)
    FileHandle.standardError.write("\n".data(using: .utf8)!)
}

guard CommandLine.arguments.count >= 4 else {
    usage()
    exit(1)
}

let inputPath = CommandLine.arguments[1]
let outputDirPath = CommandLine.arguments[2]
let prefix = CommandLine.arguments[3]
let scale = CommandLine.arguments.count >= 5 ? (Double(CommandLine.arguments[4]) ?? 2.0) : 2.0

let inputURL = URL(fileURLWithPath: inputPath)
let outputDirURL = URL(fileURLWithPath: outputDirPath, isDirectory: true)

let fm = FileManager.default
try fm.createDirectory(at: outputDirURL, withIntermediateDirectories: true)

guard let document = PDFDocument(url: inputURL) else {
    FileHandle.standardError.write("Failed to open PDF: \(inputPath)\n".data(using: .utf8)!)
    exit(2)
}

let pageCount = document.pageCount
print("PAGE_COUNT=\(pageCount)")

for i in 0..<pageCount {
    autoreleasepool {
        guard let page = document.page(at: i) else {
            FileHandle.standardError.write("Missing page at index \(i)\n".data(using: .utf8)!)
            return
        }

        let bounds = page.bounds(for: .mediaBox)
        let width = Int((bounds.width * CGFloat(scale)).rounded(.up))
        let height = Int((bounds.height * CGFloat(scale)).rounded(.up))

        guard width > 0, height > 0 else {
            FileHandle.standardError.write("Invalid bounds for page \(i + 1)\n".data(using: .utf8)!)
            return
        }

        guard let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: width * 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        ) else {
            FileHandle.standardError.write("Failed to create bitmap context for page \(i + 1)\n".data(using: .utf8)!)
            return
        }

        context.setFillColor(NSColor.white.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))

        context.saveGState()
        context.translateBy(x: 0, y: CGFloat(height))
        context.scaleBy(x: CGFloat(scale), y: -CGFloat(scale))
        page.draw(with: .mediaBox, to: context)
        context.restoreGState()

        guard let cgImage = context.makeImage() else {
            FileHandle.standardError.write("Failed to render page \(i + 1)\n".data(using: .utf8)!)
            return
        }

        let bitmap = NSBitmapImageRep(cgImage: cgImage)
        guard let pngData = bitmap.representation(using: .png, properties: [:]) else {
            FileHandle.standardError.write("Failed to encode PNG for page \(i + 1)\n".data(using: .utf8)!)
            return
        }

        let filename = String(format: "%@_%03d.png", prefix, i + 1)
        let outputURL = outputDirURL.appendingPathComponent(filename)
        do {
            try pngData.write(to: outputURL)
        } catch {
            FileHandle.standardError.write("Failed to write \(filename): \(error)\n".data(using: .utf8)!)
            return
        }
    }
}

print("DONE")

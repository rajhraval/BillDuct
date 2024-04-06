//
//  MultiformRequest.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

protocol MultiformData {
    var separator: String { get }
    var boundary: String { get }
    var body: Data { get }
    var data: Data { get }
    var header: [String: String] { get }
}

extension MultiformData {
    var separator: String {
        "\r\n"
    }

    var body: Data {
        var newData = data
        newData.append("--\(boundary)--")
        return newData
    }

    var header: [String: String] {
        ["Content-Type": "multipart/form-data; boundary=\(boundary)"]
    }
}

enum MimeType: String {
    case jpeg
    case png

    var value: String {
        return "image/\(rawValue)"
    }
}

struct MultiformRequest: MultiformData {
    
    var boundary: String
    var data: Data

    init(boundary: String = UUID().uuidString, data: Data = Data()) {
        self.boundary = boundary
        self.data = data
    }

    private mutating func appendBoundarySeparator() {
        data.append("--\(boundary)\(separator)")
    }

    private mutating func appendSeparator() {
        data.append(separator)
    }

    private func disposition(_ key: String) -> String {
        "Content-Disposition: form-data; name=\"\(key)\""
    }

    public mutating func addText(
        key: String,
        value: String
    ) {
        appendBoundarySeparator()
        data.append(disposition(key) + separator)
        appendSeparator()
        data.append(value + separator)
    }

    public mutating func addFile(
        key: String,
        fileName: String,
        fileMimeType: MimeType = .png,
        fileData: Data
    ) {
        appendBoundarySeparator()
        data.append(disposition(key) + "; filename=\"\(fileName).\(fileMimeType.rawValue)\"" + separator)
        data.append("Content-Type: \(fileMimeType.value)" + separator + separator)
        data.append(fileData)
        appendSeparator()
    }
}

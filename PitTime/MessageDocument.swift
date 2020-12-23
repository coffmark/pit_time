//
//  MessageDocument.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/22.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct MessageDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.plainText] }
    var message: String

    init(message: String) {
        self.message = message
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        message = string
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
    }
}

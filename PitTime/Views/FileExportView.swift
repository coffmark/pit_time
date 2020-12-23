//
//  FileExportView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/23.
//

import SwiftUI

struct FileExportView: View {

    @State private var document = MessageDocument(message: "Hello World")
    @State private var isImporting: Bool = false
    @State private var isExporting: Bool = false

    var body: some View {
        VStack {
            GroupBox(label: Text("Message: "), content: {
                TextEditor(text: $document.message)
            })
            GroupBox {
                HStack {
                    Spacer()
                    Button(action: {
                        isImporting = true
                    }, label: {
                        Text("Import")
                    })
                    Spacer()
                    Button(action: {
                        isExporting = true
                    }, label: {
                        Text("Export")
                    })
                    Spacer()
                }
            }
        }
        .padding()
        .fileExporter(isPresented: $isExporting, document: document, contentType: .plainText, defaultFilename: "Message") { result in
            if case .success = result {
                // Handle Success
                print("Success")
            } else {
                // Handle Failure
            }
        }
    }
}

struct FileExportView_Previews: PreviewProvider {
    static var previews: some View {
        FileExportView()
    }
}

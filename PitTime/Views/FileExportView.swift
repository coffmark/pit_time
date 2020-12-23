//
//  FileExportView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/23.
//

import SwiftUI

struct FileExportView: View {
    @Environment(\.presentationMode) var presentaionMode
    @State private var document = MessageDocument(message: "Hello World!, kamimura, hifehife, fehifehi")
    @State private var isExporting: Bool = false

    // Alert
    @State private var showSuccess: Bool = false

    var body: some View {
        VStack {
            GroupBox(label: Text("CSVファイル"), content: {
                Text(document.message)
                    .font(.footnote)
            })
            GroupBox {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isExporting.toggle()
                    }, label: {
                        Text("Export")
                    })
                    Spacer()
                }
            }
        }
        .padding()
        .fileExporter(isPresented: $isExporting, document: document, contentType: .commaSeparatedText, defaultFilename: "CommaSeparated") { result in
            if case .success = result {
                // Handle Success
                print("Success")
                self.showSuccess.toggle()
                self.presentaionMode.wrappedValue.dismiss()
            } else {
                // Handle Failure
                print("Error Can't Export CSV File")
            }
        }
        .alert(isPresented: $showSuccess) { () -> Alert in
            Alert(title: Text("Success Export CSV File!😳"))
        }
    }
}

struct FileExportView_Previews: PreviewProvider {
    static var previews: some View {
        FileExportView()
    }
}

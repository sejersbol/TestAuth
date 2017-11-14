//
//  FileProviderItem.swift
//  TestAuthFPE
//
//  Created by Anders Sejersbøl on 14/11/2017.
//

import FileProvider

class FileProviderItem: NSObject, NSFileProviderItem {
  
  private let name: String
  
  // TODO: implement an initializer to create an item from your extension's backing model
  // TODO: implement the accessors to return the values from your extension's backing model
  
  init (name: String) {
    self.name = name
  }
  
  var itemIdentifier: NSFileProviderItemIdentifier {
    return NSFileProviderItemIdentifier(name)
  }
  
  var parentItemIdentifier: NSFileProviderItemIdentifier {
    return NSFileProviderItemIdentifier.rootContainer
  }
  
  var capabilities: NSFileProviderItemCapabilities {
    return .allowsAll
  }
  
  var filename: String {
    return name
  }
  
  var typeIdentifier: String {
    return "public.image"
  }
  
}

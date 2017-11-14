//
//  FileProviderEnumerator.swift
//  TestAuthFPE
//
//  Created by Anders Sejersbøl on 14/11/2017.
//

import FileProvider

var fileProviderItemCache = [String : FileProviderItem]()

class FileProviderEnumerator: NSObject, NSFileProviderEnumerator {
  
  var enumeratedItemIdentifier: NSFileProviderItemIdentifier
  
  init(enumeratedItemIdentifier: NSFileProviderItemIdentifier) {
    self.enumeratedItemIdentifier = enumeratedItemIdentifier
    super.init()
  }
  
  func invalidate() {
    // TODO: perform invalidation of server connection if necessary
  }
  
  func enumerateItems(for observer: NSFileProviderEnumerationObserver, startingAt page: NSFileProviderPage) {
    /* TODO:
     - inspect the page to determine whether this is an initial or a follow-up request
     
     If this is an enumerator for a directory, the root container or all directories:
     - perform a server request to fetch directory contents
     If this is an enumerator for the active set:
     - perform a server request to update your local database
     - fetch the active set from your local database
     
     - inform the observer about the items returned by the server (possibly multiple times)
     - inform the observer that you are finished with this page
     */
    
    var listing = [FileProviderItem]()
    
    for i in 1...3 {
      let name = "file_\(i)"
      
      let fileProviderItem = FileProviderItem(name: name)
      
      fileProviderItemCache[name] = fileProviderItem
      
      listing.append(fileProviderItem)
    }
    
    observer.didEnumerate(listing)
    
    // We're returning everything as a single page here (upToPAge: nil)
    // TOOD: Since the extension is given a very small amount of memory,
    // paginating the results may be necessary for directories with lots
    // of files.
    observer.finishEnumerating(upTo: nil)
  }
  
  func enumerateChanges(for observer: NSFileProviderChangeObserver, from anchor: NSFileProviderSyncAnchor) {
    /* TODO:
     - query the server for updates since the passed-in sync anchor
     
     If this is an enumerator for the active set:
     - note the changes in your local database
     
     - inform the observer about item deletions and updates (modifications + insertions)
     - inform the observer when you have finished enumerating up to a subsequent sync anchor
     */
  }
  
}

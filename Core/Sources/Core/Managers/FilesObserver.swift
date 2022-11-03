//
// FilesObserver.swift
//

import Foundation

public class FilesObserver {
    
    // MARK: -
    
    private let fileDescriptor: CInt
    
    private let dispatchSource: DispatchSourceProtocol
    
    // MARK: -
    
    public init(url: URL) {
        self.fileDescriptor = open(url.path, O_EVTONLY)
        self.dispatchSource = DispatchSource.makeFileSystemObjectSource(fileDescriptor: self.fileDescriptor, eventMask: .all, queue: .global())
    }
    
    // MARK: -
    
    public func start(in queue: DispatchQueue = .main, _ block: @escaping () -> Void) {
        dispatchSource.resume()
        dispatchSource.setEventHandler {
            queue.async {
                block()
            }
        }
    }
    
    public func stop() {
        dispatchSource.cancel()
    }
    
    // MARK: -
    
    deinit {
        stop()
        close(fileDescriptor)
    }
}

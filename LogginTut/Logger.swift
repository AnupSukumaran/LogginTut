//
//  Logger.swift
//  LogginTut
//
//  Created by Sukumar Anup Sukumaran on 23/03/19.
//  Copyright © 2019 Qaptive_Technologies. All rights reserved.
//

import os.log

class Logger {
    
    
    
    enum types: String {
        case info =  "LOG"
        case warning =  "WARNING"
        case error = "ERROR"
    }
    
    enum Component {
        case file
        case function
        case line
        
        func enabled() -> Bool {
            return Logger.components.contains(self)
        }
    }
    
    static func osLog() {
         print("OSLOG => \(OSLog(subsystem: "com.Qaptive-Technologies.Loqqat.LogginTut", category: "general"))")
        
    }
    
    
    static var components: [Component] = [Component]()
    
    static func newprint(_ msg: String,_ filepath: String = #file,_ function: String = #function,_ line: Int = #line ) {
        self.myprint(msg, .info, filepath, function, line )
    }
    
    static func myprint(_ msg: String,_ type: types, _ filepath: String = #file,_ function: String = #function,_ line: Int = #line ) {
        #if DEBUG
        
        var log = "\(type.rawValue) "
        
        if Component.file.enabled() {
            let fileComponents = filepath.components(separatedBy: "/")
            let fileName = fileComponents.isEmpty ? "" : fileComponents.last!
            log.append("\(fileName) ")
        }
        
        if Component.function.enabled() {
            log.append("\(function )")
        }
        
        if Component.line.enabled() {
            log.append("\(line) ")
        }
        
        log.append(msg)
        print(log)
        
        #endif
    }
}

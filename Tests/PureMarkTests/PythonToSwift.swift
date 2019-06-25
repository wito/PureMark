//
//  PythonToSwift.swift
//  SwiftMark
//
//  Created by Caleb Kleveter on 3/29/17.
//
//

import Foundation

func runScript(withName name: String) -> String? {
    
    let scriptPath: String = "\(FileManager.default.currentDirectoryPath)/\(name)"
    
    let arguments = [scriptPath]
    
    let outPipe = Pipe()
    let errPipe = Pipe();
    
    let task = Process()
    task.executableURL = URL(string: "/usr/bin/python")
    task.arguments = arguments
    task.standardInput = Pipe()
    task.standardOutput = outPipe
    task.standardError = errPipe
    try? task.run()
    
    let data = outPipe.fileHandleForReading.readDataToEndOfFile()
    task.waitUntilExit()
    
    let exitCode = task.terminationStatus
    if (exitCode != 0) {
        print("ERROR: \(exitCode)")
        return nil
    }
    
    return String(data: data, encoding: String.Encoding.ascii)
}

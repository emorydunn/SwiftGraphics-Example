//
//  ViewController.swift
//  SwiftGraphics Example
//
//  Created by Emory Dunn on 5/21/20.
//  Copyright © 2020 Lost Cause Photographic, LLC. All rights reserved.
//

import Cocoa
import SwiftGraphics

class ViewController: NSViewController {
    
    lazy var savePanel: NSSavePanel = {
        let savePanel = NSSavePanel()
        savePanel.allowedFileTypes = [
            String(kUTTypePNG)
        ]
        
        return savePanel
    }()

    override func viewDidAppear() {
        runSketch()
    }
    
    func runSketch() {
        guard let sketchView = view as? SketchView else {
            return
        }
        
        let sketch = IntersectionTest()
        sketchView.sketch = sketch
        view.window?.title = IntersectionTest.title
        
    }
    
    @IBAction func saveDocument(_ sender: Any? = nil) {
        
        guard let sketchView = view as? SketchView else {
            return
        }
        
        if let name = sketchView.sketch?.hashedFileName() {
            savePanel.nameFieldStringValue = name
        }
        
        savePanel.beginSheetModal(for: view.window!) { (response) in
            switch response {
            case .OK:
                let image = sketchView.drawToImage()
                do {
                    try sketchView.saveImage(image, to: self.savePanel.url!)
                } catch {
                    self.presentError(error)
                }
            default:
                break
            }
            
        }
        
    }


}


//
//  SketchView.swift
//  SwiftGraphics Example
//
//  Created by Emory Dunn on 5/21/20.
//  Copyright © 2020 Lost Cause Photographic, LLC. All rights reserved.
//

import AppKit
import SwiftGraphics
//
//class SketchView: NSView {
//
//    var sketch: Sketch?
//
//    override func draw(_ dirtyRect: NSRect) {
//
//        sketch?.setup()
//        sketch?.draw()
//
//    }
//
//    func drawToImage() -> NSImage {
//        let image = NSImage(size: self.frame.size)
//        image.lockFocusFlipped(false)
//        sketch?.setup()
//        sketch?.draw()
//        image.unlockFocus()
//
//        return image
//    }
//
//
//    func saveImage(_ image: NSImage, to url: URL) {
//
//        guard let tiffData = image.tiffRepresentation else {
//            return
//        }
//        let imageRep = NSBitmapImageRep(data: tiffData)
//        let data = imageRep?.representation(using: .png, properties: [:])
//
//        do {
//            try data?.write(to: url)
//        } catch {
//            self.presentError(error)
//        }
//    }
//
//    @IBAction func clickGestureAction(_ sender: NSClickGestureRecognizer) {
//        let point = sender.location(in: self)
//        let v = Vector(point.x, point.y)
//        (sketch as? InteractiveSketch)?.mouseDown(at: v)
//
//        self.needsDisplay = true
//
//    }
//
//    @IBAction func panGestureAction(_ sender: NSPanGestureRecognizer) {
//        let point = sender.location(in: self)
//        let v = Vector(point.x, point.y)
//        (sketch as? InteractiveSketch)?.mousePan(at: v)
//
//        self.needsDisplay = true
//    }
//
//    override func scrollWheel(with event: NSEvent) {
//        super.scrollWheel(with: event)
//
//        //        sender.mou
//        //        self.mou
//        let windowPoint = event.locationInWindow
//        let localPoint = self.convert(windowPoint, to: nil)
//        let v = Vector(localPoint.x, localPoint.y)
//
//        (sketch as? InteractiveSketch)?.scrolled(
//            deltaX: Double(event.scrollingDeltaX),
//            deltaY: Double(event.scrollingDeltaY),
//            at: v
//        )
//
//        self.needsDisplay = true
//    }
//
//}

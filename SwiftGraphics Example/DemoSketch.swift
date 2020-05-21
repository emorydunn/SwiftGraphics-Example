//
//  DemoSketch.swift
//  SwiftGraphics Example
//
//  Created by Emory Dunn on 5/21/20.
//  Copyright © 2020 Lost Cause Photographic, LLC. All rights reserved.
//

import Foundation
import SwiftGraphics

class IntersectionTest: Sketch {
    var title: String = "IntersectionTest"
    
    var bb: BoundingBox!
    
    // Base Objects
    let testCircle = Circle(x: 400, y: 600, radius: 150)
    let testRect = Rectangle(x: 600, y: 400, width: 200, height: 100)
    
    // Ray Tracing
    let emitter = DirectionalEmitter(Vector(x: 200, y: 500), -30)
    let circleEmitter = CircleEmitter(x: 600, y: 700, radius: 35, rayStep: 1)
    let fresnel = Fesnel(200, 200, 400, 400)
    
    func setup() {
        
        context?.setBlendMode(.lighten)
        bb = BoundingBox(inset: 100)
    }
    
    func draw() {
        
        // Draw a solid background
        context?.setFillColor(.init(gray: 0.2, alpha: 1))
        BoundingBox(inset: 0).draw()
        
        context?.setStrokeColor(.init(gray: 0.51, alpha: 1))
        context?.setFillColor(.clear)
        
        bb.draw()
        
        testCircle.draw()
        testRect.draw()
        
        fresnel.draw()
        
        emitter.draw()
        emitter.draw(boundingBox: bb,
                     objects: [
                        testCircle,
                        testRect,
                        fresnel
        ])
        
        context?.setStrokeColor(.init(red: 1, green: 0, blue: 0, alpha: 1))
        circleEmitter.draw(boundingBox: bb,
                           objects: [
                            testCircle,
                            testRect,
                            fresnel])
        
        
    }
    
    
}

extension IntersectionTest: InteractiveSketch {
    
    func objectContaining(_ point: Vector) -> SwiftGraphics.Polygon? {
        // Test whether the point is inside an object
        if testRect.contains(point) {
            return testRect
        } else if testCircle.contains(point) {
            return testCircle
        } else if emitter.contains(point) {
            return emitter
        } else if circleEmitter.contains(point) {
            return circleEmitter
        } else {
            return nil
        }
        
    }
    
    func mousePan(at point: Vector) {
        // Test whether the point is inside an object
        
        guard let selected = objectContaining(point) else { return }
        
        switch selected {
        case let c as Circle:
            c.center = point
        case let r as Rectangle:
            r.center = point
        case let c as CircleEmitter:
            c.center = point
        case let c as DirectionalEmitter:
            c.center = point
        default:
            break
        }
        

    }
    
    func mouseDown(at point: Vector) {
        
    }
    
    func scrolled(deltaX: Double, deltaY: Double, at point: Vector) {
        guard let selected = objectContaining(point) else { return }
        
        switch selected {
        case let e as CircleEmitter:
            
            var newStep: Degrees
            if deltaY > 0 {
                newStep = e.rayStep + 0.1
            } else {
                newStep = e.rayStep - 0.1
            }

            if newStep < 0.1 {
                newStep = 0.1
            }
            e.rayStep = newStep
            
        case let e as DirectionalEmitter:
            e.direction -= deltaY
        default:
            break
        }

    }
}

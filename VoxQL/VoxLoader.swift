//
//  File.swift
//  QLVox
//
//  Created by Michael Bujol on 10/28/15.
//  Copyright © 2015 test. All rights reserved.
//

import Foundation
import SceneKit
import SceneKit.ModelIO

@objc class VoxLoader : NSObject {
    
    var scene: SCNScene = SCNScene()
        
    func loadVoxFileIntoScene(fileURL: NSURL!) -> NSData {
        let MVFile = MVFileReader(fileURL: fileURL)
        let boxGeom = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)

        let voxelsNode = SCNNode()
        voxelsNode.rotation = SCNVector4Make(1, 0, 0, 12.0*CGFloat(M_PI)/8.0)
        voxelsNode.position = SCNVector3Make(0, 0, 0)
        
        for voxel in MVFile.voxels {
            let boxNode = SCNNode(geometry: boxGeom.copy() as? SCNGeometry)
            
            boxNode.position = SCNVector3(voxel.position)
            boxNode.transform = SCNMatrix4Mult(boxNode.transform, voxelsNode.transform)
            
            let color = MVFile.palette[voxel.paletteIndex].color
            boxNode.geometry!.firstMaterial = boxNode.geometry?.firstMaterial?.copy() as? SCNMaterial
            boxNode.geometry!.firstMaterial?.diffuse.contents = color
            
            scene.rootNode.addChildNode(boxNode)
        }
        
        //Bug in SceneKit handling of QuickLook previews forces intermediate Collada representation: rdar://23301726
        //From Apple:
        //If a developer provides Data however, it will only work with Collada (because SCNSceneSource initWithData only
        //supports Collada. (Note: we're aware of this issue and are tracking it in another bug report).
        //So as a workaround, if a developer can't pass an URL, they should pass a NSData than contains Collada
        
        scene.writeToURL(NSURL(fileURLWithPath: "/tmp/temp.dae"), options: [SCNSceneSourceFlattenSceneKey: 1], delegate: nil, progressHandler: nil)
        let data: NSData = NSData(contentsOfFile: "/tmp/temp.dae")!

        return data
    }
}
//
//  ViewController.swift
//  lesson8
//
//  Created by Yury Popov on 11/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Set the scene to the view
        sceneView.scene = SCNScene()
        
        sceneView.scene.rootNode.addChildNode(loadSphere())
        sceneView.scene.rootNode.addChildNode(loadFloor())
        sceneView.scene.rootNode.addChildNode(loadHome())
        sceneView.scene.rootNode.addChildNode(loadText())
        
    }
    
    func loadFloor() -> SCNNode {
        let node = SCNNode()
        let geometry = SCNPlane(width: 0.5, height: 0.5)
        node.geometry = geometry
        node.position = SCNVector3(0, -0.3, -0.7)
        node.eulerAngles.x = -.pi / 2
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "floor")
        node.geometry?.materials = [material]
        
        
        return node
    }
    
    func loadHome() -> SCNNode {
        let node = SCNNode()
        let geometry = SCNPlane(width: 0.5, height: 0.5)
        node.geometry = geometry
        node.position = SCNVector3(0, -0.08, -0.8)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "home")
        node.geometry?.materials = [material]
        
        
        return node
    }
    
    
    func loadSphere() -> SCNNode {
        let node = SCNNode(geometry: SCNSphere(radius: 0.5))
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "moon")
        
        node.geometry!.materials = [material]
        node.runAction(.repeatForever(.rotateBy(x: 0, y: -.pi, z: 0, duration: 10)))
        node.position = SCNVector3(0, 0, -5)
        return node
    }
    
    func loadText() -> SCNNode {
        let node = SCNNode(geometry: SCNText(string: "Hello World!", extrusionDepth: 2))
        let material = SCNMaterial()
        material.diffuse.contents = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        node.geometry?.materials = [material]
        node.position = SCNVector3(20, 10, -100)
        
        
        node.runAction(.repeatForever(.rotateBy(x: -.pi, y: -.pi, z: 0, duration: 5)))
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

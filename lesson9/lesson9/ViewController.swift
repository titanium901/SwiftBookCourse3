//
//  ViewController.swift
//  lesson9
//
//  Created by Yury Popov on 14/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit
import SceneKit
import ARKit




class ViewController: UIViewController {
    
    

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var textPlace: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var hoopAdded = false
    var count = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.autoenablesDefaultLighting = true
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
       
        // Set the scene to the view
        sceneView.scene = SCNScene()
    
        
        sceneView.scene.physicsWorld.contactDelegate = self

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.vertical]

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
//    func physicsWorld(_ world: SCNPhysicsWorld, didEnd contact: SCNPhysicsContact) {
//        print("End contact")
//    }
    
   
    
    func addHoop(result: ARHitTestResult) {
        let hoopNode = SCNScene(named: "art.scnassets/Hoop.scn")!.rootNode
        hoopNode.eulerAngles.x = -.pi / 2
//        let boxTwo = SCNScene(named: "art.scnassets/Box2.scn")!.rootNode
//        boxTwo.position = SCNVector3(0, 0, 0)

        
        hoopNode.physicsBody = SCNPhysicsBody(type: .static, shape: SCNPhysicsShape(node: hoopNode, options:
            [SCNPhysicsShape.Option.type: SCNPhysicsShape.ShapeType.concavePolyhedron]))
        
//        hoopNode.physicsBody?.categoryBitMask = BitMaskCategory.box.rawValue
//        hoopNode.physicsBody?.collisionBitMask = BitMaskCategory.ball.rawValue
//        hoopNode.physicsBody?.contactTestBitMask = BitMaskCategory.ball.rawValue
        //
        let boxTwo = hoopNode.childNodes.first?.childNodes.last
        print(boxTwo!)
        boxTwo?.physicsBody = SCNPhysicsBody(type: .static, shape: SCNPhysicsShape(node: boxTwo!, options:
            [SCNPhysicsShape.Option.type: SCNPhysicsShape.ShapeType.concavePolyhedron]))
        
        boxTwo!.physicsBody?.categoryBitMask = BitMaskCategory.boxTwo.rawValue
//        boxTwo!.physicsBody?.collisionBitMask = 0
        boxTwo!.physicsBody?.contactTestBitMask = BitMaskCategory.ball.rawValue
        boxTwo?.name = "BoxTwo"
        
//        hoopNode.physicsBody?.categoryBitMask = BitMaskCategory.box
//        hoopNode.physicsBody?.collisionBitMask = BitMaskCategory.ball
//        hoopNode.physicsBody?.contactTestBitMask = BitMaskCategory.ball
//       
       
        
        

        
        
        
        
//        let boxTwo = hoopNode.childNodes.first?.childNodes.last!

        
//
        
        

//        let box = hoopNode.childNodes.first?.childNodes[0]
//        let material = SCNMaterial()
//        material.diffuse.contents = UIImage(named: "Hoop")
//        box!.geometry?.materials = [material]
       
        
//        hoopNode.physicsBody?.categoryBitMask = BitMaskCategory.box
//        hoopNode.physicsBody?.collisionBitMask = BitMaskCategory.ball
//        hoopNode.physicsBody?.contactTestBitMask = BitMaskCategory.ball
        
        
        
        print(#function)
        
        let node = SCNNode()
        node.addChildNode(hoopNode)
        node.simdTransform = result.worldTransform
        
        sceneView.scene.rootNode.addChildNode(node)
        
        DispatchQueue.main.async {
            self.textPlace.isHidden = true
        }
    }
    
    func createBasketball() {
        guard let frame = sceneView.session.currentFrame else { return }
        
        let ball = SCNNode(geometry: SCNSphere(radius: 0.25))
        ball.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "ball2")
        ball.opacity = 0.25
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            ball.opacity = 1
        }
        
        let transform = SCNMatrix4(frame.camera.transform)
        ball.transform = transform
        
        ball.physicsBody = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: ball, options:
            [SCNPhysicsShape.Option.collisionMargin: 0.01]))
        ball.physicsBody?.categoryBitMask = BitMaskCategory.ball.rawValue
//        ball.physicsBody?.collisionBitMask = 4
        ball.physicsBody?.contactTestBitMask = BitMaskCategory.box.rawValue
        ball.name = "NewBall"
       
        let power = Float(10)
        
        let force = SCNVector3(
            -power * transform.m31,
            -power * transform.m32,
            -power * transform.m33
        )
        
        ball.physicsBody?.applyForce(force, asImpulse: true)
        
        sceneView.scene.rootNode.addChildNode(ball)
        
    }
  
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
    
        if !hoopAdded {
            let location = sender.location(in: sceneView)
            let results = sceneView.hitTest(location, types: [.existingPlaneUsingExtent])
            
            if let result = results.first {
                addHoop(result: result)
                hoopAdded = true
            }
        } else {
            createBasketball()
            count = 0
        }
    }
}

extension ViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let anchor = anchor as? ARPlaneAnchor else { return }
        let _ = anchor
        DispatchQueue.main.async {
            self.textPlace.text = "Tap Here"
        }
    }
}

extension ViewController: SCNPhysicsContactDelegate {
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        count += 1
        print("contact")
        if count == 1 {
            score += 1
            DispatchQueue.main.async {
                
                self.scoreLabel.text = "Score: \(String(self.score))"
            }
        }
        print("")
        print(score)
        
    }
}

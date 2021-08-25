//
//  ViewController.swift
//  NairaStories
//
//  Created by Tony Nlemadim on 7/12/20.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // Set the view's delegate
        sceneView.delegate = self
        
//        let moon = SCNSphere(radius: 0.2)
//
//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01) // Create 3d Object of Box shape
//
//        let material = SCNMaterial()// Create material
//
//        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpeg")// Material is a uiimage
//
//        cube.materials = [material] // Assign that color to the material. in this case the moon texture.
//
//        let node = SCNNode()// Create a point in 3D Space
//
//        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5) // Create the position of the node in 3D axis X(Left/Right), Y(Up/Down), Z(near/far)
//
//        node.geometry = cube // Assign a shape(geometry) to the node in this case is the moon
//
//        sceneView.scene.rootNode.addChildNode(node) // add child node to root node in the 3D scene.
//
//        sceneView.autoenablesDefaultLighting = true// Add auto lighting to create 3D effect.
//
//
        // Create a new diceScene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada copy.scn")!
        
        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
            
            diceNode.position = SCNVector3(0, 0, -1)

            // Set the scene to the view
            sceneView.scene.rootNode.addChildNode(diceNode)
        }
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) { // horizontal detection method
        
        if anchor is ARPlaneAnchor {
            
            let planeAnchor = anchor as! ARPlaneAnchor
            
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            
            let planeNode = SCNNode()
            
            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            
            
            
        } else {
            
            return
        }
    }

   
    
}

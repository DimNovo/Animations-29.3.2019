//
//  ViewController.swift
//  Animations 29.3.2019
//
//  Created by Dmitry Novosyolov on 31/03/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // MARK: - ... Properties:
    var animationflag = 0
    let colors = [1 : #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), 2 : #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), 3: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), 4 : #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), 5 : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), 6 : #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), 7 : #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), 8 : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), 9 : #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), 10 : #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
    
    // MARK: - ...Outlets:
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var animationLabel: UILabel!
    
    //MARK: - ... ViewController Methods:
    override func viewDidLoad() {
        super.viewDidLoad()
        animationLabel.text = "Animation Type:"
    }
    
    // MARK: - ... IBAction / Custom Methods:
    @IBAction func animateButtonPressed(_ sender: UIButton)
    {
        switch animationflag {
        case 0:
            self.button.setTitle("", for: .normal)
            UIButton.animate(withDuration: 0.025, animations:
                {
                    let translateTransform = CGAffineTransform(translationX: -10, y: -10)
                    let translateTransform1 = CGAffineTransform(translationX: 20, y: 20)
                    let comboTransform = translateTransform.concatenating(translateTransform1)
                    sender.layer.cornerRadius = 0.0
                    sender.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                    sender.transform = comboTransform
                    
            }, completion: { finish in UIButton.animate(withDuration: 0.025, delay: 0, options: [.autoreverse],
                                                        animations: { sender.transform = CGAffineTransform.identity
                                                            print(#function,"Negative Animation")}) })
            animationLabel.text = "Negative!"
            animationflag = 1
        case 1:
            UIButton.animate(withDuration: 0.25, animations:
                {
                    let scaleTransform = CGAffineTransform(scaleX: -0.02, y: 0.02)
                    let rotateTransform = CGAffineTransform(rotationAngle: .pi / 2)
                    let comboTransform = scaleTransform.concatenating(rotateTransform)
                    sender.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
                    sender.layer.cornerRadius = 25
                    sender.transform = comboTransform
                    
            }, completion: { finish in UIButton.animate(withDuration: 0.25, delay: 0, options: [.curveLinear],
                                                        animations: { sender.transform = CGAffineTransform.identity
                                                            print(#function,"Positive Animation")}) })
            animationflag = 2
            animationLabel.text = "Positive!"
        case 2:
            UIButton.animate(withDuration: 0.25, animations:
                {
                    let rotationAngletransform = CGAffineTransform(rotationAngle: .pi / CGFloat.random(in: 0...90))
                    let translateTransform = CGAffineTransform(translationX: CGFloat.random(in: -20...20), y: CGFloat.random(in: -20...20))
                    let scaleTransform = CGAffineTransform(scaleX: CGFloat.random(in: -20...20), y: CGFloat.random(in: -20...20))
                    let comboTransform = translateTransform.concatenating(scaleTransform).concatenating(rotationAngletransform)
                    let key = Int.random(in: 1...10)
                    let radius = CGFloat.random(in: 0...50)
                    sender.layer.cornerRadius = radius
                    sender.backgroundColor = self.colors[key]
                    sender.transform = comboTransform
            }, completion: { finish in UIButton.animate(withDuration: 0.25, delay: 0, options: [.curveEaseInOut],
                                                        animations: {
                                                            let rotationAngletransform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...90))
                                                            let translateTransform = CGAffineTransform(translationX: CGFloat.random(in: -20...20), y: CGFloat.random(in: -20...20))
                                                            let scaleTransform = CGAffineTransform(scaleX: CGFloat.random(in: -20...20), y: CGFloat.random(in: -20...20))
                                                            let comboTransform = translateTransform.concatenating(scaleTransform).concatenating(rotationAngletransform)
                                                            let key = Int.random(in: 1...10)
                                                            let radius = CGFloat.random(in: 0...50)
                                                            self.button.setTitle("OK", for: .normal)
                                                            self.button.titleLabel?.font = .systemFont(ofSize: CGFloat.random(in: 25...75))
                                                            sender.layer.cornerRadius = radius
                                                            sender.backgroundColor = self.colors[key]
                                                            sender.transform = comboTransform })
                sender.transform = CGAffineTransform.identity
                print(#function,"No Defenite Type Animation")
            })
            animationflag = 0
            animationLabel.text = "No defenite type!"
        default:
            break
        }
    }
}


//
// ---------------------------- //
// Original Project: UIKitCamera
// Created on 2024-09-18 by Tim Mitra
// Mastodon: @timmitra@mastodon.social
// Twitter/X: timmitra@twitter.com
// Web site: https://www.it-guy.com
// ---------------------------- //
// Copyright © 2024 iT Guy Technologies. All rights reserved.


import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var imagePicker: ImagePicker!
    let cameraButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.gray.cgColor
        
        imageView.frame = CGRect(x: 20, y: 60, width: self.view.frame.width - 40, height: 300)
        self.view.addSubview(imageView)
        
        let buttonWidth = self.view.frame.size.width * 0.68
        let buttonHeight = self.view.frame.size.width * 0.13
        let yOrigin = self.view.frame.size.height - buttonHeight - 90
        
        cameraButton.frame = CGRect.init(x: (Double(self.view.frame.width) / 2) - buttonWidth / 2, y: yOrigin, width: buttonWidth, height: buttonHeight)
        cameraButton.backgroundColor = .systemBlue
        cameraButton.layer.cornerRadius = 10
        cameraButton.setTitle("Picture", for: UIControl.State.normal)
        cameraButton.titleLabel?.font = .systemFont(ofSize: 18,
                                                   weight: .medium)
        cameraButton.addTarget(self,
                               action: #selector(showImagePicker(_:)),
                              for: .touchUpInside)
        self.view.addSubview(cameraButton)
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }

    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
}

extension ViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview(ViewController())
    }
}

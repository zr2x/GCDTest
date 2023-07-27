//
//  SecondVC.swift
//  GCDTest
//
//  Created by Искандер Ситдиков on 22.07.2023.
//

import UIKit

class SecondVC: UIViewController {
    
    let containerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        view.backgroundColor = .lightGray
        return view
        
    }()
    
    let imageTower: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        image.contentMode = .scaleToFill
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        containerView.center = view.center
        containerView.addSubview(imageTower)
        view.backgroundColor = .systemBlue
        fetchImages2()
    }
    let url = URL(string: "https://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")
    
    func fetchImage() {
        let session = URLSession.shared
        let workItem = DispatchWorkItem {
            
        }
        let dataTask = session.dataTask(with: URLRequest(url: url!)) { data, _, _ in
            
            let queue = DispatchQueue.main
            
            queue.sync {
                sleep(2)
                if let data = data, let imagePic = UIImage(data: data) {
                    self.imageTower.image = imagePic
                }
            }
            
            workItem.cancel()
        }
        dataTask.resume()
    }
    
    func fetchImages2() {
        var data : Data?
        let queue = DispatchQueue.global()
        let workItem = DispatchWorkItem {
            data = try? Data(contentsOf: self.url!)
            //            self.imageTower.image = UIImage(data: data!)
            
        }
        queue.async(execute: workItem)
        workItem.notify(queue: DispatchQueue.main) {
            if let imageData = data {
                self.imageTower.image = UIImage(data: imageData)
            }
        }
    }
}

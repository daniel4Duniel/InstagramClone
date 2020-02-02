//
//  ViewController.swift
//  InstagramClone
//
//  Created by Daniel Inderwies on 2/1/20.
//  Copyright © 2020 Daniel Inderwies. All rights reserved.
//

import UIKit


struct CustomData {
    var title: String
    var image: UIImage
    var url: String
}



class FeedController: UIViewController {

    let collectionView2Source = CollectionView2Source.init()
    
    
    let data = [
        CustomData.init(title: "Render", image: UIImage.init(named: "Audi QA Front A")!, url: ""),
        CustomData.init(title: "Render", image: UIImage.init(named: "Audi QA Front B")!, url: ""),
        CustomData.init(title: "Render", image: UIImage.init(named: "Audi QA Front C")!, url: "")
    ]
    

    
    fileprivate let FirstCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomStoryCell.self, forCellWithReuseIdentifier: "cell")
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    fileprivate let SecondCollectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .vertical
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.register(CustomPostCell.self, forCellWithReuseIdentifier: "cell")
           cv.showsHorizontalScrollIndicator = false
           cv.showsVerticalScrollIndicator = false
           return cv
       }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        FirstCollectionView.backgroundColor = .white
//        FirstCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        FirstCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        FirstCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        FirstCollectionView.heightAnchor.constraint(equalTo: FirstCollectionView.widthAnchor, multiplier: 0.5).isActive = true
//        
        FirstCollectionView.backgroundColor = self.view.backgroundColor
        
        view.addSubview(SecondCollectionView)
        
        print("SecondCollection", SecondCollectionView.frame)
        SecondCollectionView.backgroundColor = .white
        SecondCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        SecondCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        SecondCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
         
//     SecondCollectionView.addSubview(FirstCollectionView)
        
       // SecondCollectionView.heightAnchor.constraint(equalTo: FirstCollectionView.widthAnchor, multiplier: 0.5).isActive = true
        
        SecondCollectionView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1.0).isActive = true
        
        SecondCollectionView.backgroundColor = self.view.backgroundColor
        
        SecondCollectionView.dataSource = collectionView2Source
        SecondCollectionView.delegate = collectionView2Source
        
        
        
        
        
        
        
     //   collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        FirstCollectionView.delegate = self
        FirstCollectionView.dataSource = self
        
    }


}

extension FeedController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomStoryCell
        cell.backgroundColor = collectionView.backgroundColor
        
        if self.data.count <= indexPath.row {
            
        }else {
            print("Index", indexPath.row)
           cell.data = self.data[indexPath.row]
        }
        
        
        return cell
    }

}




class CollectionView2Source: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
      
    let data = [
        CustomData.init(title: "Render", image: UIImage.init(named: "Audi QA Front A")!, url: ""),
        CustomData.init(title: "Render", image: UIImage.init(named: "Audi QA Front B")!, url: ""),
        CustomData.init(title: "Render", image: UIImage.init(named: "Audi QA Front C")!, url: "")
    ]
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 20
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomPostCell
            cell.backgroundColor = collectionView.backgroundColor
            
            if self.data.count <= indexPath.row {
                
            }else {
                print("Index", indexPath.row)
               cell.data = self.data[indexPath.row]
            }
            
            
            return cell
        }

}
    
    
    
    
    














class CustomStoryCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
        
        
    }
    
    

    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Audi QA Front B")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius =  30
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class CustomPostCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
        
        
    }
    
    

    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Audi QA Front B")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 30
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
















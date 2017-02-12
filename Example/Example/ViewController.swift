//
//  ViewController.swift
//  Example
//
//  Created by Min Kim on 2/11/17.
//  Copyright © 2017 Min Kim. All rights reserved.
//

import UIKit
import Lay

struct Item: Sizable {
    let size: CGSize
}

func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
}

class ViewController: UIViewController {
    lazy var collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    let colors: [UIColor] = [
         rgb(22, 160, 133),
         rgb(230, 126, 34),
         rgb(52, 152, 219),
         rgb(155, 89, 182),
         rgb(52, 73, 94),
         rgb(241, 196, 15),
         rgb(231, 76, 60),
         rgb(236, 240, 241),
         rgb(149, 165, 166)
    ]

    let items: [Item] = [
        Item(size: CGSize(width: 100, height: 100)),
        Item(size: CGSize(width: 80, height: 120)),
        Item(size: CGSize(width: 100, height: 100)),
        Item(size: CGSize(width: 200, height: 200)),
        Item(size: CGSize(width: 80, height: 100)),
        Item(size: CGSize(width: 100, height: 120)),
        Item(size: CGSize(width: 100, height: 80))
    ]

    var sizes: [CGSize] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.frame = view.bounds
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }

        view.addSubview(collectionView)

        sizes = items.lay_calculateSizes(for: view.bounds.size.width, preferredHeight: 180)

        print(sizes)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        collectionView.frame = view.bounds
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        sizes = items.lay_calculateSizes(for: size.width, preferredHeight: 180)

        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

        cell.contentView.backgroundColor = colors[indexPath.item % colors.count]
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.borderWidth = 1 / UIScreen.main.scale

        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizes[indexPath.item]
    }
}

//
//  SecondVC.swift
//  seminar21
//
//  Created by 천유정 on 26/10/2019.
//  Copyright © 2019 yujeong. All rights reserved.
//

import UIKit



class SecondVC: UIViewController {

    @IBOutlet weak var bannerCV: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
//data setting
        setBanner()
        bannerCV.delegate = self
        bannerCV.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        if collectionView == self.workCV {
        //            return appDelegate.workList.count
        //        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.bannerlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        if collectionView == self.workCV {
        //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCell", for: indexPath) as! WorkCell
        //
        //            let work = appDelegate.workList[indexPath.row]
        //
        //            cell.workIdx = work.workIdx
        //            cell.workImg.image = work.workMainImg
        //
        //            return cell
        //        }
        //        else {
                    let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let banner = appDelegate.bannerlist[indexPath.row]
                    bannerCell.banner?.image = banner.bannerImg
                    
                    // bannerCell.banner = bannerList.
                    return bannerCell
    //}
    }
    

}

extension SecondVC : UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
          let x = scrollView.contentOffset.x
          let w = scrollView.bounds.size.width
          let currentPage = Int(ceil(x/w))
          print(currentPage)
         // self.paging.set(progress: currentPage, animated: true)
      
      }
    
}

extension SecondVC {
    func setBanner(){
        let banner1 = Banner(bannerName: "mainImage")
        let banner2 = Banner(bannerName: "mainImage02")
        let banner3 = Banner(bannerName: "mainImage03")
        
         let delegate = UIApplication.shared.delegate as! AppDelegate
        
        delegate.bannerlist = [banner1, banner2, banner3]
    }
}

extension SecondVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let xOffset = scrollView.contentOffset.x
        
        let currentIndex = xOffset / bannerCV.frame.width
        pageControl.currentPage = Int(currentIndex)
    }
}

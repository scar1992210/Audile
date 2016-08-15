//
//  ViewController.swift
//  Audile
//
//  Created by GLOW on 8/13/16.
//  Copyright © 2016 ku. All rights reserved.
//

import UIKit
import MediaPlayer

private let animationDuration: NSTimeInterval = 0.3

private let listLayoutStaticCellHeight: CGFloat = 80
private let gridLayoutStaticCellHeight: CGFloat = 145

class ViewController: UIViewController {
    @IBOutlet weak var topbar: UIImageView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: SongSearchBar!
    @IBOutlet weak var gridButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var offButton: UIButton!
    var selectedRow: Int = 0
    var items: [DropdownItem]!
    private var tap: UITapGestureRecognizer!
    
    @IBOutlet weak var addSongButton: UIButton!
    private var songs = MusicDataProvider().generateFakeUsers()
    private var searchUsers = [Song]()
    private var isTransitionAvailable = true
    
    //menu
    @IBOutlet weak var songProgress: UIProgressView!
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var indicatorImagView: UIImageView!
    //player
    
    @IBOutlet weak var bottomView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        gridButton.setBackgroundImage(UIImage(named: "gridblue"), forState: UIControlState.Normal)
        searchUsers = songs
        setupCollectionView()
        initView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initView(){
        songProgress.transform = CGAffineTransformScale(songProgress.transform, 1, 10)
        songProgress.layer.cornerRadius = 5
        searchBar.changeSearchBarColor(UIColor.redColor())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    @IBAction func AddAction(sender: AnyObject) {
        if  self.indicatorImagView.hidden
        {
            self.indicatorImagView.hidden = false
            self.menuView.hidden = false
        } else
        {
            self.indicatorImagView.hidden = true
            self.menuView.hidden = true

        }
        
    }
    private func setupCollectionView() {
        collectionView.registerNib(SongCollectionViewCell.cellNib, forCellWithReuseIdentifier:SongCollectionViewCell.id)
        tableView.registerNib(SongTableViewCell.cellNib, forCellReuseIdentifier: SongTableViewCell.id)
    }
    @IBAction func menuButtonAction(sender: AnyObject) {
        let btn = sender as! UIButton
        menuView.hidden = true
        indicatorImagView.hidden = true
        
        // add song from device library
        if btn.tag == 3
        {
            let picker = MPMediaPickerController.init(mediaTypes: MPMediaType.Music)
            picker.delegate = self
            self.presentViewController(picker, animated: true, completion: nil)

        }

        
    }
    @IBAction func buttonTapped(sender: AnyObject) {
        let btn = sender as! UIButton
        gridButton.setBackgroundImage(UIImage(named: "grid"), forState: UIControlState.Normal)
        listButton.setBackgroundImage(UIImage(named: "list"), forState: UIControlState.Normal)
        if !isTransitionAvailable {
            return
        }
        switch btn.tag {
        case 1:
            btn.setBackgroundImage(UIImage(named: "gridblue"), forState: UIControlState.Normal)
            self.collectionView.hidden = false
            self.tableView.hidden = true
        case 2:
            btn.setBackgroundImage(UIImage(named: "listblue"), forState: UIControlState.Normal)
             self.collectionView.hidden = true
             self.tableView.hidden = false
        default:
            break
        }
        
    }
    @IBAction func tapRecognized() {
        view.endEditing(true)
    }
}
extension ViewController {
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchUsers.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(SongCollectionViewCell.id, forIndexPath: indexPath) as! SongCollectionViewCell
        cell.bind(searchUsers[indexPath.row])
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = UIScreen.mainScreen().bounds.width
        let cellWidth = (width - 40) / 3
        return CGSizeMake(cellWidth, cellWidth)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        isTransitionAvailable = false
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isTransitionAvailable = true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
extension ViewController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchUsers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SongTableViewCell.id, forIndexPath: indexPath) as! SongTableViewCell
        let cellImageLayer: CALayer? = cell.avatarImageView.layer
        cellImageLayer!.cornerRadius = 8
        cellImageLayer!.masksToBounds = true
        
        cell.bind(searchUsers[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Destructive , title: "Delete") { (action, indexPath) in
            // delete item at indexPath
        }
        
        let share = UITableViewRowAction(style: .Normal, title: "Disable") { (action, indexPath) in
            // share item at indexPath
        }
        
        share.backgroundColor = UIColor.blueColor()
        
        return [delete, share]
    }

}
extension ViewController {
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchUsers = songs
        } else {
            searchUsers = searchUsers.filter { return $0.name.containsString(searchText) }
        }
        
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView,didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Hi \(indexPath.row)")
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        view.addGestureRecognizer(tap)
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        view.removeGestureRecognizer(tap)
    }
    
    func handleTap() {
        view.endEditing(true)
        menuView.hidden = true
        indicatorImagView.hidden = true
    }
}
extension ViewController : MPMediaPickerControllerDelegate {
    // must implement these, as there is no automatic dismissal
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        print("did pick")
        let player = MPMusicPlayerController.applicationMusicPlayer()
        player.setQueueWithItemCollection(mediaItemCollection)
        player.play()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        print("cancel")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}




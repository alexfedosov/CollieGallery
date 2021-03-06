//
//  OptionsTableViewController.swift
//  CollieGallery
//
//  Created by Guilherme Munhoz on 2/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import CollieGallery

class OptionsTableViewController: UITableViewController {

    @IBOutlet weak var progressSwitch: UISwitch!
    @IBOutlet weak var zoomSwitch: UISwitch!
    @IBOutlet weak var saveSwitch: UISwitch!
    @IBOutlet weak var interactiveDismissSwitch: UISwitch!
    @IBOutlet weak var zoomScaleLabel: UILabel!
    @IBOutlet weak var preLoadedImagesLabel: UILabel!
    @IBOutlet weak var parallaxFactorLabel: UILabel!
    @IBOutlet weak var gapBetweenPagesLabel: UILabel!
    @IBOutlet weak var maxZoomScaleSlider: UISlider!
    @IBOutlet weak var preLoadedImagesSlider: UISlider!
    @IBOutlet weak var parallaxFactorSlider: UISlider!
    @IBOutlet weak var gapBetweenPagesSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.updateValues()
    }
    
    @IBAction func progressSwitchChanged(sender: UISwitch) {
        CollieGalleryOptions.sharedOptions.showProgress = sender.on
    }
    
    @IBAction func zoomSwitchChanged(sender: UISwitch) {
        CollieGalleryOptions.sharedOptions.enableZoom = sender.on
    }
    
    @IBAction func saveSwitchChanged(sender: UISwitch) {
        CollieGalleryOptions.sharedOptions.enableSave = sender.on
    }
    
    @IBAction func interactiveDismissSwitchChanged(sender: UISwitch) {
        CollieGalleryOptions.sharedOptions.enableInteractiveDismiss = sender.on
    }
    
    @IBAction func zoomScaleChanged(sender: UISlider) {
        let zoomScale = CGFloat(sender.value)
        CollieGalleryOptions.sharedOptions.maximumZoomScale = zoomScale
        self.updateZoomScaleLabel()
    }
    
    @IBAction func preLoadedImagesChanged(sender: UISlider) {
        let preLoadedImages = Int(sender.value)
        CollieGalleryOptions.sharedOptions.preLoadedImages = preLoadedImages
        self.updatePreLoadedImagesLabel()
        
    }
    
    @IBAction func parallaxFactorChanged(sender: UISlider) {
        let parallaxFactor = CGFloat(sender.value)
        CollieGalleryOptions.sharedOptions.parallaxFactor = parallaxFactor
        self.updateParallaxFactorLabel()
    }
    
    @IBAction func gapBetweenPagesChanged(sender: UISlider) {
        let gapBetweenPages = CGFloat(sender.value)
        CollieGalleryOptions.sharedOptions.gapBetweenPages = gapBetweenPages
        self.updateGapBetweenPagesLabel()
    }
    
    func updateValues() {
        self.updateMaxZoomScaleSlider()
        self.updatePreLoadedImagesSlider()
        self.updateParallaxFactorSlider()
        self.updateGapBetweenPagesSlider()
        
        self.updatePreLoadedImagesLabel()
        self.updateZoomScaleLabel()
        self.updateParallaxFactorLabel()
        self.updateGapBetweenPagesLabel()
        
        self.updateProgressSwitch()
        self.updateZoomSwitch()
        self.updateSaveSwitch()
        self.updateInteractiveDismissSwitch()
    }
    
    func updatePreLoadedImagesLabel() {
        let value = CollieGalleryOptions.sharedOptions.preLoadedImages
        self.preLoadedImagesLabel.text = "\(value)"
    }
    
    func updateZoomScaleLabel() {
        let value = Int(CollieGalleryOptions.sharedOptions.maximumZoomScale)
        self.zoomScaleLabel.text = "\(value)"
    }
    
    func updateParallaxFactorLabel() {
        let value = CollieGalleryOptions.sharedOptions.parallaxFactor
        self.parallaxFactorLabel.text = String(format: "%.2f", value)
    }
    
    func updateGapBetweenPagesLabel() {
        let value = CollieGalleryOptions.sharedOptions.gapBetweenPages
        self.gapBetweenPagesLabel.text = String(format: "%.2f", value)
    }
    
    func updateProgressSwitch() {
        self.progressSwitch.on = CollieGalleryOptions.sharedOptions.showProgress
    }
    
    func updateZoomSwitch() {
        self.zoomSwitch.on = CollieGalleryOptions.sharedOptions.enableZoom
    }
    
    func updateSaveSwitch() {
        self.saveSwitch.on = CollieGalleryOptions.sharedOptions.enableSave
    }
    
    func updateInteractiveDismissSwitch() {
        self.interactiveDismissSwitch.on = CollieGalleryOptions.sharedOptions.enableInteractiveDismiss
    }
    
    func updateMaxZoomScaleSlider() {
        self.maxZoomScaleSlider.value = Float(CollieGalleryOptions.sharedOptions.maximumZoomScale)
    }
    
    func updatePreLoadedImagesSlider() {
        self.preLoadedImagesSlider.value = Float(CollieGalleryOptions.sharedOptions.preLoadedImages)
    }
    
    func updateParallaxFactorSlider() {
        self.parallaxFactorSlider.value = Float(CollieGalleryOptions.sharedOptions.parallaxFactor)
    }
    
    func updateGapBetweenPagesSlider() {
        self.gapBetweenPagesSlider.value = Float(CollieGalleryOptions.sharedOptions.gapBetweenPages)
    }
    
    @IBAction func resetTapped(sender: UIBarButtonItem) {
        CollieGalleryOptions.sharedOptions = CollieGalleryOptions()
        updateValues()
    }
}

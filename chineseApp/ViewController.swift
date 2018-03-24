//
//  ViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/08/28.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
    
    @IBOutlet weak var section6Button: UIButton!
    @IBOutlet weak var section5Button: UIButton!
    @IBOutlet weak var section4Button: UIButton!
    @IBOutlet weak var section3Button: UIButton!
    @IBOutlet weak var section2Button: UIButton!
    @IBOutlet weak var section1Button: UIButton!
    var firstFlag = false
    var audioPlayer:AVAudioPlayer!
    
    var wordsList:[[[String]]] = [Vocabrary().list,Vocabrary().list2,Vocabrary().list3,Vocabrary().list4,Vocabrary().list5,Vocabrary().list6]
    var sectionButtonList:[UIButton]!
    var selectSection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if firstFlag == false{
            //初回起動時に書き込み
            let realm = try! Realm()
            print(Realm.Configuration.defaultConfiguration.fileURL!)

            for (index,words) in wordsList.enumerated(){
                for i in 0 ... words.count - 1{
                    let word = WordObj()
                    word.word = words[i][0]
                    word.meaning = words[i][1]
                    word.sentense = words[i][2]
                    word.pinyin = words[i][3]
                    word.sectionNumber = index
                    word.clearCount = 0
                    try! realm.write {
//                        realm.add(word)
                    }
                }
            }
            
            firstFlag = true
        }
        
        
        //section buttonの初期設定
        sectionButtonList = [section1Button,section2Button,section3Button,section4Button,section5Button,section6Button]
        for (index,button) in sectionButtonList.enumerated(){
            button.alpha = 0.7
            button.addTarget(self, action: #selector(self.sectionButtonPushed(sender:)), for: .touchUpInside)
            button.tag = index
        }
        section1Button.alpha = 1
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func sectionButtonPushed(sender:UIButton){
        for button in sectionButtonList{
            button.alpha = 0.7
        }
        sender.alpha = 1
        selectSection = sender.tag
        
        var fileName = ""
        switch sender.tag {
        case 0:
            fileName = "cat1"
        case 1:
            fileName = "cat2"
        case 2:
            fileName = "cat3"
        case 3:
            fileName = "cat4"
        case 4:
            fileName = "cat5"
        case 5:
            fileName = "cat6"
        default:
            break
        }
        let audio = Bundle.main.path(forResource: fileName, ofType: "mp3")!
        let audioUrl = URL(fileURLWithPath: audio)
        
        var audioError:NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        }catch let error as NSError{
            audioError = error
            audioPlayer = nil
        }
        
        audioPlayer.delegate = self
        audioPlayer.play()
        
        
    }

    @IBAction func goToTestSection(_ sender: Any) {
        let storyboard = UIStoryboard(name: "WordTest", bundle: nil)
        let contoller = storyboard.instantiateInitialViewController() as! WordTestViewController
        contoller.sectionNumber = selectSection
        
        self.show(contoller, sender: nil)
    }
}


//
//  VocabraryViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/08/28.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation

class VocabraryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let synthesizer = AVSpeechSynthesizer()
    let voice = AVSpeechSynthesisVoice(language: "zh-CN")
    @IBOutlet weak var wordSectionSegment: UISegmentedControl!
    
    @IBOutlet weak var myTableView: UITableView!
    var words = Vocabrary()
    
    @IBOutlet weak var wordSegment: UISegmentedControl!
    
    var unClearVocabrary:Results<WordObj>?
    var clearVocabrary:Results<WordObj>?
    var vocabrary:Results<WordObj>?
    var wordQueue:Results<WordObj>?
    var sectionSegmentNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        Realm.Configuration.defaultConfiguration = config
        
        let realm = try! Realm()
        
        unClearVocabrary = realm.objects(WordObj.self).filter("sectionNumber == \(sectionSegmentNumber) AND clearCount < 5")
        clearVocabrary = realm.objects(WordObj.self).filter("sectionNumber == \(sectionSegmentNumber) AND clearCount >= 5")
        
        vocabrary = realm.objects(WordObj.self).filter("sectionNumber == \(sectionSegmentNumber)")
        
        switch wordSegment.selectedSegmentIndex {
        case 0:
            wordQueue = vocabrary
        case 1:
            wordQueue = unClearVocabrary
        case 2:
            wordQueue = clearVocabrary
        default:
            break
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch wordSegment.selectedSegmentIndex {
        case 0:
            
            return vocabrary?.count ?? 0
        case 1:
            
            return unClearVocabrary?.count ?? 0
        case 2:
            
            return clearVocabrary?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "wordCell") as! WordTableViewCell
        if let words = wordQueue{
            cell.wordLabel.text = words[indexPath.row].word
            cell.pinyinLabel.text = words[indexPath.row].pinyin
            cell.voiceButton.addTarget(self, action: #selector(self.speechWord(sender:)), for: .touchUpInside)
            cell.voiceButton.tag = indexPath.row
            cell.sentenceLabel.text = words[indexPath.row].sentense
            
            if words[indexPath.row].clearCount == 0 && words[indexPath.row].wrongCount == 0{
                cell.correctRatioLabel.text = ""
            }else{
                let ratio = words[indexPath.row].clearCount*100/(words[indexPath.row].clearCount + words[indexPath.row].wrongCount)
                cell.correctRatioLabel.text = "正答率" + String(ratio) + "%"
            }
            
            let quizType1 = QuizType(rawValue: 0)!
            let quizType2 = QuizType(rawValue: 1)!
            let quizType3 = QuizType(rawValue: 2)!
            let quizType4 = QuizType(rawValue: 3)!
            let quizType5 = QuizType(rawValue: 4)!
            
            cell.imageView1.image = words[indexPath.row].level1Result ? quizType1.iconImage : quizType1.defultIconImage
            
            cell.imageView2.image = words[indexPath.row].level2Result ? quizType2.iconImage : quizType2.defultIconImage
            
            cell.imageView3.image = words[indexPath.row].level3Result ? quizType3.iconImage : quizType3.defultIconImage
            
            cell.imageView4.image = words[indexPath.row].level4Result ? quizType4.iconImage : quizType4.defultIconImage
            
            cell.imageView5.image = words[indexPath.row].level5Result ? quizType5.iconImage : quizType5.defultIconImage
            
            
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    @objc func speechWord(sender:UIButton){
        guard let words = unClearVocabrary else { return }
        
        let word = words[sender.tag].word
        let utterance = AVSpeechUtterance(string: word)
        utterance.voice = voice
        synthesizer.speak(utterance)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let words = wordQueue else { return }
        
        
        let word = words[indexPath.row].word
        let meaning = words[indexPath.row].meaning
        let exsentence = words[indexPath.row].sentense
        let pinyin = words[indexPath.row].pinyin
        
        let utterance = AVSpeechUtterance(string: exsentence)
        utterance.voice = voice
        synthesizer.speak(utterance)
        
        
        let alert = UIAlertController(title: word, message: pinyin + "\n\n" + "[意味]" + meaning + "\n\n" + "[例文]" + exsentence, preferredStyle: .alert)
        self.present(alert, animated: true, completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute:
                {
                    alert.dismiss(animated: true, completion: {
                        
                    })
            }
                
            )
        })
    }
    
    
    var wordKindParameter = 0
    var sectionNumber = 0
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        wordKindParameter = sender.selectedSegmentIndex
        segementChanged()
        
    }
    
    
    @IBAction func sectionSegmentChanged(_ sender: UISegmentedControl) {
        sectionNumber = sender.selectedSegmentIndex
        segementChanged()
        
    }
    
    func segementChanged(){
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        let realm = try! Realm(configuration: config)
        
        
        unClearVocabrary = realm.objects(WordObj.self).filter("sectionNumber == \(sectionNumber)")
        unClearVocabrary = unClearVocabrary?.filter("level1Result == FALSE OR level1Result == FALSE OR level2Result == FALSE OR level3Result == FALSE OR level4Result == FALSE OR level5Result == FALSE")
        clearVocabrary = realm.objects(WordObj.self).filter("sectionNumber == \(sectionNumber) AND level1Result == TRUE AND level1Result == TRUE AND level2Result == TRUE AND level3Result == TRUE AND level4Result == TRUE AND level5Result == TRUE")
        vocabrary = realm.objects(WordObj.self).filter("sectionNumber == \(sectionNumber)")
        
        switch wordKindParameter {
        case 0:
            wordQueue = vocabrary
        case 1:
            wordQueue = unClearVocabrary
        case 2:
            wordQueue = clearVocabrary
        default:
            break
        }
        myTableView.reloadData()
    }

}

//
//  ClearedViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/01.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation

class ClearedViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var myTableView: UITableView!
    let synthesizer = AVSpeechSynthesizer()
    var clearVocabrary:Results<WordObj>?
    let voice = AVSpeechSynthesisVoice(language: "zh-CN")
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearVocabrary = realm.objects(WordObj.self).filter("clearCount >= 5")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let wordList = clearVocabrary{
            return wordList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "wordCell") as! WordTableViewCell
        if let words = clearVocabrary{
            cell.wordLabel.text = words[indexPath.row].word
            cell.pinyinLabel.text = words[indexPath.row].pinyin
            cell.voiceButton.addTarget(self, action: #selector(self.speechWord(sender:)), for: .touchUpInside)
            cell.voiceButton.tag = indexPath.row
            let ratio = words[indexPath.row].clearCount*100/(words[indexPath.row].clearCount + words[indexPath.row].wrongCount)
            cell.correctRatioLabel.text = "正答率" + String(ratio) + "%"
            
//            switch words[indexPath.row].clearCount {
//            case 0:
//                cell.checkImageView.image = #imageLiteral(resourceName: "star_0")
//            case 1:
//                cell.checkImageView.image = #imageLiteral(resourceName: "star_1")
//            case 2:
//                cell.checkImageView.image = #imageLiteral(resourceName: "star_2")
//            case 3:
//                cell.checkImageView.image = #imageLiteral(resourceName: "star_3")
//            case 4:
//                cell.checkImageView.image = #imageLiteral(resourceName: "star_4")
//            case 5:
//                cell.checkImageView.image = #imageLiteral(resourceName: "star_5")
//            default:
//                break
//            }
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    @objc func speechWord(sender:UIButton){
        
        guard let words = clearVocabrary else { return }
        
        let word = words[sender.tag].word
        let utterance = AVSpeechUtterance(string: word)
        utterance.voice = voice
        synthesizer.speak(utterance)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let words = clearVocabrary else { return }
        
        
        let word = words[indexPath.row].word
        let meaning = words[indexPath.row].meaning
        let exsentence = words[indexPath.row].sentense
        let pinyin = words[indexPath.row].pinyin
        
        let utterance = AVSpeechUtterance(string: exsentence)
        utterance.voice = voice
        synthesizer.speak(utterance)
        
        let alert = UIAlertController(title: word, message: pinyin + "\n\n" + "[意味]" + meaning + "\n\n" + "[例文]" +  exsentence, preferredStyle: .alert)
        self.present(alert, animated: true, completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute:
                {
                    alert.dismiss(animated: true, completion: {

                    })
            }
                
            )
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

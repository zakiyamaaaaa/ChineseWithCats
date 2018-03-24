//
//  WordTestViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/01.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation
import Spring

class WordTestViewController: UIViewController{
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var testWordLabel: UILabel!
    @IBOutlet weak var option1Button: RoundedRectButton!
    @IBOutlet weak var option2Button: RoundedRectButton!
    @IBOutlet weak var option3Button: RoundedRectButton!
    @IBOutlet weak var option4Button: RoundedRectButton!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var unkownButton: UIButton!
    @IBOutlet weak var progressVIew: UIProgressView!
    @IBOutlet weak var pingyingLabel: UILabel!
    @IBOutlet weak var incorrectResultImageView: SpringImageView!
    @IBOutlet weak var correctResultImageView: SpringImageView!
    
    let voice = AVSpeechSynthesisVoice(language: "zh-CN")
    let synthesizer = AVSpeechSynthesizer()
    var correctAudioPlayer:AVAudioPlayer!
    var wrongAudioPlayer:AVAudioPlayer!
    
    @IBOutlet weak var sampleBar: UIView!
    @IBOutlet weak var barWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var countView: UIView!
    @IBOutlet weak var nextButton: RoundedRectButton!
    var unClearVocabrary:Results<WordObj>?
    var quizWordList = [WordObj]()
    let vocabraryList = Vocabrary().allList
    let realm = try! Realm()
    var maxNum:UInt32 = 0
    var quizList = [Int]()
    var optionWordList = [Int]()
    var numberOfQuiz = 5
    var numberOfAnswer = 0
    var answerOrder = 0
    var numberOfCorrect = 0
    var scoreResult = [Bool]()
    var sectionNumber = 0
    var levelNumber = 0
    var pointUnit = 0
    var point = 0
    var optionButtonList:[UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unClearVocabrary = WordManger().returnUnclearVocabraty(level: levelNumber, section: sectionNumber)
        progressVIew.transform = progressVIew.transform.scaledBy(x: 1, y: 5)
        
        
        unClearVocabrary?.forEach({ (item) in
            quizWordList.append(item)
        })
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        nextButton.alpha = 0.7
        
        
        if  let list = unClearVocabrary{
            maxNum = UInt32(list.count)
        }
        
        if maxNum < 10 {
            numberOfQuiz = Int(maxNum)
        }
        
        while quizList.count <  numberOfQuiz{
            let num:Int = Int(arc4random_uniform(maxNum))
            
            if quizList.contains(num) == false{
                quizList.append(num)
            }
        }
        
        optionButtonList = [option1Button,option2Button,option3Button,option4Button]
        
        for (index,button) in optionButtonList.enumerated(){
            button.addTarget(self, action: #selector(self.answerButtonPushed(sender:)), for: .touchUpInside)
            button.tag = index
            
        }
        
        
        correctResultImageView.alpha = 0
        incorrectResultImageView.alpha = 0
        correctResultImageView.animation = "fadeIn"
        incorrectResultImageView.animation = "fadeIn"
        
        optionButtonList = [option1Button,option2Button,option3Button, option4Button]
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if quizList.count == 0 {
            return
        }
        
        let quiz = QuizManager()
        
        quiz.level = levelNumber
        pointUnit = quiz.pointUnit
        bgImageView.image = QuizType(rawValue: sectionNumber)!.bgImage
        
        quizStart()
        
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func count(){
        progressVIew.progress -= 0.0005
        
        //0になったら不正解の処理
        if progressVIew.progress == 0{
            answerFinish()
            self.fail()
        }
    }
    var timer = Timer()
    
    func quizStart(){
        
        //クイズパターン
        //0.中国語→日本語の意味（単語）
        //1.日本語→中国語（単語）
        //2.ピンイン→日本語の意味
        //3.中国語の音だけ→日本語の意味
        //4.中国語例文→あてはまる単語
        
        //プログラスビューのリセット
        timer.invalidate()
        progressVIew.progress = 1
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.count), userInfo: nil, repeats: true)
        let quizWord = quizWordList[quizList.first!]
        QuizManager.shared.quizList.append(quizWord)
        
        let utterance = AVSpeechUtterance(string: quizWord.word)
        utterance.voice = voice
        switch levelNumber {
        case 0:
            
            
            testWordLabel.text = quizWord.word
            pingyingLabel.text = quizWord.pinyin
            
            //しゃべる
            
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: quizWord.meaning, answerRow: 1)
        case 1:
            
            testWordLabel.text = quizWord.meaning
            pingyingLabel.text = quizWord.pinyin
            
            setAnswer(answerNumber: quizList.first!, answerWord: quizWord.word, answerRow: 0)
        case 2:
            
            testWordLabel.text = quizWord.pinyin
            pingyingLabel.isHidden = true
            
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: quizWord.word, answerRow: 0)
        case 3:
            //音だけ
            
            testWordLabel.isHidden = true
            pingyingLabel.isHidden = true
            
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: quizWord.meaning, answerRow: 1)
        case 4:
            //文章
            
            let text = quizWord.sentense
            let target = quizWord.word
            let attrText = NSMutableAttributedString(string: text)
            let range = NSString(string: text).range(of: target)
            attrText.addAttributes([NSAttributedStringKey.foregroundColor : UIColor.clear], range: range)
            attrText.addAttributes([NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue], range: range)
            attrText.addAttributes([NSAttributedStringKey.underlineColor : UIColor.black], range: range)
            
            testWordLabel.attributedText = attrText
            pingyingLabel.isHidden = true
            let utterance = AVSpeechUtterance(string: quizWord.sentense)
            utterance.voice = voice
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: quizWord.meaning, answerRow: 1)
            
        default:
            
            testWordLabel.text = quizWord.word
            pingyingLabel.text = quizWord.pinyin
            
            //しゃべる
            
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: quizWord.meaning, answerRow: 1)
        }
    }
    
    
    
    func setAnswer(answerNumber:Int,answerWord:String,answerRow:Int){
        optionWordList = []
        while optionWordList.count < 4 {
//            let num = Int(arc4random_uniform(maxNum))
            let num = Int(arc4random_uniform(UInt32(vocabraryList.count - 1)))
            
            
            if vocabraryList[num][answerRow] != answerWord && optionWordList.contains(num) == false{
             
                optionWordList.append(num)
                
            }
            
        }
        answerOrder = Int(arc4random_uniform(4))
        optionButtonList.enumerated().forEach { (index,elemnt) in
            elemnt.setTitle(vocabraryList[optionWordList[index]][answerRow], for: .normal)
        }
        optionButtonList[answerOrder].setTitle(answerWord, for: .normal)
        
    }
    
    //回答結果のフラッグ
    var resultFlag = false
    //どれか選択肢を選んだときの処理
    @objc func answerButtonPushed(sender:UIButton){
        
        if sender.tag == answerOrder{
            correct()
            resultFlag = true
        }else{
            fail()
            resultFlag = false
        }
        writeHistory()
        answerFinish()
        
    }
    
    func answerFinish(){
        //経過時間を止める
        timer.invalidate()
        
        optionButtonList[answerOrder].setTitleColor(UIColor.red, for: .normal)
        
        quizList.removeFirst()
        numberOfAnswer += 1
        
        nextButton.isEnabled = true
        nextButton.alpha = 1
        unkownButton.isEnabled = true
        
        optionButtonList.forEach { (button) in
            button.isEnabled = false
        }
    }
    
    
    //学習履歴の書き込み
    func writeHistory(){
        let realm = try! Realm()
        let history = LearnHistory()
        let word = quizWordList[quizList.first!]
        history.meaning = word.meaning
        history.sentence = word.sentense
        history.pinyin = word.pinyin
        history.level = levelNumber
        history.word = word.word
        history.result = resultFlag
        
        
        try! realm.write {
            realm.add(history)
        }
        
    }
    
    
    //正解したときの挙動
    func correct(){
        AudioPlayer.shared.playSound(AudioPlayer.soundTitle.correct)
        correctResultImageView.animate()
        
        numberOfCorrect += 1
        point += pointUnit
        pointLabel.text = String(point)
        scoreResult.append(true)
        let word = quizWordList[quizList.first!]
        
        try! realm.write {
            word.clearCount += 1
            
            switch levelNumber {
            case 0:
                word.level1Result = true
            case 1:
                word.level2Result = true
            case 2:
                word.level3Result = true
            case 3:
                word.level4Result = true
            case 4:
                word.level5Result = true
            default:
                break
            }
        }
    }
    
    //間違ったときの挙動
    func fail(){
        AudioPlayer.shared.playSound(AudioPlayer.soundTitle.wrong)
        scoreResult.append(false)
        point -= pointUnit
        pointLabel.text = String(point)
        incorrectResultImageView.animate()
        let word = quizWordList[quizList.first!]
        try! realm.write {
            word.wrongCount += 1
            
        }
    }
    
    
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        optionButtonList.forEach { (button) in
            button.setTitleColor(UIColor.black, for: .normal)
        }
        
        UIView.animate(withDuration: 1) {
            self.correctResultImageView.alpha = 0
            self.incorrectResultImageView.alpha = 0
        }
        
        if numberOfAnswer == numberOfQuiz{
            
            //結果画面へ
            QuizManager.shared.correctNumber = numberOfCorrect
            QuizManager.shared.numberOfQuiz = numberOfQuiz
            QuizManager.shared.scoreList = scoreResult
            QuizManager.shared.score = point
            
            ScreenTransitionManager.shared.goToResult()
            
        } else if numberOfAnswer == numberOfQuiz {
            quizStart()
            nextButton.isEnabled = false
            nextButton.alpha = 0.7
            nextButton.setTitle("結果を見る", for: .normal)
            
            optionButtonList.forEach({ (button) in
                button.isEnabled = true
                button.layer.borderColor = UIColor.black.cgColor
            })
            
            
        } else{
            quizStart()
            nextButton.isEnabled = false
            nextButton.alpha = 0.7
            
            optionButtonList.forEach({ (button) in
                button.isEnabled = true
                button.layer.borderColor = UIColor.black.cgColor
            })
        }
    }

    @IBAction func unknownButtonPushed(_ sender: Any) {
        fail()
        answerFinish()
    }

}

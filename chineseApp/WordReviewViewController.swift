//
//  WordReviewViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/30.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//
import AVFoundation
import UIKit
import RealmSwift
import Spring

class WordReviewViewController: UIViewController {

    
    @IBOutlet weak var quizNumberLabel: UILabel!
    let voice = AVSpeechSynthesisVoice(language: "zh-CN")
    let synthesizer = AVSpeechSynthesizer()
    @IBOutlet weak var optionButton1: RoundedRectButton!
    @IBOutlet weak var optionButton2: RoundedRectButton!
    @IBOutlet weak var optionButton3: RoundedRectButton!
    @IBOutlet weak var optionButton4: RoundedRectButton!
    @IBOutlet weak var unknownButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var testWordLabel: UILabel!
    var optionWordList = [Int]()
    var reviewWords:Results<LearnHistory>!
    var vocabraryList = Vocabrary().allList
    var optionButtonList:[RoundedRectButton]!
    var quizList = [Int]()
    var scoreList = [Bool]()
    var numberOfAnswer = 0
    var numberOfQuiz = 0
//    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var nextButton: RoundedRectButton!
    @IBOutlet weak var pinyinLabel: UILabel!
    @IBOutlet weak var resultImageView: SpringImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionButtonList = [optionButton1,optionButton2,optionButton3,optionButton4]
        for (index,button) in optionButtonList.enumerated(){
            button.addTarget(self, action: #selector(self.buttonSelected(sender:)), for: .touchUpInside)
            button.tag = index
        }

        resultImageView.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //クイズの順番
        //ここでは順番に設定
        for i in 0 ..< reviewWords.count{
            quizList.append(i)
        }
        numberOfQuiz = reviewWords.count
        quizStart(reviewWord: reviewWords[quizList.first!])
        
    }
    
    func quizStart(reviewWord:LearnHistory){
        //プログラスビューのリセット
        quizNumberLabel.text = "\(numberOfAnswer + 1)/\(numberOfQuiz)"
        timer.invalidate()
        progressView.progress = 1
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.count), userInfo: nil, repeats: true)
        QuizManager.shared.reviewList.append(reviewWord)
        
        switch reviewWord.level {
        case 0:
            
            testWordLabel.text = reviewWord.word
            pinyinLabel.text = reviewWord.pinyin
            
            //しゃべる
            let utterance = AVSpeechUtterance(string: reviewWord.word)
            utterance.voice = voice
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: reviewWord.meaning, answerRow: 1)
            
        case 1:
            
            testWordLabel.text = reviewWord.meaning
            pinyinLabel.text = reviewWord.pinyin
            
            setAnswer(answerNumber: quizList.first!, answerWord: reviewWord.word, answerRow: 0)
        case 2:
            
            
            testWordLabel.text = reviewWord.pinyin
            pinyinLabel.isHidden = true
            let utterance = AVSpeechUtterance(string: reviewWord.word)
            utterance.voice = voice
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: reviewWord.word, answerRow: 0)
            
        case 3:
            //音だけ
            
            
            testWordLabel.isHidden = true
            pinyinLabel.isHidden = true
            let utterance = AVSpeechUtterance(string: reviewWord.word)
            utterance.voice = voice
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: reviewWord.meaning, answerRow: 1)
        case 4:
            //文章
            
            let text = reviewWord.sentence
            let target = reviewWord.word
            let attrText = NSMutableAttributedString(string: text)
            let range = NSString(string: text).range(of: target)
            attrText.addAttributes([NSAttributedStringKey.foregroundColor : UIColor.clear], range: range)
            attrText.addAttributes([NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue], range: range)
            attrText.addAttributes([NSAttributedStringKey.underlineColor : UIColor.black], range: range)
            
            testWordLabel.attributedText = attrText
            pinyinLabel.isHidden = true
            let utterance = AVSpeechUtterance(string: reviewWord.sentence)
            utterance.voice = voice
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: reviewWord.meaning, answerRow: 1)
            
        default:
            
            testWordLabel.text = reviewWord.word
            pinyinLabel.text = reviewWord.pinyin
            
            //しゃべる
            let utterance = AVSpeechUtterance(string: reviewWord.word)
            utterance.voice = voice
            synthesizer.speak(utterance)
            setAnswer(answerNumber: quizList.first!, answerWord: reviewWord.meaning, answerRow: 1)
        }
        
    }
    
    var resultFlag = false
    var answerOrder = 0
    
    func setAnswer(answerNumber:Int,answerWord:String,answerRow:Int){
        optionWordList = []
        while optionWordList.count < 4 {
            //            let num = Int(arc4random_uniform(maxNum))
            let num = Int(arc4random_uniform(UInt32(vocabraryList.count - 1)))
            
            
            if vocabraryList[num][answerRow] != answerWord && optionWordList.contains(num) == false{
                
                optionWordList.append(num)
                
            }
            
        }
        
        
        optionButton1.setTitle(vocabraryList[optionWordList[0]][answerRow], for: .normal)
        optionButton2.setTitle(vocabraryList[optionWordList[1]][answerRow], for: .normal)
        optionButton3.setTitle(vocabraryList[optionWordList[2]][answerRow], for: .normal)
        optionButton4.setTitle(vocabraryList[optionWordList[3]][answerRow], for: .normal)
        
        answerOrder = Int(arc4random_uniform(4))
        switch answerOrder {
        case 0:
            optionButton1.setTitle(answerWord, for: .normal)
        case 1:
            optionButton2.setTitle(answerWord, for: .normal)
        case 2:
            optionButton3.setTitle(answerWord, for: .normal)
        case 3:
            optionButton4.setTitle(answerWord, for: .normal)
        default:
            break
        }
        
        
    }
    
    @objc func count(){
        progressView.progress -= 0.0005
        
        //0になったら不正解の処理
        if progressView.progress == 0{
            answerFinish()
            self.fail()
        }
    }
    var timer = Timer()

    func answerFinish(){
        //経過時間を止める
        timer.invalidate()
        
        self.resultImageView.alpha = 1
        resultImageView.animation = "fadeIn"
        resultImageView.animate()
        
        
//        UIView.animate(withDuration: 1) {
//            self.resultImageView.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
//        }
        switch answerOrder {
        case 0:
            optionButton1.layer.borderColor = UIColor.red.cgColor
        case 1:
            optionButton2.layer.borderColor = UIColor.red.cgColor
        case 2:
            optionButton3.layer.borderColor = UIColor.red.cgColor
        case 3:
            optionButton4.layer.borderColor = UIColor.red.cgColor
        default:
            break
        }
        
        quizList.removeFirst()
        numberOfAnswer += 1
        
        nextButton.isEnabled = true
        nextButton.alpha = 1
        unknownButton.isEnabled = false
        
        optionButtonList.forEach { (button) in
            button.isEnabled = false
        }
    }
    
    //正解したときの挙動
    func correct(){
        AudioPlayer.shared.playSound(AudioPlayer.soundTitle.correct)
        resultImageView.image = #imageLiteral(resourceName: "good_cat")
        
        QuizManager.shared.scoreList.append(true)
        scoreList.append(true)
    }
    
    //間違ったときの挙動
    func fail(){
        AudioPlayer.shared.playSound(AudioPlayer.soundTitle.wrong)
        QuizManager.shared.scoreList.append(false)
        scoreList.append(false)
        resultImageView.image = #imageLiteral(resourceName: "bad_cat")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPushed(_ sender: Any) {
        testWordLabel.isHidden = false
        pinyinLabel.isHidden = false
        
        UIView.animate(withDuration: 1) {
            self.resultImageView.alpha = 0
        }
        
        
        self.resultImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        if numberOfAnswer == numberOfQuiz{
            
            //結果画面へ
            ScreenTransitionManager.shared.goToReviewResult(words: reviewWords, scoreList: scoreList)
            
        }else{
            
            if numberOfAnswer == numberOfQuiz - 1{
                nextButton.setTitle("結果画面へ", for: .normal)
            }
            
            quizStart(reviewWord: reviewWords[quizList.first!])
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
    
    @objc func buttonSelected(sender:UIButton){
        if sender.tag == answerOrder{
            correct()
            resultFlag = true
        }else{
            fail()
            resultFlag = false
        }
        answerFinish()
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

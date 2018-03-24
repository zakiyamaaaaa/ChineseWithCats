//
//  AudioPlayer.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/09/30.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer:NSObject,AVAudioPlayerDelegate{
    
    static let shared = AudioPlayer()
    
    var audioPlayer:AVAudioPlayer?
    
    enum soundTitle:String{
        case correct
        case wrong
    }
    
    func playSound(_ name:soundTitle){
        
        let audioPath = Bundle.main.path(forResource: name.rawValue, ofType: "mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        var audioError:NSError?
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl, fileTypeHint: AVFileType.mp3.rawValue)
        }catch let error as NSError{
            audioError = error
            audioPlayer = nil
        }
        
        if let error = audioError{
            print(error.localizedDescription)
        }
        
        audioPlayer?.prepareToPlay()
        audioPlayer?.delegate = self
        audioPlayer?.play()
        
    }
    
    
}

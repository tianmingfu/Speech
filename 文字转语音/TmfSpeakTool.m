//
//  TmfSpeakTool.m
//  文字转语音
//
//  Created by 大虾咪 on 2017/7/7.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import "TmfSpeakTool.h"
#import <AVFoundation/AVFoundation.h>
@interface TmfSpeakTool ()<AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) AVSpeechSynthesizer *aVSpeechSynthesizer;


//@property(nonatomic)float pitchMultiplier;// [0.5 - 2] Default = 1，声调，不怕逗死你就设成2
@end
@implementation TmfSpeakTool

- (AVSpeechSynthesizer *)aVSpeechSynthesizer{
    if (!_aVSpeechSynthesizer) {
        _aVSpeechSynthesizer = [[AVSpeechSynthesizer alloc] init];
        _aVSpeechSynthesizer.delegate = self;
    }
    return _aVSpeechSynthesizer;
}

- (void)pauseAv{
    

    if (self.aVSpeechSynthesizer.paused) {
        [self.aVSpeechSynthesizer continueSpeaking];
    }else{
    [self.aVSpeechSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}

- (void)transtoVoiceWithString:(NSString *)str{
    
    //    注意：三个关键类
    //
    //AVSpeechSynthesizer: 可以假想成一个可以说话的人
    //AVSpeechSynthesisVoice: 可以假想成人的声音
    //AVSpeechUtterance: 可以假想成要说的一段话
    if (self.aVSpeechSynthesizer.speaking) 
        return;
    AVSpeechUtterance * aVSpeechUtterance = [[AVSpeechUtterance alloc] initWithString:str];
    
    aVSpeechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate;// 设置语速，范围0-1，注意0最慢，1最快；
    
    aVSpeechUtterance.voice =[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//设置发音，这是中文普通话
    
    [self.aVSpeechSynthesizer speakUtterance:aVSpeechUtterance];//开始阅读

}
#pragma mark - =========AVSpeechSynthesizerDelegate =========
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@"开始阅读");

}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    [self.aVSpeechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    NSLog(@"阅读完毕");
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance{
    
    NSLog(@"阅读暂停");

}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance{
    
    NSLog(@"阅读继续");

}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance{
    
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance{
    
    
}
@end


//
//  TmfSpeakTool.h
//  文字转语音
//
//  Created by 大虾咪 on 2017/7/7.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TmfSpeakTool : NSObject

- (void)transtoVoiceWithString:(NSString *)str;
- (void)pauseAv;

@end

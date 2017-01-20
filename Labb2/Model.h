//
//  Model.h
//  Labb2
//
//  Created by Fredrik Börjesson on 17/01/17.
//  Copyright © 2017 Fredrik Börjesson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

-(NSString*)getQuestion;
-(BOOL)checkCorrectAnswer:(NSString*)answer;
-(void)setupData;
-(NSArray*)getRandomAnswers;
@property (nonatomic) int correctAnswers;
@property (nonatomic) int answeredquestions;


@end

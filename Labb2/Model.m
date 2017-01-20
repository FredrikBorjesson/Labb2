//
//  Model.m
//  Labb2
//
//  Created by Fredrik Börjesson on 17/01/17.
//  Copyright © 2017 Fredrik Börjesson. All rights reserved.
//

#import "Model.h"

@interface Model()

@property (nonatomic) NSMutableArray *questionArray;
@property (nonatomic) NSDictionary *currentQuestion;

@end

@implementation Model


-(void)setupData {
    self.correctAnswers = 0;
    self.answeredquestions = 0;
    NSDictionary *question1 = @{@"question": @"Hur många kromosom par har vi i våra celler?",
                       @"correctAnswer": @"23",
                       @"wrongAnswer1": @"64",
                       @"wrongAnswer2": @"42",
                       @"wrongAnswer3": @"15"};
    NSDictionary *question2 = @{@"question": @"Namnet Ran förekommer i nordisk mytologi. Vad var Ran för något?",
                       @"correctAnswer": @"En gudinna",
                       @"wrongAnswer1": @"Ett troll",
                       @"wrongAnswer2": @"En människa",
                       @"wrongAnswer3": @"En gud"};
    NSDictionary *question3 = @{@"question": @"Vilket träslag är glasspinnen gjord av?",
                  @"correctAnswer": @"Bok",
                  @"wrongAnswer1": @"Alm",
                  @"wrongAnswer2": @"Björk",
                  @"wrongAnswer3": @"Al"};
    NSDictionary *question4 = @{@"question": @"Viket år anföll Japan Pearl Harbour?",
                  @"correctAnswer": @"1941",
                  @"wrongAnswer1": @"1945",
                  @"wrongAnswer2": @"1942",
                  @"wrongAnswer3": @"1943"};
    NSDictionary *question5 = @{@"question": @"Vad betyder order demokrati?",
                 @"correctAnswer": @"Folkstyre",
                 @"wrongAnswer1": @"Rättvisa",
                 @"wrongAnswer2": @"Folkbildning",
                 @"wrongAnswer3": @"Orättvisa"};
    NSDictionary *question6 = @{@"question": @"Vad heter Nordkoreas nuvarande ledare?",
                 @"correctAnswer": @"Kim Jong-un",
                 @"wrongAnswer1": @"Tim Long Li",
                 @"wrongAnswer2": @"Kim Peng",
                 @"wrongAnswer3": @"Slim Shady"};
    NSDictionary *question7 = @{@"question": @"Vem var formgivaren bakom den klassiska fåtöljen Ägget?",
                 @"correctAnswer": @"Arne Jacobsen",
                 @"wrongAnswer1": @"Marcello Siard",
                 @"wrongAnswer2": @"Lena Larsson",
                 @"wrongAnswer3": @"Carl Malmsten"};
    NSDictionary *question8 = @{@"question": @"Hur långt var fartyget Titanic?",
                 @"correctAnswer": @"269m",
                 @"wrongAnswer1": @"294m",
                 @"wrongAnswer2": @"189m",
                 @"wrongAnswer3": @"235m"};
    NSDictionary *question9 = @{@"question": @"Vilken släkt kom Gustav Vasas mamma ifrån?",
                 @"correctAnswer": @"Eka",
                 @"wrongAnswer1": @"Sture",
                 @"wrongAnswer2": @"Gren",
                 @"wrongAnswer3": @"Sparre"};
    NSDictionary *question10 = @{@"question": @"Vilket år tillträde John F Kennedy som USAs president?",
                 @"correctAnswer": @"1961",
                 @"wrongAnswer1": @"1960",
                 @"wrongAnswer2": @"1955",
                 @"wrongAnswer3": @"1949"};
    NSString *s = [question1 objectForKey:@"wrongAnswer1"];
    NSLog(@"%@", s);
    self.questionArray = [NSMutableArray arrayWithObjects:question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, nil];
}



-(NSString*)getQuestion{
    int arrayIndex = arc4random() % self.questionArray.count;
    self.currentQuestion = self.questionArray[arrayIndex];
    [self.questionArray removeObjectAtIndex:arrayIndex];
    return [self.currentQuestion objectForKey:@"question"];
}

-(BOOL)checkCorrectAnswer:(NSString*)answer{
    self.answeredquestions++;
    NSLog(@"%d", self.answeredquestions);
    if([answer isEqualToString:[self.currentQuestion objectForKey:@"correctAnswer"]]){
        self.correctAnswers++;
        NSLog(@"%d", self.correctAnswers);
        return YES;
    }else{
        return NO;
    }
}

-(NSArray*)getRandomAnswers{
    NSMutableArray *keyArray = [NSMutableArray arrayWithObjects:
                                self.currentQuestion[@"correctAnswer"],
                                self.currentQuestion[@"wrongAnswer1"],
                                self.currentQuestion[@"wrongAnswer2"],
                                self.currentQuestion[@"wrongAnswer3"], nil];
    
    for (int i = 0; i < keyArray.count; i++)
    {
        [keyArray exchangeObjectAtIndex:arc4random() % keyArray.count withObjectAtIndex:arc4random() % keyArray.count];
    }
    return keyArray;
}


@end

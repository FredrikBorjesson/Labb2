//
//  ViewController.m
//  Labb2
//
//  Created by Fredrik Börjesson on 17/01/17.
//  Copyright © 2017 Fredrik Börjesson. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *startView;
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (weak, nonatomic) IBOutlet UIView *endView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet UITextView *questionView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UITextView *resultView;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (nonatomic) NSArray *questionArray;
@property (nonatomic) Model *model;
@property (nonatomic) NSDictionary *currentQuestion;

@end

@implementation ViewController

-(void)setWholeQuestion{
    [self.questionView setText:[self.model getQuestion]];
    NSArray *answerArray = [self.model getRandomAnswers];
    [self.button1 setTitle:answerArray[0] forState:UIControlStateNormal];
    [self.button2 setTitle:answerArray[1] forState:UIControlStateNormal];
    [self.button3 setTitle:answerArray[2] forState:UIControlStateNormal];
    [self.button4 setTitle:answerArray[3] forState:UIControlStateNormal];
}

-(void)newGame{
    [self.model setupData];
    [self showGameView];
    [self setWholeQuestion];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self styleContent];
    self.model = [[Model alloc] init];
    [self showStartView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)newGamePressed:(UIButton*)sender {
    [self newGame];
}

- (IBAction)buttonPressed:(UIButton*)sender {
    if(self.model.answeredquestions == 4){
        [self gamefinished];
    }
    if([self.model checkCorrectAnswer:sender.titleLabel.text]){
        [self setGreenButton:sender];
    } else{
        [self setRedButton:sender];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showStartView{
    self.startView.hidden = NO;
    self.gameView.hidden = YES;
    self.endView.hidden = YES;
}

-(void)showGameView{
    self.startView.hidden = YES;
    self.gameView.hidden = NO;
    self.endView.hidden = YES;
}

- (void)showEndView{
    self.startView.hidden = YES;
    self.gameView.hidden = YES;
    self.endView.hidden = NO;
}

-(void)gamefinished{
    [self showEndView];
    self.resultView.text = [NSString stringWithFormat:@"Rätta svar: %d", self.model.correctAnswers];
    
}



-(void)setGreenButton:(UIButton*)sender {
    [sender setBackgroundColor:[UIColor greenColor]];
    [self pause];
    //sender.backgroundColor = [UIColor colorWithRed:3/255.0 green:169/255.0 blue:244/255.0 alpha:1.0];
}

-(void)setRedButton:(UIButton*) sender{
    [sender setBackgroundColor:[UIColor redColor]];
    [self pause];
    //sender.backgroundColor = [UIColor colorWithRed:3/255.0 green:169/255.0 blue:244/255.0 alpha:1.0];
}

-(void)pause{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setWholeQuestion) userInfo:Nil repeats:NO];
}


-(void)styleContent{
    self.button1.layer.cornerRadius = 10;
    self.button2.layer.cornerRadius = 10;
    self.button3.layer.cornerRadius = 10;
    self.button4.layer.cornerRadius = 10;
    self.restartButton.layer.cornerRadius = 10;
    self.startButton.layer.cornerRadius = 10;
}

-(void)clearView{
    self.questionView.text = @"";
    [self.button1 setTitle:@"" forState:UIControlStateNormal];
    [self.button2 setTitle:@"" forState:UIControlStateNormal];
    [self.button3 setTitle:@"" forState:UIControlStateNormal];
    [self.button4 setTitle:@"" forState:UIControlStateNormal];
}


@end

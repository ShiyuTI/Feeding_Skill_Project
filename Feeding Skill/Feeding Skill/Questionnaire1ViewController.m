//
//  Questionnaire1ViewController.m
//  Feeding Skill
//
//  Created by Tian Shiyu on 9/30/20.
//

#import "Questionnaire1ViewController.h"

@interface Questionnaire1ViewController ()

@end

@implementation Questionnaire1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.q1A1Btn addTarget:self action:@selector(q1A1BtnAct) forControlEvents:UIControlEventTouchUpInside];
    [self.q1A2Btn addTarget:self action:@selector(q1A2BtnAct) forControlEvents:UIControlEventTouchUpInside];
    [self.nextBtn addTarget:self action:@selector(nextBtnAct) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - Button
- (void)q1A1BtnAct {
    [self.q1A1Btn setImage:[UIImage systemImageNamed:@"dot.circle.fill"] forState:UIControlStateNormal];
    [self.q1A2Btn setImage:[UIImage systemImageNamed:@"dot.circle"] forState:UIControlStateNormal];
}

- (void)q1A2BtnAct {
    [self.q1A2Btn setImage:[UIImage systemImageNamed:@"dot.circle.fill"] forState:UIControlStateNormal];
    [self.q1A1Btn setImage:[UIImage systemImageNamed:@"dot.circle"] forState:UIControlStateNormal];
}

- (void)nextBtnAct {
    if(counter1==0){
        [self resetDot];
        self.question1Text.text =@"2. Are you willing to aid our research by providing some personal information?";
        counter1=1;
        [self.nextBtn setTitle:@"Done" forState:UIControlStateNormal];
    }
    else if (counter1 ==1){
        [self performSegueWithIdentifier:@"toTab" sender:self];
    }
    
}

- (void)resetDot {
    [self.q1A2Btn setImage:[UIImage systemImageNamed:@"dot.circle"] forState:UIControlStateNormal];
    [self.q1A1Btn setImage:[UIImage systemImageNamed:@"dot.circle"] forState:UIControlStateNormal];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

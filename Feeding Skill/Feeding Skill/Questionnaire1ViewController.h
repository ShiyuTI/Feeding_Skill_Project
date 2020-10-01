//
//  Questionnaire1ViewController.h
//  Feeding Skill
//
//  Created by Tian Shiyu on 9/30/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Questionnaire1ViewController : UIViewController{
    int counter1;
}
@property (weak, nonatomic) IBOutlet UILabel *question1Text;
@property (weak, nonatomic) IBOutlet UIButton *q1A1Btn;
@property (weak, nonatomic) IBOutlet UILabel *q1A1Text;
@property (weak, nonatomic) IBOutlet UIButton *q1A2Btn;
@property (weak, nonatomic) IBOutlet UILabel *q1A2Text;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

NS_ASSUME_NONNULL_END

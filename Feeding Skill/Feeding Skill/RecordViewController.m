//
//  RecordViewController.m
//  Feeding Skill
//
//  Created by Tian Shiyu on 9/30/20.
//

#import "RecordViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface RecordViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    NSURL *mediaUrl;
}
@property (strong,nonatomic)UIImagePickerController *imagePickerCon;
@property (strong,nonatomic)AVPlayerViewController *player;

@end

@implementation RecordViewController

- (UIImagePickerController *)imagePickerCon{
    if(!_imagePickerCon){
        _imagePickerCon = [[UIImagePickerController alloc]init];
        _imagePickerCon.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imagePickerCon.mediaTypes = [NSArray arrayWithObject:(__bridge NSString*)kUTTypeMovie];
        _imagePickerCon.videoQuality = UIImagePickerControllerQualityTypeHigh;
        _imagePickerCon.delegate = self;
        _imagePickerCon.showsCameraControls = YES;
        _imagePickerCon.cameraFlashMode = -1;
        if (@available(iOS 11.0, *)) {
            _imagePickerCon.videoExportPreset = AVAssetExportPreset1280x720;
            } else {
                _imagePickerCon.videoQuality = UIImagePickerControllerQualityType640x480;
            }
    }
    return _imagePickerCon;
}

- (AVPlayerViewController *)player{
    if(!_player){
        _player = [[AVPlayerViewController alloc]init];
        _player.player = [[AVPlayer alloc]initWithURL:mediaUrl];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.recordBtn addTarget:self action:@selector(recordBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    [self.playBtn addTarget:self action:@selector(playBtnAct:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)recordBtnAct:(UIButton *) button{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [self presentViewController:self.imagePickerCon animated:YES completion:nil];
    }
}

- (void)playBtnAct:(UIButton *) button{
    _player.player = [[AVPlayer alloc]initWithURL:mediaUrl];
    [self presentViewController:self.player animated:YES completion:nil];
    [self.player.player play];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info{
    NSString *type = info[UIImagePickerControllerMediaType];
    if([type isEqualToString:(__bridge NSString *)kUTTypeMovie]){
        mediaUrl = info[UIImagePickerControllerMediaURL];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
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

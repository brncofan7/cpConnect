//
//  cpcCastDetailViewController.m
//  cpConnect
//
//  Created by Daniel Wright on 9/24/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import "cpcCastDetailViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface cpcCastDetailViewController ()
{
    AVPlayer *player;
    AVAudioPlayer *avPlayer;
    UIBarButtonItem *playButton;
}

@property (strong, nonatomic) MPMoviePlayerController *streamPlayer;

@end

@implementation cpcCastDetailViewController

@synthesize file;
@synthesize detailImage;
//@synthesize myProgressView;
//@synthesize lblMsgTitle;
@synthesize msgTitle;
@synthesize lblDate;
@synthesize msgDate;
@synthesize lblSpeaker;
@synthesize msgSpeaker;

//NEW 9-29-13
@synthesize songName;
@synthesize durationOutlet;
//@synthesize sliderVolumeOutlet;
@synthesize sliderOutlet;
@synthesize togglePlayPause;

//@synthesize streamPlayer = _streamPlayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //lblMsgTitle.text = msgTitle;
    lblDate.text = msgDate;
    lblSpeaker.text = msgSpeaker;
    
    //NEW CODE 9-29-13
    songName.text = msgTitle;

    //NSLog(@"%@",file);

    NSURL *url = [NSURL URLWithString:file];
    
    player = [[AVPlayer alloc] initWithURL:url];
    //[player setVolume:self.sliderVolumeOutlet.value];
    //[NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updatemyProgress:) userInfo:Nil repeats:YES];
    
    //NEW CODE 9-29-13
    //AVPlayerItem * currentItem = [AVPlayerItem playerItemWithURL:url];
    //[self.sliderOutlet setMaximumValue:self->player.currentItem.duration.value/self->player.currentItem.duration.timescale];
    //6
    self.sliderOutlet.maximumValue = 0;
    [self configurePlayer];
}

//- (void)syncUI {
//    if ((self->player.currentItem != nil) &&
//        ([self->player.currentItem status] == AVPlayerItemStatusReadyToPlay)) {
//        playButton.enabled = YES;
//    }
//    else {
//        playButton.enabled = NO;
//    }
//}

//- (void)updatemyProgress:(NSTimer *)timer
//{
    
    //float progress = player.currentTime.value/player.currentItem.asset.duration.value;
    //self.myProgressView.progress = [player.currentTime.value];
    //self.myProgressView.progress = progress;
    //self.myProgressView.progress = [player.currentTime.value]/[player.currentItem.duration.value];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self->player pause];
    player = nil;
}

//- (IBAction)sliderVolumeAction:(id)sender {
    //UISlider *mySlider = sender;
    //[avPlayer setVolume:mySlider.value];
//    [player setVolume:self.sliderVolumeOutlet.value];
//}

//- (IBAction)stopButton:(id)sender {
    //[avPlayer stop];
    //[avPlayer setCurrentTime:0];
//}


//- (IBAction)playButton:(id)sender {
    //[avPlayer play];
    //[player play];
//    if (player.rate == 1.0) {
        //[sender setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        //[self.streamPlayer pause];
//        [sender setImage:[UIImage imageNamed:@"play2_32.png"]];
//        [player pause];
//    } else {
        //[sender setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        //[self.streamPlayer play];
//        [sender setImage:[UIImage imageNamed:@"pause2_32.png"]];
//        [player play];
//    }
//}


//NEW CODE 9-29-13
- (IBAction)togglePlayPauseTapped:(id)sender {
    if(self.togglePlayPause.selected) {
        [self->player pause];
        [self.togglePlayPause setSelected:NO];
    } else {
        [self->player play];
        [self.togglePlayPause setSelected:YES];
    }
    
}
- (IBAction)sliderDragged:(id)sender {
    [self->player seekToTime:CMTimeMakeWithSeconds((int)(self.sliderOutlet.value) , 1)];
}

-(void) configurePlayer {
    //7
    __block cpcCastDetailViewController * weakSelf = self;
    //8
    //[self.sliderOutlet setMaximumValue:self->player.currentItem.duration.value/self->player.currentItem.duration.timescale];
    [self->player addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1, 1)
                                                   queue:NULL
                                              usingBlock:^(CMTime time) {
                                                  if(!time.value) {
                                                      return;
                                                  }
                                                  
                                                  
                                                  
                                                  int currentTime = (int)((weakSelf->player.currentTime.value)/weakSelf->player.currentTime.timescale);
                                                  int currentMins = (int)(currentTime/60);
                                                  int currentSec  = (int)(currentTime%60);
                                                  
                                                  
                                                  weakSelf.sliderOutlet.maximumValue = weakSelf->player.currentItem.duration.value/weakSelf->player.currentItem.duration.timescale;
                                                  NSString * durationLabel =
                                                  [NSString stringWithFormat:@"%02d:%02d",currentMins,currentSec];
                                                  weakSelf.durationOutlet.text = durationLabel;
                                                  weakSelf.sliderOutlet.value = currentTime;
                                              }];
    
}

@end
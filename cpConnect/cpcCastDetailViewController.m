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
@synthesize msgTitle;
@synthesize lblDate;
@synthesize msgDate;
@synthesize lblSpeaker;
@synthesize msgSpeaker;

//NEW 9-29-13
@synthesize songName;
@synthesize durationOutlet;
@synthesize sliderOutlet;
@synthesize togglePlayPause;

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
    lblDate.text = msgDate;
    lblSpeaker.text = msgSpeaker;
    
    //NEW CODE 9-29-13
    songName.text = msgTitle;
    
    //NSLog(@"%@",file);
    
    NSURL *url = [NSURL URLWithString:file];
    
    player = [[AVPlayer alloc] initWithURL:url];
    NSArray *keys = [NSArray arrayWithObjects:MPMediaItemPropertyAlbumTitle, MPMediaItemPropertyArtist, MPMediaItemPropertyTitle, nil];
    NSArray *values = [NSArray arrayWithObjects:@"Center Point Church", msgSpeaker, msgTitle, nil];
    NSDictionary *mediaInfo = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:mediaInfo];
    //6
    self.sliderOutlet.maximumValue = 0;
    [self configurePlayer];
    
    // NEW CODE 10-14-2013
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //Once the view has loaded then we can register to begin recieving controls and we can become the first responder
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //End recieving events
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
}

//- (void)viewWillDisappear:(BOOL)animated
//{
    //[self->player pause];
    //player = nil;
//}

//Make sure we can recieve remote control events
- (BOOL)canBecomeFirstResponder {
    return YES;
}
- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
    //if it is a remote control event handle it correctly
    if (event.type == UIEventTypeRemoteControl) {
        if (event.subtype == UIEventSubtypeRemoteControlPlay) {
            [self->player play];
        } else if (event.subtype == UIEventSubtypeRemoteControlPause) {
            [self->player pause];
        } else if (event.subtype == UIEventSubtypeRemoteControlTogglePlayPause) {
            //[self togglePlayPause];
            if(self.togglePlayPause.selected) {
                [self->player pause];
                [self.togglePlayPause setSelected:NO];
            } else {
                [self->player play];
                [self.togglePlayPause setSelected:YES];
            }
        }
    }
}

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
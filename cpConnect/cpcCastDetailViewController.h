//
//  cpcCastDetailViewController.h
//  cpConnect
//
//  Created by Daniel Wright on 9/24/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <AudioToolbox/AudioToolbox.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>

@interface cpcCastDetailViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;
//@property (weak, nonatomic) IBOutlet UISlider *sliderVolumeOutlet;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *stopButton;

//Changed from retain to strong 9-29-13
@property (nonatomic, strong) PFFile *file;

//Changed from retain to strong 9-29-13
@property (nonatomic, strong) PFImageView *detailImage;

//@property (strong, nonatomic) IBOutlet UILabel *lblMsgTitle;

//Changed from strong to weak 9-29-13
@property (nonatomic, weak) NSString *msgTitle;

//Changed from strong to weak 9-29-13
@property (weak, nonatomic) IBOutlet UILabel *lblSpeaker;

@property (nonatomic, strong) NSString *msgSpeaker;

//Changed from strong to weak 9-29-13
@property (weak, nonatomic) IBOutlet UILabel *lblDate;

//Changed from strong to weak 9-29-13
@property (weak, nonatomic) NSString *msgDate;

@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UILabel *durationOutlet;
@property (weak, nonatomic) IBOutlet UISlider *sliderOutlet;
@property (weak, nonatomic) IBOutlet UIButton *togglePlayPause;

//- (IBAction)sliderVolumeAction:(id)sender;
//- (IBAction)stopButton:(id)sender;
//- (IBAction)playButton:(id)sender;

@end

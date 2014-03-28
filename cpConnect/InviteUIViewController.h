//
//  InviteUIViewController.h
//  cpConnect
//
//  Created by Daniel Wright on 3/26/14.
//  Copyright (c) 2014 Center Point Church. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InviteUIViewController : UIViewController
//Added  3-26-14
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aIndicator;

//Added  3-26-14
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

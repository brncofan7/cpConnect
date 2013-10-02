//
//  EventsUIViewController.h
//  cpConnect
//
//  Created by Daniel Wright on 9/26/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsUIViewController : UIViewController <UIWebViewDelegate>
//Changed from strong to weak 9-29-13
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aIndicator;

//Changed from strong to weak 9-29-13
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

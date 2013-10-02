//
//  GivingUIViewController.h
//  cpConnect
//
//  Created by Daniel Wright on 9/18/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GivingUIViewController : UIViewController <UIWebViewDelegate>
//{
//    IBOutlet UIWebView *webView;
//    NSURL *urlLocation;
//    IBOutlet UIActivityIndicatorView *aIndicator;
//}
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *aIndicator;

@end

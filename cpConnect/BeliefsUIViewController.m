//
//  BeliefsUIViewController.m
//  cpConnect
//
//  Created by Daniel Wright on 9/24/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import "BeliefsUIViewController.h"

@interface BeliefsUIViewController ()

@end

@implementation BeliefsUIViewController

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
    //NSError *error;
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"beliefs" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_webView loadHTMLString:htmlString baseURL:nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_aIndicatorBeliefs startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_aIndicatorBeliefs stopAnimating];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_webView removeFromSuperview];
    _webView.delegate = nil; _webView = nil;
    //[self.webView loadHTMLString:@"<html></html>" baseURL:nil];
}

@end

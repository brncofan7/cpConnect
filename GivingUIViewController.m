//
//  GivingUIViewController.m
//  cpConnect
//
//  Created by Daniel Wright on 9/18/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import "GivingUIViewController.h"

@interface GivingUIViewController ()


@end

@implementation GivingUIViewController

//@synthesize aIndicator;

- (void)viewDidLoad
{
    NSString *fullURL = @"http://www.centerpointmeridian.com/giving/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *Request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [_webView loadRequest:Request];
    
    [super viewDidLoad];
    
    //NSURL *url = [NSURL URLWithString:@"http://www.centerpointmeridian.com/giving/"];
    //NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    //[_webView loadRequest:requestURL];
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_aIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_aIndicator stopAnimating];

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

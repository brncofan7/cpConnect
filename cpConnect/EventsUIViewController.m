//
//  EventsUIViewController.m
//  cpConnect
//
//  Created by Daniel Wright on 9/26/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import "EventsUIViewController.h"

@interface EventsUIViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation EventsUIViewController
@synthesize  activityIndicator;

- (void)viewDidLoad
{
    //NSString *fullURL = @"http://www.centerpointmeridian.com/calendar/";
    //NSURL *url = [NSURL URLWithString:fullURL];
    //NSURLRequest *Request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    //[_webView loadRequest:Request];
    
    //NEW CODE 2-4-2014
    //NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"html"];
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_webView loadHTMLString:htmlString baseURL:nil];
    //END NEW CODE 2-4-2014
    
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    activityIndicator.color = [UIColor whiteColor];
    //activityIndicator.color = [UIColor colorWithRed: 0.0/255.0f green:102.0/255.0f blue:204.0/255.0f alpha:1.0];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
    [self navigationItem].rightBarButtonItem = barButton;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicator startAnimating];
    //[_aIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator stopAnimating];
    //[_aIndicator stopAnimating];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [activityIndicator removeFromSuperview];
    [_webView removeFromSuperview];
    _webView.delegate = nil; _webView = nil;
    //[self.webView loadHTMLString:@"<html></html>" baseURL:nil];
}


@end

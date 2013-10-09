//
//  BeliefsUIViewController.m
//  cpConnect
//
//  Created by Daniel Wright on 9/24/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import "BeliefsUIViewController.h"

@interface BeliefsUIViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation BeliefsUIViewController
@synthesize  activityIndicator;

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
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"beliefs2" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_webView loadHTMLString:htmlString baseURL:nil];
    
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
    //[_aIndicatorBeliefs startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator stopAnimating];
    //[_aIndicatorBeliefs stopAnimating];
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

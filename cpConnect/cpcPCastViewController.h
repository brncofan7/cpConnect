//
//  cpcPCastViewController.h
//  cpConnect
//
//  Created by Daniel Wright on 9/19/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import <QuartzCore/QuartzCore.h>

@interface cpcPCastViewController : UITableViewController <UITableViewDelegate>
{
    NSArray *pCastArray;
    IBOutlet UILabel *lblPCastTitle;
    IBOutlet UILabel *lblPCastDate;
}

@property (weak, nonatomic) IBOutlet UITableView *pCastTableView;
@property (strong, nonatomic) IBOutlet UILabel *lblPCastTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblPCastDate;

@end

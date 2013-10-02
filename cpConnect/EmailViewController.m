//
//  EmailViewController.m
//  cpConnect
//
//  Created by Daniel Wright on 9/27/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>

@interface EmailViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation EmailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    //self = [super initWithStyle:style];
    //if (self) {
        // Custom initialization
    //}
    return self;
}

- (void)viewDidLoad
{
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//        if (indexPath.row == 0)
//        {
//            cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_top.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//            cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_top.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//        }
//        else if (indexPath.row == 4)
//        {
//            cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_bottom.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//            cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_bottom.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//            UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, 290, 1)];
//            separatorLineView.backgroundColor = [UIColor grayColor];
//            [cell.contentView addSubview:separatorLineView];
//        }
//        else
//        {
//            cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_mid.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//            cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_mid.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//            UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, 290, 1)];
//            separatorLineView.backgroundColor = [UIColor grayColor];
//            [cell.contentView addSubview:separatorLineView];
//        }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3)
        [self showEmail];
    else
        return;
}


- (void)showEmail {
    
    NSString *emailTitle = @"Prayer Request";
    NSString *messageBody = @"";
    NSArray *toRecipents = [NSArray arrayWithObject:@"prayer@go2centerpoint.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            //NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            //NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            //NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            //NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
    //static NSString *CellIdentifier = @"PrayerCell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //[self showEmail];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //return cell;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

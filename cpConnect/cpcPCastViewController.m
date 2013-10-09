//
//  cpcPCastViewController.m
//  cpConnect
//
//  Created by Daniel Wright on 9/19/13.
//  Copyright (c) 2013 Center Point Church. All rights reserved.
//

#import "cpcPCastViewController.h"
#import "cpcCastDetailViewController.h"

@interface cpcPCastViewController ()

@end

@implementation cpcPCastViewController

@synthesize pCastTableView;
@synthesize lblPCastTitle;
@synthesize lblPCastDate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:lblPCastTitle];
    [self.view addSubview:lblPCastDate];
    [self performSelector:@selector(retrieveFromParse)];
    pCastTableView.backgroundColor = [UIColor whiteColor];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) retrieveFromParse {
    PFQuery *retrieveData = [PFQuery queryWithClassName:@"tablePodcastData"];
    [retrieveData orderByDescending:@"MsgDate"];
    [retrieveData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            pCastArray = [[NSArray alloc] initWithArray:objects];
        }
        [pCastTableView reloadData];
    }];
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
    //return 0;
    return pCastArray.count;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//        if (tableView == self.tableView) {
//            if (indexPath.row == 0)
//            {
//                cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_top.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//                cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_top.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//            }
//            else if (indexPath.row == ([pCastArray count]-1))
//            {
//                cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_bottom.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//                cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_bottom.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//                UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, 290, 1)];
//                separatorLineView.backgroundColor = [UIColor grayColor];
//                [cell.contentView addSubview:separatorLineView];
//            }
//            else
//            {
//                cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_mid.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//                cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"table_mid.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
//                UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, 290, 1)];
//                separatorLineView.backgroundColor = [UIColor grayColor];
//                [cell.contentView addSubview:separatorLineView];
//            }
//        }
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cMsgCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //NSDictionary *tempDict = [[NSDictionary alloc] initWithDictionary:[pCastArray objectAtIndex:indexPath.row]];
    PFObject *tempObject = [pCastArray objectAtIndex:indexPath.row];
    
    //NSString *msgTitle = [tempObject objectForKey:@"MsgTitle"];
    //msgTitle = [tempObject objectForKey:@"MsgTitle"];
    
    //cell.textLabel.text = [tempObject objectForKey:@"MsgTitle"];
    
    lblPCastTitle = (UILabel *)[cell viewWithTag:11];
    lblPCastTitle.text = [tempObject objectForKey:@"MsgTitle"];
    //lblPCastTitle.text = msgTitle;
    
    lblPCastDate = (UILabel *)[cell viewWithTag:10];
    //UILabel *lblPCastDate = (UILabel *)[cell viewWithTag:10];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM-dd-yyyy"];
    NSDate *mDate = [tempObject objectForKey:@"MsgDate"];
    NSString *date = [df stringFromDate:mDate];
    lblPCastDate.text = date;

    //NSLog(@"%@",date);
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"ShowPodcast"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *object = [pCastArray objectAtIndex:indexPath.row];
        PFFile *file = [object objectForKey:@"LinkToFile"];
        [[segue destinationViewController] setFile:file];
        
            //PFObject *file = [object objectForKey:@"LinkToFile"];
            //NSLog(@"%@",[object objectForKey:@"LinkToFile"]);
        //cpcPCastViewController *destViewController = segue.destinationViewController;
        cpcCastDetailViewController *destViewController = segue.destinationViewController;
        destViewController.msgTitle = [object objectForKey:@"MsgTitle"];
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"MM-dd-yyyy"];
        NSDate *mDate = [object objectForKey:@"MsgDate"];
        NSString *date = [df stringFromDate:mDate];
        destViewController.msgDate = date;
        destViewController.msgSpeaker = [object objectForKey:@"MsgSpeaker"];
        
    }
}

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

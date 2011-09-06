//
//  MenuController.m
//  BandwidthCapacityApp
//
//  Created by Tom Lodge on 01/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuController.h"


@implementation MenuController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Manage Bandwidth";
        /*self.navigationItem.backBarButtonItem =
        [[[UIBarButtonItem alloc] initWithTitle:@"Catalog" style:UIBarButtonItemStyleBordered
                                         target:nil action:nil] autorelease];*/
        self.navigationItem.rightBarButtonItem =
        [[[UIBarButtonItem alloc] initWithTitle:@"Set Tariff" style:UIBarButtonItemStyleBordered
                                         target:@"tt://tariff"
                                         action:@selector(openURLFromButton:)] autorelease];
        
        self.tableViewStyle = UITableViewStyleGrouped;
    }
    return self;
}

- (void)createModel {
    
    UIImage* iphone = TTIMAGE(@"bundle://iphone.png");
    UIImage* ipad = TTIMAGE(@"bundle://ipad.png");
    UIImage* mac = TTIMAGE(@"bundle://mac.png");
    UIImage* household = TTIMAGE(@"bundle://household.png");
    
    NSString* remoteImage = @"http://profile.ak.fbcdn.net/v223/35/117/q223792_6978.jpg";                   
    
    
    TTTableSubtitleItem* householditem =  [TTTableSubtitleItem itemWithText:@"Household" subtitle:@"80% of limit (1 week remaining)"
                                                           imageURL:nil defaultImage:household
                                                                URL:@"tt://overall/device" accessoryURL:nil];
    
    TTTableSubtitleItem* item1 =  [TTTableSubtitleItem itemWithText:@"Tom's iphone" subtitle:@"used 50% of 0.5Gb limit"
                                                          imageURL:nil defaultImage:iphone
                                                               URL:[NSString stringWithFormat:@"tt://device/%@",@"00:11:22:33:44:55"] accessoryURL:nil];
    
    TTTableSubtitleItem* item2 =  [TTTableSubtitleItem itemWithText:@"Tom's iPad" subtitle:@"used 10% of 0.2Gb limit"
                                                           imageURL:remoteImage defaultImage:ipad
                                                                URL:[NSString stringWithFormat:@"tt://device/%@",@"00:11:22:33:44:55"] accessoryURL:nil];
    
    
    TTTableSubtitleItem* item3 =  [TTTableSubtitleItem itemWithText:@"Katie's macair" subtitle:@"NO LIMIT SET (used 0.9Gb)"
                                                           imageURL:remoteImage defaultImage:mac
                                                                URL:[NSString stringWithFormat:@"tt://device/%@",@"00:11:22:33:44:55"] accessoryURL:nil];
    
    
    self.dataSource = [TTSectionedDataSource dataSourceWithObjects:
                      
                       @"Overall",
                       householditem,
                       
                       @"Dad's Devices (0.27Gb)",
                       
                       item1,
                       
                       item2,
                       
                       @"Katie's Devices (0.9 Gb)",
                       
                       item3,
                       
                       nil
                       ];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

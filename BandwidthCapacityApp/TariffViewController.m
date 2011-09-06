//
//  TariffViewController.m
//  BandwidthCapacityApp
//
//  Created by Tom Lodge on 06/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TariffViewController.h"


@implementation TariffViewController


- (void)createModel {
    
    UITextField* ispname = [[[UITextField alloc] init] autorelease];
    ispname.placeholder = @"Your provider's name (e.g Virgin, TalkTalk)";
    ispname.font = TTSTYLEVAR(font);
    ispname.delegate = self;
    
    UITextField* isplimit = [[[UITextField alloc] init] autorelease];
    isplimit.placeholder = @"Your limit (Gb)";
    isplimit.font = TTSTYLEVAR(font);
    isplimit.delegate = self;
    
    UITextField* startday = [[[UITextField alloc] init] autorelease];
    startday.placeholder = @"Day of month limit starts from (usually 1)";
    startday.font = TTSTYLEVAR(font);
    startday.delegate = self;
    
    
    self.dataSource = [TTSectionedDataSource dataSourceWithObjects:
                       @"Your ISP",
                       ispname,
                      
                       
                       @"Your tarrif",
                       isplimit,
                       startday,
                       nil];
}

-(BOOL) textFieldShouldReturn:(UITextField *)theTextField{
    NSLog(@"in here..");
	[theTextField resignFirstResponder];
	return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"ISP Tarrif";
        self.tableViewStyle = UITableViewStyleGrouped;
        self.autoresizesForKeyboard = YES;
        self.variableHeightRows = YES;
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]
                                                  initWithTitle:@"Done" style:UIBarButtonItemStyleBordered
                                                  target:self action:@selector(dismiss)] autorelease];
    }
    return self;
}

- (void)dismiss {
    [self dismissModalViewControllerAnimated:YES];
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

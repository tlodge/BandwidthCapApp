//
//  DeviceViewController.m
//  BandwidthCapacityApp
//
//  Created by Tom Lodge on 01/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DeviceViewController.h"

@interface DeviceViewController() 
-(NSString *) mbtostring:(float) mb;
@end

@implementation DeviceViewController


float MAXMB = 1024 * 2;
float cap = 0;
float currentusage = 1024 / 3;

- (id)initWithDevice:(NSString*)deviceId {
    if (self = [super init]) {
        self.title = [NSString stringWithFormat:@"Bandwidth cap for %@", deviceId];
        
    }
    return self;
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


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
 
    UIView *aview = [[UIView alloc] initWithFrame:appFrame];
    aview.backgroundColor = [UIColor whiteColor];
 
    self.view = aview;
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"detailbackground.png"]];
    background.frame = CGRectMake(0, 0, 320, 480);
    [aview addSubview:background];
    UISlider* slider = [[UISlider alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 200.0f, 20.f)];
    
    [slider setMaximumValue:100.f];
    [slider setMinimumValue:0.0f];
    [slider setContinuous:NO];
    
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [aview addSubview:slider];
    
    
    caplabel  = [[UILabel alloc] initWithFrame:CGRectMake(220, 15, 100, 30)];
    caplabel.textColor = [UIColor blackColor];
    caplabel.font = [UIFont fontWithName:@"Verdana" size:20.0];
    caplabel.backgroundColor = [UIColor clearColor];
    caplabel.textAlignment = UITextAlignmentCenter;
    caplabel.text = [self mbtostring:cap];
    [aview addSubview:caplabel];
    [caplabel release];
    
    /* add labels */
    UILabel *deviceoverall  = [[UILabel alloc] initWithFrame:CGRectMake(10, 67, 250, 30)];
    deviceoverall.textColor = [UIColor whiteColor];
    deviceoverall.font = [UIFont fontWithName:@"Verdana" size:18.0];
    deviceoverall.backgroundColor = [UIColor clearColor];
    deviceoverall.text = @"overall device usage";
    [aview addSubview:deviceoverall];
    [deviceoverall release];
    
    devicepercentage  = [[UILabel alloc] initWithFrame:CGRectMake(12, 97, 250, 100)];
    devicepercentage.textColor = [UIColor blackColor];
    devicepercentage.font = [UIFont fontWithName:@"Verdana" size:69.0];
    devicepercentage.backgroundColor = [UIColor clearColor];
    //devicepercentage.text = @"25%";
    devicepercentage.text = [NSString stringWithFormat:@"%.0f%%", cap == 0 ? 0 : (currentusage / cap) * 100];
    [aview addSubview:devicepercentage];
    [devicepercentage release];

    
    UILabel *devicepercentsubtext  = [[UILabel alloc] initWithFrame:CGRectMake(102, 172, 100, 30)];
    devicepercentsubtext.textColor = [UIColor whiteColor];
    devicepercentsubtext.font = [UIFont fontWithName:@"Verdana" size:16.0];
    devicepercentsubtext.backgroundColor = [UIColor clearColor];
    devicepercentsubtext.text = @"of limit";
    [aview addSubview:devicepercentsubtext];
    [devicepercentsubtext release];
    
    deviceactual  = [[UILabel alloc] initWithFrame:CGRectMake(0, 202, 176, 30)];
    deviceactual.textColor = [UIColor blackColor];
    deviceactual.font = [UIFont fontWithName:@"Verdana" size:17.0];
    deviceactual.backgroundColor = [UIColor clearColor];
    deviceactual.textAlignment = UITextAlignmentCenter;
    deviceactual.text = [NSString stringWithFormat:@"%@ of %@", [self mbtostring:currentusage], [self mbtostring:cap]];
    [aview addSubview:deviceactual];
    [deviceactual release];
    
    UILabel *useroverall  = [[UILabel alloc] initWithFrame:CGRectMake(110, 243, 250, 30)];
    useroverall.textColor = [UIColor whiteColor];
    useroverall.font = [UIFont fontWithName:@"Verdana" size:18.0];
    useroverall.backgroundColor = [UIColor clearColor];
    useroverall.text = @"overall user usage";
    [aview addSubview:useroverall];
    [useroverall release];
    
    UILabel *userranking  = [[UILabel alloc] initWithFrame:CGRectMake(110, 283, 210, 30)];
    userranking.textColor = [UIColor blackColor];
    userranking.font = [UIFont fontWithName:@"Verdana" size:18.0];
    userranking.backgroundColor = [UIColor clearColor];
    userranking.textAlignment = UITextAlignmentCenter;
    userranking.text = @"2nd highest user";
    [aview addSubview:userranking];
    [userranking release];
  
    UILabel *userpercentage  = [[UILabel alloc] initWithFrame:CGRectMake(138, 297, 179, 100)];
    userpercentage.textColor = [UIColor blackColor];
    userpercentage.font = [UIFont fontWithName:@"Verdana" size:69.0];
    userpercentage.backgroundColor = [UIColor clearColor];
    userpercentage.text = @"12%";
    userpercentage.textAlignment = UITextAlignmentCenter;
    [aview addSubview:userpercentage];
    [userpercentage release];
    
    
    UILabel *usertariff  = [[UILabel alloc] initWithFrame:CGRectMake(130, 380, 195, 30)];
    usertariff.textColor = [UIColor whiteColor];
    usertariff.font = [UIFont fontWithName:@"Verdana" size:16.0];
    usertariff.backgroundColor = [UIColor clearColor];
    usertariff.text = @"of tariff by 2 devices";
    usertariff.textAlignment = UITextAlignmentCenter;
    [aview addSubview:usertariff];
    [usertariff release];
    
    
    
    /*
     * Add device and user images
     */
    
    UIImageView *userimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"katie.png"]];
    CGRect frame = userimage.frame;
    userimage.frame = CGRectMake(8, 289, frame.size.width, frame.size.height);
    [aview addSubview:userimage];
    
    UIImageView *deviceimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iphone_detail.png"]];
    frame = deviceimage.frame;
    deviceimage.frame = CGRectMake(200, 107, frame.size.width, frame.size.height);
    [aview addSubview:deviceimage];
    
}


-(NSString *) mbtostring:(float) mb{
    if (mb == 0)
        return @"unlimited";
    
    if (mb > 1024){
       return   [NSString stringWithFormat:@"%.1fGb", mb/1024];
    }
    return [NSString stringWithFormat:@"%.0fMb",  mb];
   
}
-(void) sliderAction:(UISlider*)sender{
    cap = MAXMB * ([sender value]/100);
    
    NSLog(@"slider changed %f", cap);
   // caplabel.text = [NSString stringWithFormat:@"%.0f Mb",cap];
     caplabel.text = [self mbtostring:cap];
    devicepercentage.text = [NSString stringWithFormat:@"%.0f%%", cap == 0 ? 0 : (currentusage / cap) * 100];
    deviceactual.text = [NSString stringWithFormat:@"%@ of %@", [self mbtostring:currentusage], [self mbtostring:cap]];
   // caplabel.text = [NSString stringWithFormat:@"%f Mb",cap];
}

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

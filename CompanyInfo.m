//
//  CompanyInfo.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "CompanyInfo.h"
#import "ECSlidingViewController.h"
#import "menuitems.h"
#import "Applicant.h"
#import "AppliedJob.h"
#import "companymenuitems.h"
#import "MapViewController.h"
@interface CompanyInfo ()

@end
#define JOB_NAME  0
#define COMPANY_PHONENUMBER  1
#define COMPANY_WEBSITE  2
#define COMPANY_MAP  3
#define COMPANY_APPLY  5
#define COMPANY_QUEUE 4

@implementation CompanyInfo
@synthesize menubutton;
@synthesize data;
@synthesize _Applicant;
@synthesize service;
@synthesize jobtitle;
@synthesize jobdescription;
@synthesize city;
@synthesize quarter;
@synthesize salary;
@synthesize gpa;
@synthesize Address;
@synthesize bground;
@synthesize Enque;
@synthesize tableView;


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
    [super viewDidLoad];
    NSLog(@"LOADED");
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[menuitems class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"items"];
    
        NSLog(@"BREAK%@",self.slidingViewController.panGesture);
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    NSLog(@"BREAK");
    NSLog(@"BREAK");
    self.menubutton = [UIButton buttonWithType:UIButtonTypeCustom];
    menubutton .frame = CGRectMake(8, 10, 34, 24);
    //[menubutton  setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menubutton  addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menubutton ];
    
   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    /*self.MenuTittle.text = [(NSDictionary *)data objectForKey:@"companyName"];
    self.jobtitle.text = [(NSDictionary *)data objectForKey:@"jobtitle"];
    self.Address.text = [(NSDictionary *)data objectForKey:@"address"];
    self.gpa.text = [NSString stringWithFormat:@"%.2f",[[(NSDictionary *)data objectForKey:@"GPA"] floatValue]];
    self.city.text = [(NSDictionary *)data objectForKey:@"city"];
    self.salary.text = [NSString stringWithFormat:@"%.3f",[[(NSDictionary *)data objectForKey:@"salary"] floatValue]];
    self.quarter.text = [(NSDictionary *)data objectForKey:@"quarter"];
    self.jobdescription.text = [(NSDictionary *)data objectForKey:@"jobdescription1"];
    if([[(NSDictionary *)data objectForKey:@"applied"] isEqualToNumber:[NSNumber numberWithInt:1]])
    {
        [self.bground setImage:[UIImage imageNamed:@"Applied"]];
    }
    if([[(NSDictionary *)data objectForKey:@"inqueue"] isEqualToNumber:[NSNumber numberWithInt:1]])
    {
        [self.Enque setTitle:@"queued" forState:UIControlStateNormal];
    }*/
}
- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)canBecomeFirstResponder{
    
    return YES;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"BECAME FIRST RESPONDER");
    [self becomeFirstResponder];
    
}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [self.slidingViewController anchorTopViewTo:ECRight];
}
- (IBAction)queue:(id)sender {
    self.service = [[Service alloc]init];
    self.service.delegate = self;
    NSLog(@"NAME at user:%@",data);
    NSMutableDictionary *newData = [[NSMutableDictionary alloc] init];
    
    [newData setObject:[_Applicant objectForKey:@"userid"] forKey:@"userid"];
    [newData setObject:[(NSDictionary *)data objectForKey:@"job_id"] forKey:@"jobid"];
    [self.service MakeCall:newData ConnectionString:ENQUEUE];
         [self.Enque setTitle:@"Queued" forState:UIControlStateNormal];
    
}

- (IBAction)Apply:(id)sender {
    self.service = [[Service alloc]init];
    self.service.delegate = self;
    NSLog(@"NAME at user:%@",data);
    NSMutableDictionary *newData = [[NSMutableDictionary alloc] init];
    [newData setObject:[(NSDictionary *)data objectForKey:@"job_id"] forKey:@"jobid"];
    [newData setObject:[_Applicant objectForKey:@"userid"] forKey:@"userid"];
    [self.service MakeCall:newData ConnectionString:APPLY];
    [self.bground setImage:[UIImage imageNamed:@"Applied"]];
      
}
     -(void)ServiceRequestComplete:(NSDictionary *)response serviceStatus:(NSString *)status{
         if([[response objectForKey:@"applied"] isEqualToNumber:[NSNumber numberWithInt:1]])
         {
            [self.bground setImage:[UIImage imageNamed:@"Applied"]];
         }
         if([[response objectForKey:@"inqueue"] isEqualToNumber:[NSNumber numberWithInt:1]])
         {
              [self.Enque setTitle:@"queued" forState:UIControlStateNormal];
         }
         [self.tableView reloadData];
     }
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 6;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    switch  (section ) {
        case   JOB_NAME :
            return 2;
            break ;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    // Configure the cell...
    switch  (indexPath. section ) {
        case   JOB_NAME :
            if(indexPath.row == 0){
                cell. textLabel . text  =  [(NSDictionary *)data objectForKey:@"jobtitle"]; ;
            }
            if(indexPath.row == 1){
                cell. textLabel . text  = [(NSDictionary *)data objectForKey:@"address"];
                cell. textLabel . font = [UIFont fontWithName:@"Times" size:12.0];
            }
            break ;
            
        case   COMPANY_PHONENUMBER :
            cell. textLabel . text  = [NSString stringWithFormat:@"Call  %@",[(NSDictionary *)data objectForKey:@"contactnumber"]];
            cell. textLabel . textAlignment = UITextAlignmentCenter;
            break ;
            
        case   COMPANY_WEBSITE :
            cell. textLabel . text  =  @"www.apple.com";
            cell. textLabel . textAlignment = UITextAlignmentCenter;
            break ;
        case   COMPANY_MAP :
            cell. textLabel . text  =  @"Show on Map" ;
            cell. textLabel . textAlignment = UITextAlignmentCenter;
            break ;
        case   COMPANY_QUEUE:
            if([[(NSDictionary *)data objectForKey:@"inqueue"] isEqualToNumber:[NSNumber numberWithInt:1]])
            {
               cell. textLabel . text  =  @"I am in Queue" ;
            }else{
                cell.textLabel.text = @"Join the Queue";
            }
    
            cell. textLabel . textAlignment = UITextAlignmentCenter;
            break ;
        case   COMPANY_APPLY :
            if([[(NSDictionary *)data objectForKey:@"applied"] isEqualToNumber:[NSNumber numberWithInt:1]])
            {
                cell. textLabel . text  =  @"Applied" ;
            }else{
                cell. textLabel . text  =  @"Apply" ;
            }
           
            cell. textLabel . textAlignment = UITextAlignmentCenter;
            break ;
        default :
            NSLog ( @"Should not be here! adding content" );
            break ;
    }  // end switch
    
    // tell the textLabel of the cell to use at many lines as it needs
    cell. textLabel . numberOfLines  =  0 ;
    
    return cell;
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
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

// This delegate method is called once for each section
- ( NSString  *)tableView:( UITableView  *)tableView titleForHeaderInSection:( NSInteger )section{
    
    NSString  *title;
    switch  (section) {
        case   JOB_NAME:
            title =  [NSString stringWithFormat:@"%@ Internship",[(NSDictionary *)data objectForKey:@"quarter"]];
            break ;
        default :
            NSLog ( @"Should not be here!! Forming title" );
            break ;
    }  // end switch
    return  title;
    
}  // end titleForHeaderInSection

// How tall is each row?
// This delegate method is called once per row
- ( CGFloat )tableView:( UITableView  *)tableView heightForRowAtIndexPath:( NSIndexPath  *)indexPath{
    
    return   45.0 ;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    NSString  *msg;
    msg = [NSString stringWithFormat:@"%d", indexPath. section ];
    switch  (indexPath. section ) {
        case   JOB_NAME :
            break ;
        case   COMPANY_PHONENUMBER :
            break ;
            
        case   COMPANY_WEBSITE :
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [(NSDictionary *)data objectForKey:@"inqueue"]]];
            break ;
        case   COMPANY_MAP :{
            
            MapViewController *TopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MapView"];
            
            //TopViewController.data = [self.jobdata objectAtIndex:indexPath.row];
            //TopViewController._Applicant = data;
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = TopViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            [self.slidingViewController resetTopView];

            
            NSLog(@"I am a map");
        }
            
            break;
        case   COMPANY_QUEUE :{
            //[self.favouriteDelegate AddToFavorite:restaurant];
           
            NSLog(@"I am in queue");
            self.service = [[Service alloc]init];
            self.service.delegate = self;
            NSLog(@"NAME at user:%@",data);
            NSMutableDictionary *newData = [[NSMutableDictionary alloc] init];
            
            [newData setObject:[_Applicant objectForKey:@"userid"] forKey:@"userid"];
            [newData setObject:[(NSDictionary *)data objectForKey:@"job_id"] forKey:@"jobid"];
            [self.service MakeCall:newData ConnectionString:ENQUEUE];
            
            break ;
        }
        case   COMPANY_APPLY :{
            //[self.favouriteDelegate AddToFavorite:restaurant];
            if([[(NSDictionary *)data objectForKey:@"applied"] isEqualToNumber:[NSNumber numberWithInt:0]])
            {
            NSLog(@"I am a Applying");
            self.service = [[Service alloc]init];
            self.service.delegate = self;
            NSLog(@"NAME at user:%@",data);
            NSMutableDictionary *newData = [[NSMutableDictionary alloc] init];
            [newData setObject:[(NSDictionary *)data objectForKey:@"job_id"] forKey:@"jobid"];
            [newData setObject:[_Applicant objectForKey:@"userid"] forKey:@"userid"];
            [self.service MakeCall:newData ConnectionString:APPLY];
            }else{
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"You Already Applied!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            }
            break ;
        }
        default :
            NSLog ( @"Should not be here! When clicked" );
            break ;
    }  // end switch
}

@end

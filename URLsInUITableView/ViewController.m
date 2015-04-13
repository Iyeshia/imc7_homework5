#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tView;
@synthesize siteUrl;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //This array will handle all the URLs, you will refer to its content when a TableView cell is selected 
    webSitesURLs=[[NSArray alloc]initWithObjects:@"http://www.google.com",@"http://www.wikipedia.org",@"http://www.apple.com",@"http://www.mashable.com",@"http://www.youtube.com",@"http://www.yahoo.com",@"http://www.baidu.com",@"http://www.amazon.com",@"http://twitter.com",@"http://www.linkedin.com", nil];
    //This array is what you TableView needs to populate its data
    webSitesNames=[[NSArray alloc]initWithObjects:@"Google",@"Wikipedia",@"Apple",@"Mashable",@"Youtube",@"Yahoo",@"Baidu",@"Amazon",@"Twitter",@"LinkedIN", nil];
    //Configuring the TableView
    tView=[[UITableView alloc]initWithFrame:CGRectMake(10,0,300,self.view.frame.size.height) style:UITableViewStyleGrouped];
    tView.backgroundColor=[UIColor clearColor];
    //Set the delegates
    tView.dataSource=self;
    tView.delegate=self;
    //Add to main view
    [self.view addSubview:tView];
}

#pragma mark -

#pragma mark UITableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;//One section for the UITAbleView
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *ident=@"Cell";
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    
    cell.textLabel.text=[webSitesNames objectAtIndex:indexPath.row];//assigning a value for the given cell, this value is extracted from webSitesNames array
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [webSitesURLs count];//or [webSitesNames count], since they have the same number of items
    
    
}

#pragma mark UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    siteUrl=[webSitesURLs objectAtIndex:indexPath.row];
    [self alert:[webSitesNames objectAtIndex:indexPath.row]];
    
}

#pragma mark UIAlertView

-(void)alert:(NSString *)webSite{
    
    UIAlertView *aView=[[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"Are you sure you want to add: %@",webSite] delegate:self cancelButtonTitle:@"Yes, delete it." otherButtonTitles:@"No, don't delete.", nil];
    
    [aView show];
    [aView release];
    
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==2) {

            //Ok button was selected
            [[UIApplication sharedApplication] delete:[NSURL URLWithString:nil]];
        
        
        }
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

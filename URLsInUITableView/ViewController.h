#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *webSitesNames;
    NSArray *webSitesURLs;
    
}


@property(nonatomic, retain)UITableView *tView;
@property(nonatomic, retain)NSString *siteUrl;







@end

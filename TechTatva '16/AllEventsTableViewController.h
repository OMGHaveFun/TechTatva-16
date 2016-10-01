//
//  AllEventsTableViewController.h
//  TechTatva '16
//
//  Created by Abhishek Vora on 10/09/16.
//  Copyright © 2016 YASH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllEventsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate>
{
    IBOutlet UISearchBar *eventsSearchBar;
    
    NSArray *allEventsArray;
    NSMutableArray *searchedAllEventsArray;
    IBOutlet UITableView *allEventsTableView;
    IBOutlet UISegmentedControl *allEventsSegmentControl;
    

}

- (IBAction)allEventsSegmentChange:(id)sender;



@end

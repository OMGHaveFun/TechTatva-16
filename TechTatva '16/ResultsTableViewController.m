//
//  ResultsTableViewController.m
//  TechTatva '16
//
//  Created by Apple on 17/06/16.
//  Copyright © 2016 YASH. All rights reserved.
//

#import "ResultsTableViewController.h"
#import "ResultsTableViewCell.h"
#import "ResultsJsonDataModel.h"

@interface ResultsTableViewController (){
    NSArray *label1Array;
    NSArray *label2Array;
    NSArray *array;
}

@end

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    label1Array = [[NSArray alloc] init];
    label2Array = [[NSArray alloc] init];
    
    label1Array = @[@"Yash", @"Manas", @"Abhishek"];
    label2Array = @[@"Cathead", @"Organiser1", @"Organiser2"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        @try {
            NSURL *myUrl = [[NSURL alloc]initWithString:@"http://api.mitportals.in/results/"];
            NSData *mydata = [NSData dataWithContentsOfURL:myUrl];
            NSError *error;
            
            if (mydata!=nil)
            {
                id jsonData = [NSJSONSerialization JSONObjectWithData:mydata options:kNilOptions error:&error];
                id requiredArray = [jsonData valueForKey:@"data"];
                array = [ResultsJsonDataModel getArrayFromJson:requiredArray];
                ResultsJsonDataModel *model = [array objectAtIndex:0];
                NSLog(@"cat name: %@",model.category);
                NSLog(@"Event name:%@",model.event);
                NSLog(@"date:%@",model.position);
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                });
                
                
            }
            
            
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return label1Array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"resultsCell";
    ResultsTableViewCell *cell = (ResultsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ResultsTableViewCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    if (cell == nil) {
        cell = [[ResultsTableViewCell alloc] init];
    }
    
    cell.nameLabel1.text = [label1Array objectAtIndex:indexPath.row];
    cell.nameLabel2.text = [label2Array objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:@"thumb_IMG_7632_1024.jpg"];
    cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2;
    cell.thumbnailImageView.clipsToBounds = YES;

    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 106;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

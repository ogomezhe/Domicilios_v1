//
//  ViewController.h
//  Domicilios
//
//  Created by Oscar on 9/10/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>


@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSString *sort1;
    
}
@property NSMutableArray *arrData;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end


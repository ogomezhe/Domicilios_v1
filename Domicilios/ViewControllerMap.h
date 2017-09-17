//
//  MapViewController.h
//  Domicilios
//
//  Created by Oscar on 9/11/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface ViewControllerMap : UIViewController
   
    {
        
        NSMutableArray *detaildata;
    }
    @property (weak, nonatomic) IBOutlet UILabel *nameMapPoi;
    
   @property(nonatomic,strong) NSMutableArray *detaildata;


    @property (weak, nonatomic) IBOutlet MKMapView *mapview;
- (IBAction)typeMap:(id)sender;

@end

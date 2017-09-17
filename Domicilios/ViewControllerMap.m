//
//  MapViewController.m
//  Domicilios
//
//  Created by Oscar on 9/11/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

#import "ViewControllerMap.h"
#import "Pin.h"
@interface ViewControllerMap ()

@end

@implementation ViewControllerMap
    @synthesize mapview;
    @synthesize detaildata;
- (void)viewDidLoad {

  // NSLog(@"array: %@", dictionary);

    
    
    NSDictionary *dictionary = [[NSDictionary alloc] init];
    dictionary = [detaildata mutableCopy];

    NSString *username=[dictionary objectForKey:@"nombre"];
    NSString *coorden=[dictionary objectForKey:@"ubicacion_txt"];

    _nameMapPoi.text=username;
    
    NSArray * splitString;
    NSString * latitu1;
    NSString * logintu1;
    if (![coorden isEqualToString:@""])
    {
        
    
    splitString = [coorden componentsSeparatedByString:@","];
    latitu1 = [splitString objectAtIndex:0]; //123
    logintu1 = [splitString objectAtIndex:1]; //456
        
    }
    else
    
    {
    latitu1 =@"44.45";
    logintu1=@"-102.02";
    }
    
    float latitud_float = [latitu1 floatValue];
    float longitud_float = [logintu1 floatValue];


    
    MKCoordinateRegion region= {{0.0,0.0},{0.0,0.0}};
    region.center.latitude= latitud_float;
    region.center.longitude=longitud_float;
    region.span.longitudeDelta=0.01f;
    region.span.latitudeDelta=0.01f;
    [mapview setRegion:region animated:YES];
    Pin *Map1=[[Pin alloc]init];
    Map1.header=@"Ubicacion";
    Map1.coordinate=region.center;
    [mapview addAnnotation:Map1];
    

    // Do any additional setup after loading the view.
    
}
    
    
-(IBAction)typeMap:(id)sender
    {
        switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
            case 0:
            mapview.mapType=MKMapTypeStandard;
            
            break;
            case 1:
            mapview.mapType=MKMapTypeSatellite;
            
            break;
            
            case 2:
            mapview.mapType=MKMapTypeHybrid;
            
            break;
            default:
            break;
        }
    
    }
    
    
    
- (IBAction)atrasbutton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

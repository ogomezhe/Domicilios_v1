//
//  Pin.h
//  Domicilios
//
//  Created by Oscar on 9/11/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Pin : NSObject<MKAnnotation>
    {
        NSString *header;
        CLLocationCoordinate2D coordinate;
    
    }
    
    @property (nonatomic,copy)NSString *header;
    @property (nonatomic,assign)CLLocationCoordinate2D coordinate;
@end

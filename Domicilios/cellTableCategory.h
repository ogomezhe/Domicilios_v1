//
//  cellTableCategory.h
//  Domicilios
//
//  Created by Oscar on 9/10/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface cellTableCategory : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryCostDeliveryLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryName;
@property (weak, nonatomic) IBOutlet UILabel *categoryRating;
@property (weak, nonatomic) IBOutlet UILabel *categoryDetail;
    @property (weak, nonatomic) IBOutlet UILabel *costDomi;

    @property (weak, nonatomic) IBOutlet UILabel *tiempDomi;




@property (weak, nonatomic) IBOutlet UIImageView *imageCategory;

@end

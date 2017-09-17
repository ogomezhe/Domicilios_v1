//
//  ViewController.m
//  Domicilios
//
//  Created by Oscar on 9/10/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "cellTableCategory.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ViewControllerMap.h"

@interface ViewController ()

@end


@implementation ViewController
    
- (void)viewDidLoad {
    
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"https://api.myjson.com/bins/1zib8"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            self.arrData=[[NSMutableArray alloc]initWithArray:responseObject];
            NSLog(@"LOS DATOS RESPONDIDOS%@", self.arrData);
            [self.tableView reloadData];
        }
        
        
        
        
    }];
    [dataTask resume];
    

    
    

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_arrData count];
}




-(cellTableCategory *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // your cell code here
    // indexPath.row(use in tableView) means your number of index to get value
    
    
    
    static NSString *simpleTableIdentifier = @"cell1";
    cellTableCategory *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    cell.categoryLabel.text=[[self.arrData objectAtIndex:indexPath.row] objectForKey:@"categorias"];
   

   /* [cell.imageCategory  sd_setImageWithURL:[NSURL URLWithString:[[self.arrData objectAtIndex:indexPath.row] objectForKey:@"logo_path"]]
                         placeholderImage:[UIImage imageNamed:@"placeholderimage.jpg"]];
    */
    cell.categoryCostDeliveryLabel.text=[[self.arrData objectAtIndex:indexPath.row] objectForKey:@"domicilios"];
    cell.categoryName.text=[[self.arrData objectAtIndex:indexPath.row] objectForKey:@"nombre"];
    cell.categoryRating.text=[[self.arrData objectAtIndex:indexPath.row] objectForKey:@"rating"];
    cell.categoryDetail.text=[[self.arrData objectAtIndex:indexPath.row] objectForKey:@"url_detalle"];

    cell.costDomi.text=[[self.arrData objectAtIndex:indexPath.row] objectForKey:@"domicilio"];
    
    cell.tiempDomi.text=[[self.arrData objectAtIndex:indexPath.row] objectForKey:@"tiempo_domicilio"];
    

    
    return cell;
}

- (IBAction)orderCategory:(id)sender {
    
  
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"categoria"  ascending:YES];
        NSArray *users=[self.arrData sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
        
        self.arrData = [users mutableCopy];
        
        
        [self.tableView reloadData];
    

}

- (IBAction)orderName:(id)sender {
    
    
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"nombre"  ascending:NO];
        NSArray *users=[self.arrData sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
        
        self.arrData = [users mutableCopy];
        
        
        [self.tableView reloadData];
   
    
   
    
}

- (IBAction)orderRating:(id)sender {
    
   
        
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"rating"  ascending:NO];
        NSArray *users=[self.arrData sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
        
        self.arrData = [users mutableCopy];
        
        
        [self.tableView reloadData];
  
   
    
}
    
    
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        [tableView  deselectRowAtIndexPath:indexPath animated:YES];
        
        
        ViewControllerMap *sendMap=[self.storyboard instantiateViewControllerWithIdentifier:@"mapa"];
       
        
         UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:sendMap];
        
        
        
        
        sendMap.detaildata=[self.arrData objectAtIndex:indexPath.row];
        
        
        
        [self presentViewController:navigationController animated:YES completion:nil];
    }

    
   @end

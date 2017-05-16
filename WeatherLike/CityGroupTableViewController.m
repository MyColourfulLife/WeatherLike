//
//  CityGroupTableViewController.m
//  WeatherLike
//
//  Created by 黄家树 on 2017/5/16.
//  Copyright © 2017年 huangjiashu. All rights reserved.
//

#import "CityGroupTableViewController.h"

@interface CityGroupTableViewController ()
@property (nonatomic ,strong)NSArray *cityGroupArray;
@end

@implementation CityGroupTableViewController



-(NSArray *)cityGroupArray{
    
    if (!_cityGroupArray) {
    
        NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"cityGroups.plist" ofType:nil];
        NSArray *cityGroupArray = [NSArray arrayWithContentsOfFile:plistPath];
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        for (NSDictionary *dic in cityGroupArray) {
            
            CityGroup *cityGroup = [CityGroup new];
            
            [cityGroup setValuesForKeysWithDictionary:dic];
            
            [mutableArray addObject:cityGroup];
        }
        
        _cityGroupArray = mutableArray;
    }
    
    return _cityGroupArray;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"城市列表";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickBackItem)];
    self.navigationItem.leftBarButtonItem = backItem;
}

-(void)clickBackItem{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.cityGroupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CityGroup *cityGroup = self.cityGroupArray[section];
    return cityGroup.cities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    // Configure the cell...
    CityGroup *cityGroup = self.cityGroupArray[indexPath.section];
    cell.textLabel.text = cityGroup.cities[indexPath.row];
    
    return cell;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CityGroup *cityGroup = self.cityGroupArray[section];
    return cityGroup.title;
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.cityGroupArray valueForKeyPath:@"title"];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CityGroup *cityGroup = self.cityGroupArray[indexPath.section];
    
    NSString *cityName = cityGroup.cities[indexPath.row];
    
    //传递参数
    if (_block) {
        _block(cityName);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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

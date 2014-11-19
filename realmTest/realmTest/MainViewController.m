//
//  MainViewController.m
//  realmTest
//
//  Created by Tri Vo on 11/20/14.
//  Copyright (c) 2014 Tri Vo. All rights reserved.
//

#import "MainViewController.h"
#import "Dog.h"
#import "Person.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Create a dog object
    Dog *pDog = [[Dog alloc] init];
    
    // Set & Read properties
    pDog.name = @"TRex";
    pDog.ages = 9;
    NSLog(@"Name of dog: %@", pDog.name);
    
    RLMRealm *pRealm = [RLMRealm defaultRealm];
    
    // Save your object
    [pRealm beginWriteTransaction];
    [pRealm addObject:pDog];
    [pRealm commitWriteTransaction];
    
    // Query
    RLMResults *pDogResults = [Dog objectsInRealm:pRealm where:@"name contains 'T'"];
    
    // Queries are chainable!
    RLMResults *pResults = [pDogResults objectsWhere:@"ages > 8"];
    NSLog(@"Number of dogs: %li", (unsigned long)pResults.count);
    
    // Link objects
    Person *pPerson = [[Person alloc] init];
    pPerson.name = @"Top";
    [pPerson.dogs addObject:pDog];
    
    [pRealm beginWriteTransaction];
    [pRealm addObject:pPerson];
    [pRealm commitWriteTransaction];
    
    // Multi-threading
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RLMRealm *pOtherRealm = [RLMRealm defaultRealm];
        RLMResults *pOtherResults = [Dog objectsInRealm:pOtherRealm where:@"name contains 'Rex'"];
        NSLog(@"Number of dogs 2: %li", (unsigned long)pOtherResults.count);
    });
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

//
//  Dog.h
//  realmTest
//
//  Created by Tri Vo on 11/20/14.
//  Copyright (c) 2014 Tri Vo. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject

@property NSString *name;
@property NSInteger ages;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Dog>
RLM_ARRAY_TYPE(Dog)

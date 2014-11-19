//
//  Person.h
//  realmTest
//
//  Created by Tri Vo on 11/20/14.
//  Copyright (c) 2014 Tri Vo. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

@interface Person : RLMObject

@property NSString *name;
@property RLMArray<Dog> *dogs;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Person>
RLM_ARRAY_TYPE(Person)

//
//  CLCoreDataHelper.m
//  PaadamRandu
//
//  Created by Abbin Varghese on 13/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "CLCoreDataHelper.h"
#import "CoreDataHelper.h"
#import "Wildanimals.h"
#import "Vehicles.h"
#import "Vegetables.h"
#import "Objects.h"
#import "Seaanimals.h"
#import "Places.h"
#import "Houseanimals.h"
#import "People.h"
#import "Numbers.h"
#import "Farmanimals.h"
#import "HouseHold2.h"
#import "Fruits.h"
#import "Household1.h"
#import "Bodyparts.h"
#import "Spices.h"
#import "Foods.h"
#import "Colors.h"
#import "Naturalitems.h"
#import "Levels.h"

@implementation CLCoreDataHelper

static CLCoreDataHelper *coreDataHelper = nil;

#pragma mark -
#pragma mark initilization
#pragma mark -

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        managedObjectContext	= [[CoreDataHelper sharedCoreDataHelper] createManagedObjectContext];
    }
    return self;
}
/*----------------------------------------------------------------------------------------------*/
/*shared instance*/
/*----------------------------------------------------------------------------------------------*/
+ (CLCoreDataHelper *)sharedCLCoreDataHelper
{
    @synchronized(self)
    {
        if(coreDataHelper == nil)
        {
            coreDataHelper =[[self alloc] init];
        }
    }
    return coreDataHelper;
}


+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (coreDataHelper == nil)
        {
            coreDataHelper = [super allocWithZone:zone];
            return coreDataHelper;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (NSManagedObjectContext *)getManagedObjectContext;
{
    return managedObjectContext;
}


#pragma mark -
#pragma mark Core data helper funcitons
#pragma mark -

/*----------------------------------------------------------------------------------------------
 @Method Name  : deleteAllObjects
 @Param        : NSString*
 @Return       : void
 @Description  :
 ----------------------------------------------------------------------------------------------*/
- (void)deleteAllObjects:(NSString *)entityDescription
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityDescription inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *items = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    //[fetchRequest release];
    
    for (NSManagedObject *managedObject in items)
    {
        [managedObjectContext deleteObject:managedObject];
    }
    if (![managedObjectContext save:&error])
    {
        
    }
}


- (id)NULL_TO_NIL:(id)obj
{
    __typeof__ (obj) __obj = (obj);
    if (__obj == [NSNull null])
    {
        __obj = nil;
    }
    else
    {
        return __obj;
    }
    return __obj;
    
}

- (NSArray*)getAllLevels
{
    NSArray *userDetailsArray;
    BEGIN_BLOCK
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Levels" inManagedObjectContext:managedObjectContext];
        [fetchRequest setEntity:entity];
        
        NSError *error;
        userDetailsArray = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    }
    END_BLOCK
    return userDetailsArray;
}

-(NSArray *)getAllLevelItemsForLevel:(NSString *)levelName{
    NSArray *levelItems;
    BEGIN_BLOCK
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:levelName inManagedObjectContext:managedObjectContext];
        [fetchRequest setEntity:entity];
        
        NSError *error;
        levelItems = [managedObjectContext executeFetchRequest:fetchRequest error:&error];

    }
    END_BLOCK
    return levelItems;
}


@end

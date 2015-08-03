//
//  CLCoreDataHelper.h
//  PaadamRandu
//
//  Created by Abbin Varghese on 13/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CLCoreDataHelper : NSObject
{
    NSManagedObjectContext * managedObjectContext;
}

+ (CLCoreDataHelper *)sharedCLCoreDataHelper;

- (void)deleteAllObjects:(NSString *)entityDescription;

- (NSManagedObjectContext *)getManagedObjectContext;

- (NSArray*)getAllLevels;
- (NSArray*)getAllLevelItemsForLevel:(NSString*)levelName;

@end

//
//  Levels.h
//  PaadamRandu
//
//  Created by Abbin on 31/07/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Levels : NSManagedObject

@property (nonatomic, retain) NSString * levelName;
@property (nonatomic, retain) NSString * levelId;
@property (nonatomic, retain) NSString * levelDetailGetterName;

@end

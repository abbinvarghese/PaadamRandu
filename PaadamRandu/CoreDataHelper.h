//////////////////////////////////////////////////////////////////////////////////////
// File Name		:	CoreDataHelper.h
// Description		:	CoreDataHelper class Declaration.
// Version History	:	1.0
//////////////////////////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataHelper : NSObject 
{
    NSManagedObjectModel         *managedObjectModel;
    NSManagedObjectContext       *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

+ (CoreDataHelper *)sharedCoreDataHelper;
- (NSManagedObjectContext *)createManagedObjectContext;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, readonly) NSString *applicationDocumentsDirectory;

@end

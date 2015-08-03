//////////////////////////////////////////////////////////////////////////////////////
// File Name		:	CoreDataHelper.m
// Description		:	CoreDataHelper class implementation.
// Version History	:	1.0
//////////////////////////////////////////////////////////////////////////////////////


#import "CoreDataHelper.h"

@implementation CoreDataHelper

#define kDBNameSQLite									@"Coredata.sqlite"
#define kDBName											@"Coredata"

static CoreDataHelper *coreDataHelper = nil;

#pragma mark -
#pragma mark Core Data stack

/*----------------------------------------------------------------------------------------------*/
+ (CoreDataHelper *)sharedCoreDataHelper
{
	if(coreDataHelper == nil)
	{
		coreDataHelper = [[CoreDataHelper alloc]init];
	}	
	return coreDataHelper;
}
/*----------------------------------------------------------------------------------------------*/
/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator 
 for the application.
 */
/*----------------------------------------------------------------------------------------------*/
- (NSManagedObjectContext *) managedObjectContext 
{	
    if (managedObjectContext != nil) 
	{
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) 
	{
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}
/*----------------------------------------------------------------------------------------------*/
- (NSManagedObjectContext *)createManagedObjectContext
{
	NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
	NSManagedObjectContext *context;
	
    if (coordinator != nil) 
	{
        context = [[NSManagedObjectContext alloc] init];
        [context setPersistentStoreCoordinator: coordinator];
		[context setUndoManager:nil];
    }
    return context;
}
/*----------------------------------------------------------------------------------------------*/
/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the 
 application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel 
{
	
    if (managedObjectModel != nil) 
	{
        return managedObjectModel;
    }
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return managedObjectModel;
}
/*----------------------------------------------------------------------------------------------*/
/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
/*----------------------------------------------------------------------------------------------*/
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator 
{
    if (persistentStoreCoordinator != nil)
    {
        return persistentStoreCoordinator;
    }
    
    NSString *storePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent: kDBNameSQLite];
    NSURL *storeURL = [NSURL fileURLWithPath:storePath];
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSDictionary *options = @{
                              NSMigratePersistentStoresAutomaticallyOption : @YES,
                              NSInferMappingModelAutomaticallyOption : @YES
                              };
    
    // Check if we need a migration
    NSDictionary *sourceMetadata = [NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType URL:storeURL error:&error];
    NSManagedObjectModel *destinationModel = [persistentStoreCoordinator managedObjectModel];
    BOOL isModelCompatible = (sourceMetadata == nil) || [destinationModel isConfiguration:nil compatibleWithStoreMetadata:sourceMetadata];
    if (! isModelCompatible)
    {
        // We need a migration, so we set the journal_mode to DELETE
        options = @{NSMigratePersistentStoresAutomaticallyOption:@YES,
                    NSInferMappingModelAutomaticallyOption:@YES
                    };//NSSQLitePragmasOption: @{@"journal_mode": @"DELETE"
                    //};
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];

    // If the expected store doesn't exist, copy the default store.
    if (![fileManager fileExistsAtPath:storePath])
    {
        NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:kDBName ofType:@"sqlite"];
        if (defaultStorePath)
        {
            [fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
        }
    }
    else
    {
        
    }
    
    NSPersistentStore *persistentStore = [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
    
    if (! persistentStore)
    {
        NSDictionary *storeMeta = [NSPersistentStoreCoordinator metadataForPersistentStoreOfType:nil URL:storeURL error:&error];
        NSLog(@"%@",storeMeta);
        id someObj = [[storeMeta objectForKey:@"NSStoreModelVersionHashes"] objectForKey:@"Profile"];
        NSLog(@"%@",someObj);

        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documents = [paths objectAtIndex:0];
        NSString *databasePath = [documents stringByAppendingPathComponent:kDBName];
        NSString *sqlite = [databasePath stringByAppendingPathComponent:kDBNameSQLite];
        
        [[NSFileManager defaultManager] removeItemAtPath:sqlite error:nil];
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        //abort();
    }
    
    // Reinstate the WAL journal_mode
    if (! isModelCompatible)
    {
        [persistentStoreCoordinator removePersistentStore:persistentStore error:NULL];
        options = @{NSMigratePersistentStoresAutomaticallyOption:@YES,
                    NSInferMappingModelAutomaticallyOption:@YES,
                    NSSQLitePragmasOption: @{@"journal_mode": @"WAL"}
                    };
        [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
    }
    
    return persistentStoreCoordinator;
}
/*----------------------------------------------------------------------------------------------*/
#pragma mark -
#pragma mark Application's documents directory
/**
 Returns the path to the application's documents directory.
 */
/*----------------------------------------------------------------------------------------------*/
- (NSString *)applicationDocumentsDirectory 
{
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}
/*----------------------------------------------------------------------------------------------*/
                                                                                               
@end

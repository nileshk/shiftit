//
//  Preferences.m
//  ShiftIt
//
//  Created by Aravindkumar Rajendiran on 10-02-14.
//  Copyright 2010 Grapewave. All rights reserved.
//

#import "Preferences.h"
#import "HotKeyController.h"

OSStatus winSizer(EventHandlerCallRef nextHandler,EventRef theEvent,void *userData){
	//Do something once the key is pressed
	EventHotKeyID hotKeyID;
	GetEventParameter(theEvent,kEventParamDirectObject,typeEventHotKeyID,NULL,sizeof(hotKeyID),NULL,&hotKeyID);
	int temphotKeyId = hotKeyID.id;
	switch (temphotKeyId) {
		case 1:
			[(WindowSizer*)userData shiftToLeftHalf:NULL];
			break;
		case 2:
			[(WindowSizer*)userData shiftToRightHalf:NULL];
			break;
		case 3:
			[(WindowSizer*)userData shiftToTopHalf:NULL];
			break;
		case 4:
			[(WindowSizer*)userData shiftToBottomHalf:NULL];
			break;
		case 5:
			[(WindowSizer*)userData shiftToTopLeft:NULL];
			break;
		case 6:
			[(WindowSizer*)userData shiftToTopRight:NULL];
			break;
		case 7:
			[(WindowSizer*)userData shiftToBottomLeft:NULL];
			break;
		case 8:
			[(WindowSizer*)userData shiftToBottomRight:NULL];
			break;
		case 9:
			[(WindowSizer*)userData shiftToCenter:NULL];
			break;
		case 10:
			[(WindowSizer*)userData fullScreen:NULL];
			break;
		default:
			break;
	}	
	return noErr;
}

@implementation Preferences

-(id)init{
	if(self == [super init]){
		_hKeyController = [hKController getInstance];
		_winSizer = [[WindowSizer alloc] init];
		_eventType.eventClass = kEventClassKeyboard;
		_eventType.eventKind = kEventHotKeyPressed;
		InstallApplicationEventHandler(&winSizer,1,&_eventType,_winSizer,NULL);
        [self registerDefaults];
	}
	return self;
}

-(void)registerDefaults{
    [NSUserDefaults resetStandardUserDefaults];
    NSLog(@"Registering default");
	_userDefaultsValuesDict = [NSMutableDictionary dictionary];
	NSDictionary * leftHalf = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)],HotKeyModifers,
                                                [NSNumber numberWithUnsignedInt:123],HotKeyCodes,
                                                nil];
    
    [_userDefaultsValuesDict setObject:leftHalf forKey:@"leftHalf"];

    NSDictionary * rightHalf = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)],HotKeyModifers,
                               [NSNumber numberWithUnsignedInt:124],HotKeyCodes,
                               nil];
    
    [_userDefaultsValuesDict setObject:rightHalf forKey:@"rightHalf"];

    
    NSDictionary * topHalf = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)],HotKeyModifers,
                               [NSNumber numberWithUnsignedInt:126],HotKeyCodes,
                               nil];
    
    [_userDefaultsValuesDict setObject:topHalf forKey:@"topHalf"];

    
    NSDictionary * bottomhalf = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)],HotKeyModifers,
                               [NSNumber numberWithUnsignedInt:125],HotKeyCodes,
                               nil];
    
    [_userDefaultsValuesDict setObject:bottomhalf forKey:@"bottomHalf"];

    NSDictionary * topLeft = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask+NSControlKeyMask)],HotKeyModifers,
                                 [NSNumber numberWithUnsignedInt:123],HotKeyCodes,
                                 nil];
    [_userDefaultsValuesDict setObject:topLeft forKey:@"topLeft"];

    NSDictionary * topRight = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask+NSControlKeyMask)],HotKeyModifers,
                              [NSNumber numberWithUnsignedInt:126],HotKeyCodes,
                              nil];
    [_userDefaultsValuesDict setObject:topRight forKey:@"topRight"];

    NSDictionary * bottomLeft = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask+NSControlKeyMask)],HotKeyModifers,
                              [NSNumber numberWithUnsignedInt:125],HotKeyCodes,
                              nil];
    [_userDefaultsValuesDict setObject:bottomLeft forKey:@"bottomLeft"];
    
    NSDictionary * bottomRight = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask+NSControlKeyMask)],HotKeyModifers,
                              [NSNumber numberWithUnsignedInt:124],HotKeyCodes,
                              nil];
    [_userDefaultsValuesDict setObject:bottomRight forKey:@"bottomRight"];

    NSDictionary * fullScreen = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)],HotKeyModifers,
                                  [NSNumber numberWithUnsignedInt:3],HotKeyCodes,
                                  nil];
    [_userDefaultsValuesDict setObject:fullScreen forKey:@"fullScreen"];
    
    NSDictionary * center = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)],HotKeyModifers,
                                  [NSNumber numberWithUnsignedInt:8],HotKeyCodes,
                                  nil];
    [_userDefaultsValuesDict setObject:center forKey:@"center"];
    
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:1 keyCode:123 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)]]];
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:2 keyCode:124 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)]]];
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:3 keyCode:126 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)]]];
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:4 keyCode:125 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)]]];
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:5 keyCode:123 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask+NSControlKeyMask)]]];
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:6 keyCode:126 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask+NSControlKeyMask)]]];
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:7 keyCode:125 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask+NSControlKeyMask)]]];
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:8 keyCode:124 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask+NSControlKeyMask)]]];
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:9 keyCode:8 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)]]];
	[_hKeyController registerHotKey:[[SIHotKey alloc]initWithIdentifier:10 keyCode:3 modCombo:[NSNumber numberWithUnsignedInt:(NSCommandKeyMask+NSAlternateKeyMask)]]];
	
    [_userDefaultsValuesDict setObject:[NSNumber numberWithInt:1] forKey:@"shiftItstartLogin"];
    
	[[NSUserDefaults standardUserDefaults] registerDefaults:_userDefaultsValuesDict];
	[[NSUserDefaults standardUserDefaults] synchronize];
    
    NSArray *resettableUserDefaultsKeys;
    NSDictionary * initialValuesDict;
    resettableUserDefaultsKeys=[NSArray arrayWithObjects:@"leftHalf",@"topHalf",@"bottomHalf",@"rightHalf",@"bottomLeft",@"bottomRight",@"topLeft",@"topRight",@"fullScreen",@"center",nil];
    initialValuesDict=[[NSUserDefaults standardUserDefaults] dictionaryWithValuesForKeys:resettableUserDefaultsKeys];
    
    // Set the initial values in the shared user defaults controller
    [[NSUserDefaultsController sharedUserDefaultsController] setInitialValues:initialValuesDict];
    
}

-(void)modifyHotKey:(NSInteger)newKey modiferKeys:(NSInteger)modKeys key:(NSString*)keyCode{
	[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:newKey] forKey:[@"hkc" stringByAppendingString:keyCode]];
	[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:modKeys] forKey:[@"hkm" stringByAppendingString:keyCode]];
	[_hKeyController modifyHotKey:[[SIHotKey alloc]initWithIdentifier:[[_userDefaultsValuesDict objectForKey:keyCode] intValue] keyCode:newKey modCombo:[NSNumber numberWithUnsignedInt:modKeys]]];
	[[NSUserDefaults standardUserDefaults] synchronize];	
}

+(void)registerForLogin:(BOOL)login{
    if(login){
        NSString * appPath = [[NSBundle mainBundle] bundlePath];
        
        // This will retrieve the path for the application
        // For example, /Applications/test.app
        CFURLRef url = (CFURLRef)[NSURL fileURLWithPath:appPath]; 
        
        // Create a reference to the shared file list.
        // We are adding it to the current user only.
        // If we want to add it all users, use
        // kLSSharedFileListGlobalLoginItems instead of
        //kLSSharedFileListSessionLoginItems
        LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL,kLSSharedFileListSessionLoginItems, NULL);
        if (loginItems) {
            //Insert an item to the list.
            LSSharedFileListItemRef item = LSSharedFileListInsertItemURL(loginItems,kLSSharedFileListItemLast, NULL, NULL,url, NULL, NULL);
            if (item){
                CFRelease(item);
            }
        }	
        CFRelease(loginItems);
    }else {
        NSString * appPath = [[NSBundle mainBundle] bundlePath];
        
        // This will retrieve the path for the application
        // For example, /Applications/test.app
        CFURLRef url = (CFURLRef)[NSURL fileURLWithPath:appPath]; 
        
        // Create a reference to the shared file list.
        LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL,
                                                                kLSSharedFileListSessionLoginItems, NULL);
        
        if (loginItems) {
            UInt32 seedValue;
            //Retrieve the list of Login Items and cast them to
            // a NSArray so that it will be easier to iterate.
            NSArray  *loginItemsArray = (NSArray *)LSSharedFileListCopySnapshot(loginItems, &seedValue);
            int i = 0;
            for(i ; i< [loginItemsArray count]; i++){
                LSSharedFileListItemRef itemRef = (LSSharedFileListItemRef)[loginItemsArray
                                                                            objectAtIndex:i];
                //Resolve the item with URL
                if (LSSharedFileListItemResolve(itemRef, 0, (CFURLRef*) &url, NULL) == noErr) {
                    NSString * urlPath = [(NSURL*)url path];
                    if ([urlPath compare:appPath] == NSOrderedSame){
                        LSSharedFileListItemRemove(loginItems,itemRef);
                    }
                }
            }
            [loginItemsArray release];
        }
    }
    
    
}


-(void)dealloc{
    [_winSizer release];
    [_hKeyController release];
	[_userDefaultsValuesDict release];
    [super dealloc];
}
@end
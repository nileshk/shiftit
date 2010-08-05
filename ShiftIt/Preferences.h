/*
 ShiftIt: Resize windows with Hotkeys
 Copyright (C) 2010  Aravind
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 */

#import <Cocoa/Cocoa.h>
#import "hKController.h"
#import "WindowSizer.h"

#define HotKeyModifers @"Modifiers"
#define HotKeyCodes @"Key Code"

#define KEYCODE_9 25
#define KEYCODE_8 28
#define KEYCODE_7 26
#define KEYCODE_6 22
#define KEYCODE_5 23
#define KEYCODE_4 21
#define KEYCODE_3 20
#define KEYCODE_2 19
#define KEYCODE_1 18

@interface Preferences : NSObject {
    hKController * _hKeyController;
	NSMutableDictionary * _userDefaultsValuesDict;
    WindowSizer * _winSizer;
    EventTypeSpec _eventType;

}
-(void)modifyHotKey:(NSInteger)newKey modiferKeys:(NSInteger)modKeys key:(NSString*)keyCode;
-(void)registerDefaults;

@end

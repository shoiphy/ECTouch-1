// --------------------------------------------------------------------------
//! @author Sam Deane
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import "ECTSection.h"

// --------------------------------------------------------------------------
//! Simple cell conforming to the ECTSectionDrivenTableCell protocol.
// --------------------------------------------------------------------------

typedef enum
{
    ValueInitialised,
    ValueChanged
} UpdateEvent;

@interface ECTSimpleCell : UITableViewCell<ECTSectionDrivenTableCell>

@property (strong, nonatomic) ECTBinding* binding;
@property (strong, nonatomic) ECTSection* section;
@property (assign, nonatomic) BOOL canDelete;
@property (assign, nonatomic) BOOL canMove;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier;
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (void)setupForBinding:(ECTBinding*)binding section:(ECTSection*)section;
- (void)removeBinding;
- (void)setupAccessory;
- (BOOL)canDelete;
- (BOOL)canMove;
- (BOOL)updateUIForEvent:(UpdateEvent)event;
- (BOOL)updateLabel:(UILabel*)label value:(NSString*)value event:(UpdateEvent)event;
- (BOOL)updateLabel:(UILabel*)label key:(NSString*)key event:(UpdateEvent)event;

@end

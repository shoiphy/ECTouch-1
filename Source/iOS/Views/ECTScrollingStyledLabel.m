// --------------------------------------------------------------------------
//! @author Sam Deane
//! @date 18/10/2011
//
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's 
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import "ECTScrollingStyledLabel.h"

#import "ECTScrollView.h"
#import "ECTStyledLabel.h"

@interface ECTScrollingStyledLabel()

- (void)makeSubviews;

@end

@implementation ECTScrollingStyledLabel

#pragma mark - Properties

@synthesize label;
@synthesize scroller;

#pragma mark - Channels

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]) != nil)
    {
        [self makeSubviews];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]) != nil)
    {
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self makeSubviews];
}

- (void)dealloc 
{
    [label release];
    [scroller release];
    
    [super dealloc];
}

- (void)makeSubviews
{
    ECTScrollView* sv = [[ECTScrollView alloc] initWithFrame:self.frame];
    self.scroller = sv;
    [sv release];
    
    ECTStyledLabel* sl = [[ECTStyledLabel alloc] initWithFrame:self.frame];
    self.label = sl;
	sl.scroller = sv;
    [sl release];
   
    [sv addSubview:sl];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.label sizeToFit];
    CGSize size = self.label.frame.size;
    self.scroller.contentSize = size;
}


- (NSAttributedString*)attributedText
{
    return self.label.attributedText;
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    self.label.attributedText = attributedText;
    [self layoutSubviews];
}


@end

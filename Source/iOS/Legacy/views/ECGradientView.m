//
//  GradientView.m
//  pod point
//
//  Created by Sam Deane on 02/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

#import "ECGradientView.h"


#import <QuartzCore/QuartzCore.h>

@implementation ECGradientView

@synthesize topColour = _topColour;
@synthesize bottomColour = _bottomColour;
@synthesize gradient = _gradient;

- (void) addCAGradient
{
	self.topColour = [UIColor whiteColor];
	self.bottomColour = [UIColor blackColor];
	
	CAGradientLayer* gradient = [CAGradientLayer layer];
	gradient.frame = self.bounds;
	[self.layer insertSublayer:gradient atIndex:0];
	self.gradient = gradient;
	[self updateColours];
}

- (void) updateColours
{
	self.gradient.colors = [NSArray arrayWithObjects:(id) [self.topColour CGColor], (id) [self.bottomColour CGColor], nil];
}

- (id) initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame: frame]) != nil)
	{
		[self addCAGradient];
	}
	
	return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder: aDecoder]) != nil)
	{
		[self addCAGradient];
	}
	
	return self;
}

 - (void) dealloc
 {
	 [_gradient release];
	 
	 [super dealloc];
 }

- (void) slideIn
{
	CGPoint savedCenter = self.center;
	CGPoint newCenter = savedCenter;
	newCenter.y += self.bounds.size.height;
	self.center = newCenter;

	[UIView animateWithDuration:1.0 animations:^{
		self.center = savedCenter;
	}];
}

@end

//
//  SmoothLineView.m
//  Smooth Line View
//
//  Created by Levi Nunnink on 8/15/11.
//  Copyright 2011 culturezoo. All rights reserved.
//

#import "SmoothLineView.h"
#import "SATHackerDataManager.h"
#import <QuartzCore/QuartzCore.h>

#define DEFAULT_COLOR [UIColor blackColor]
#define DEFAULT_WIDTH [[[SATHackerDataManager getOptionInfo] objectForKey:@"penSize"] doubleValue]

@interface SmoothLineView ()

#pragma mark Private Helper function

CGPoint midPoint(CGPoint p1, CGPoint p2);

@end

@implementation SmoothLineView{

    BOOL eraser;
    
    UIImage *drawPictureName;

}

#pragma mark -

-(void)setup
{
    self.lineWidth = DEFAULT_WIDTH;
    self.lineColor = DEFAULT_COLOR;
    [self setMultipleTouchEnabled:YES];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void) setPicture :(UIImage*)name{
    drawPictureName = name;
}

#pragma mark Private Helper function

CGPoint midPoint(CGPoint p1, CGPoint p2)
{
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    previousPoint1 = CGPointZero;
    previousPoint2 = CGPointZero;
    currentPoint = CGPointZero;
    
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    previousPoint1 = CGPointZero;
    previousPoint2 = CGPointZero;
    currentPoint = CGPointZero;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if ([touches count]>=2) {
        self.lineColor = [UIColor clearColor];
        
        eraser = YES;
        
        NSArray *twoTouches = [touches allObjects];
        // 获取触摸点数组
        UITouch *first = [twoTouches objectAtIndex:0];
        UITouch *second = [twoTouches objectAtIndex:1];
        sideOne = [first locationInView:self];
        sideTwo = [second locationInView:self];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, sideOne.x, sideOne.y);
        CGPathAddLineToPoint(path, NULL, sideTwo.x, sideTwo.y);
        CGRect bounds = CGPathGetBoundingBox(path);
        
        CGPathRelease(path);
        
        CGRect drawBox = bounds;
        
        //Pad our values so the bounding box respects our line width
        drawBox.origin.x        -= self.lineWidth * 2;
        drawBox.origin.y        -= self.lineWidth * 2;
        drawBox.size.width      += self.lineWidth * 4;
        drawBox.size.height     += self.lineWidth * 4;
        
        UIGraphicsBeginImageContext(drawBox.size);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        curImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [self setNeedsDisplayInRect:drawBox];
        
    }else{
    
    UITouch *touch = [touches anyObject];
    previousPoint1 = [touch previousLocationInView:self];
    previousPoint2 = [touch previousLocationInView:self];
    currentPoint = [touch locationInView:self];
        self.lineColor = DEFAULT_COLOR;
        eraser = NO;
    }
    
    [self touchesMoved:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    if ([touches count]>=2) {
        self.lineColor = [UIColor clearColor];

        eraser = YES;
        
        NSArray *twoTouches = [touches allObjects];
        // 获取触摸点数组
        UITouch *first = [twoTouches objectAtIndex:0];
        UITouch *second = [twoTouches objectAtIndex:1];
        sideOne = [first locationInView:self];
        sideTwo = [second locationInView:self];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, sideOne.x, sideOne.y);
        CGPathAddLineToPoint(path, NULL, sideTwo.x, sideTwo.y);
        CGRect bounds = CGPathGetBoundingBox(path);
        
        CGPathRelease(path);
        
        CGRect drawBox = bounds;
        
        //Pad our values so the bounding box respects our line width
        drawBox.origin.x        -= self.lineWidth * 2;
        drawBox.origin.y        -= self.lineWidth * 2;
        drawBox.size.width      += self.lineWidth * 4;
        drawBox.size.height     += self.lineWidth * 4;
        
        UIGraphicsBeginImageContext(drawBox.size);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        curImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [self setNeedsDisplayInRect:drawBox];

        
    }else{

        UITouch *touch  = [touches anyObject];
    
        previousPoint2  = previousPoint1;
        previousPoint1  = [touch previousLocationInView:self];
        currentPoint    = [touch locationInView:self];
    
    // calculate mid point
        CGPoint mid1    = midPoint(previousPoint1, previousPoint2);
        CGPoint mid2    = midPoint(currentPoint, previousPoint1);
    
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, mid1.x, mid1.y);
        CGPathAddQuadCurveToPoint(path, NULL, previousPoint1.x, previousPoint1.y, mid2.x, mid2.y);
        CGRect bounds = CGPathGetBoundingBox(path);
        CGPathRelease(path);
    
        CGRect drawBox = bounds;
    
    //Pad our values so the bounding box respects our line width
        drawBox.origin.x        -= self.lineWidth * 2;
        drawBox.origin.y        -= self.lineWidth * 2;
        drawBox.size.width      += self.lineWidth * 4;
        drawBox.size.height     += self.lineWidth * 4;
    
        UIGraphicsBeginImageContext(drawBox.size);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        curImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    
        [self setNeedsDisplayInRect:drawBox];
    }
}


- (void)drawRect:(CGRect)rect
{

    //[curImage drawAtPoint:CGPointMake(0, 0)];
    
    if (eraser == NO) {
        
        if (drawPictureName == nil) {
            CGPoint mid1 = midPoint(previousPoint1, previousPoint2);
            CGPoint mid2 = midPoint(currentPoint, previousPoint1);
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            
            
            [self.layer renderInContext:context];
            
            CGContextMoveToPoint(context, mid1.x, mid1.y);
            CGContextAddQuadCurveToPoint(context, previousPoint1.x, previousPoint1.y, mid2.x, mid2.y);
            CGContextSetLineCap(context, kCGLineCapRound);
            CGContextSetLineWidth(context, self.lineWidth);
            CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
            
            
            CGContextStrokePath(context);
        }
    
        else{
            CGContextRef context = UIGraphicsGetCurrentContext();
            
            
            [self.layer renderInContext:context];
            
            CGContextDrawImage(context, self.bounds, drawPictureName.CGImage);
            
            CGContextStrokePath(context);
            
            drawPictureName = nil;
        }
   
    
    }else if (eraser){
        
        CGPoint point1 = sideOne;
        CGPoint point2 = sideTwo;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.layer renderInContext:context];
        
        CGContextMoveToPoint(context, point1.x, point1.y);
        CGContextAddLineToPoint(context, point2.x, point2.y);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, 60);
        CGContextSetBlendMode(context, kCGBlendModeCopy);
        CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
        CGContextStrokePath(context);

    }
    

    
    [super drawRect:rect];
    
    

}


@synthesize lineColor,lineWidth;
@end



//
//  COIcon.m
//  Coopsi
//
//  Created by Luda Fux on 7/20/14.
//  Copyright (c) 2014 Coopsi. All rights reserved.
//

#import "COIcon.h"
//#import "FICUtilities.h"

@interface COIcon(){
        NSString *_UUID;
}

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *placeholderImageView;
@property (nonatomic,strong) CAShapeLayer *placeholderShape;

@end

@implementation COIcon

@synthesize imageURL;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}


- (id)initWithCoder:(NSCoder*)coder
{
    if ((self = [super initWithCoder:coder])) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:self.imageView];
}

- (void)drawRect:(CGRect)rect{
    if (self.placeholderImage) {
        if (!self.placeholderImageView) {
            self.placeholderImageView = [[UIImageView alloc]initWithImage:self.placeholderImage];
            [self addSubview:self.placeholderImageView];
        }
        self.placeholderImageView.hidden = NO;
    }
    else {
        if (!self.placeholderShape) {
            self.placeholderShape = [CAShapeLayer layer];
            self.placeholderShape.path = [UIBezierPath bezierPathWithRoundedRect:self.imageView.bounds
                                                                    cornerRadius:self.radiusOfRoundedRect].CGPath;
            self.placeholderShape.fillColor = [UIColor colorWithWhite:1 alpha:0.2].CGColor;
            [self.layer addSublayer:self.placeholderShape];
        }
        self.placeholderShape.hidden = NO;
    }
    CAShapeLayer *missionImageMask = [CAShapeLayer layer];
    missionImageMask.path = [UIBezierPath
                             bezierPathWithRoundedRect:self.imageView.bounds
                             cornerRadius:self.radiusOfRoundedRect].CGPath;
    self.imageView.layer.mask = missionImageMask;
}

-(void)setImageURL:(NSURL *)anImageURL
{
//    if (imageURL != anImageURL) {
//        imageURL = anImageURL;
//    }
//    
//    NSString *formatName = XXImageFormatNameUserThumbnailSmall;
//    FICImageCacheCompletionBlock completionBlock = ^(id <FICEntity> entity, NSString *formatName, UIImage *image) {
//        _imageView.image = image;
//        [_imageView.layer addAnimation:[CATransition animation] forKey:kCATransition];
//        self.placeholderImageView.hidden = YES;
//        self.placeholderShape.hidden = YES;
//    };
//    
//    FICImageCache *sharedImageCache = [FICImageCache sharedImageCache];
//    BOOL imageExists = [sharedImageCache retrieveImageForEntity:self withFormatName:formatName completionBlock:completionBlock];
//    
//    if (imageExists == NO) {
//        self.imageView.image = nil;
//        self.placeholderImageView.hidden = NO;
//        self.placeholderShape.hidden = NO;
//    }

    
    
    if (imageURL != anImageURL) {
        imageURL = anImageURL;
        if (imageURL) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
            dispatch_async(queue, ^{
                NSData *data = [NSData dataWithContentsOfURL:self.imageURL];
                UIImage *image = [UIImage imageWithData:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (anImageURL == self.imageURL && image){
                        self.imageView.image = image;
                        self.placeholderImageView.hidden = YES;
                        self.placeholderShape.hidden = YES;
                    }
                });
            });
        }
        else {
            self.imageView.image = nil;
            self.placeholderImageView.hidden = NO;
            self.placeholderShape.hidden = NO;
        }
    }
}

-(void)setRadiusOfRoundedRect:(CGFloat)radiusOfRoundedRect{
    if (_radiusOfRoundedRect != radiusOfRoundedRect) {
        _radiusOfRoundedRect = radiusOfRoundedRect;
        [self setNeedsDisplay];
    }
}

//- (NSString *)UUID {
//    if (_UUID == nil) {
//        CFUUIDBytes UUIDBytes = FICUUIDBytesFromMD5HashOfString([self.imageURL absoluteString]);
//        _UUID = FICStringWithUUIDBytes(UUIDBytes);
//    }
//    
//    return _UUID;
//}
//
////- (NSString *)UUID {
////    CFUUIDBytes UUIDBytes = FICUUIDBytesFromMD5HashOfString([self.imageURL absoluteString]);
////    NSString *UUID = FICStringWithUUIDBytes(UUIDBytes);
////    
////    return UUID;
////}
//
//- (NSString *)sourceImageUUID {
//    CFUUIDBytes sourceImageUUIDBytes = FICUUIDBytesFromMD5HashOfString([self.imageURL absoluteString]);
//    NSString *sourceImageUUID = FICStringWithUUIDBytes(sourceImageUUIDBytes);
//    
//    return sourceImageUUID;
//}
//
//- (NSURL *)sourceImageURLWithFormatName:(NSString *)formatName {
//    return self.imageURL;
//}
//
//- (FICEntityImageDrawingBlock)drawingBlockForImage:(UIImage *)image withFormatName:(NSString *)formatName {
//    FICEntityImageDrawingBlock drawingBlock = ^(CGContextRef context, CGSize contextSize) {
//        CGRect contextBounds = CGRectZero;
//        contextBounds.size = contextSize;
//        CGContextClearRect(context, contextBounds);
//        
//        //        // Clip medium thumbnails so they have rounded corners
//        //        if ([formatName isEqualToString:XXImageFormatNameUserThumbnailMedium]) {
//        //            UIBezierPath clippingPath = [self _clippingPath];
//        //            [clippingPath addClip];
//        //        }
//        
//        UIGraphicsPushContext(context);
//        [image drawInRect:contextBounds];
//        UIGraphicsPopContext();
//    };
//    
//    return drawingBlock;
//}

@end

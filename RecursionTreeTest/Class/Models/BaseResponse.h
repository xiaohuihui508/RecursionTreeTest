//
//  BaseResponse.h
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeItem.h"

@interface BaseResponse : NSObject

@property (nonatomic, assign) BOOL state;
@property (nonatomic, copy)   NSString * message;
/** data */
@property (nonatomic, copy) id data;

@end





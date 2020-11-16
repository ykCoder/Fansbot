//
//  NetworkManage.h
//  KTVManage
//
//  Created by 杨康 on 2020/11/5.
//

#import <Foundation/Foundation.h>

typedef void(^RequestSuccess) (NSURLResponse *response, id responseObject);
typedef void(^RequestFailed) (NSError * error);


NS_ASSUME_NONNULL_BEGIN

@interface NetworkManage : NSObject

@end

NS_ASSUME_NONNULL_END

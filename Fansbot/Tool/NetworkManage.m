//
//  NetworkManage.m
//  KTVManage
//
//  Created by 杨康 on 2020/11/5.
//

#import "NetworkManage.h"
#import "AFNetworking.h"


//Request Serialization
typedef NS_ENUM(NSUInteger, requestMethod)
{
    AFGet = 0,  //Query String Parameter Encoding
    AFPost,     //URL Form Parameter Encoding      Content-Type: application/x-www-form-urlencoded
    AFJson      //JSON Parameter Encoding          Content-Type: application/json
};



@implementation NetworkManage

+(void)downloadTask:(NSString *)urlString
{
    AFURLSessionManager *manager = [self URLmanager];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];

    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}
-(void)uploadTask:(NSString *)urlString
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
        }
    }];
    [uploadTask resume];
}
-(void)uploadTask_Multi_PartRequest
{
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://example.com/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"] name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
        } error:nil];

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //Update the progress view
//                          [progressView setProgress:uploadProgress.fractionCompleted];
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                      }
                  }];

    [uploadTask resume];
}
+(void)dataTask:(requestMethod)type andURL:(NSString *)URL andParameters:(NSDictionary*)postDic success:(RequestSuccess)requestSuccess failure:(RequestFailed)requestFailed
{
    AFURLSessionManager *manager = [self URLmanager];
    

    NSMutableString *URLString = [[NSMutableString alloc]initWithString:URL];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithDictionary:postDic];
    
    NSMutableURLRequest *request;
    switch (type) {
        case 0:
            request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
            
            break;
        case 1:
            request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
            
            
            break;
        case 2:
            request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
            
            break;
        case 3:
            request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"PATCH" URLString:URLString parameters:parameters error:nil];
            break;
        case 4:
            request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"DELETE" URLString:URLString parameters:parameters error:nil];
            break;
            
        default:
            break;
    }
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            requestFailed (error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            requestSuccess(response ,responseObject);
        }
    }];
    [dataTask resume];
}
+(void)networkReachability
{
    //Shared Network Reachability
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];

    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

+(void)securityPolicy
{
    //Allowing Invalid SSL Certificates
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES; // not recommended for production
}
+ (AFURLSessionManager*)URLmanager{
    static dispatch_once_t onceToken;
    static AFURLSessionManager *manager = nil;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
       
        
    });
    return manager;
}
@end

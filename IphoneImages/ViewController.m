//
//  ViewController.m
//  IphoneImages
//
//  Created by David Guichon on 2017-03-27.
//  Copyright © 2017 David Guichon. All rights reserved.
//

#import "ViewController.h"
#import "IphoneImages.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IphoneImages *iphoneImages;


- (IBAction)newImage:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //THIS METHOD NEEDS TO BE PASSED IN THE "URL" STRING
    NSURL *url = [NSURL URLWithString:@"http://i.imgur.com/bktnImE.png"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError * error) {
        if (error){
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = image;
        }];
        
    }];
    [downloadTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)newImage:(UIButton *)sender {
    
    IphoneImages *iphoneImages = [[IphoneImages alloc] init];
    [iphoneImages getNewURL];
    NSURL *url =  [NSURL URLWithString:[iphoneImages getNewURL]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError * error) {
        if (error){
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = image;
        }];
        
    }];
    [downloadTask resume];

    
}
@end








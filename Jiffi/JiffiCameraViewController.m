//
//  JiffiCameraViewController.m
//  Jiffi
//
//  Created by Daniel Young on 2014-04-12.
//  Copyright (c) 2014 Jiffi. All rights reserved.
//

#import "JiffiCameraViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "JiffiSpritzViewController.h"


@interface JiffiCameraViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *picView;
@property (strong, nonatomic) NSString *response;
@end

@implementation JiffiCameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)ratio {
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * ratio.width, image.size.height * ratio.height));
    [image drawInRect:CGRectMake(0, 0, image.size.width * ratio.width, image.size.height * ratio.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

-(void)uploadImage:(UIImage *)image
{
    [self.CameraSPritzButton setTitle:@"" forState:UIControlStateNormal];
    CGSize newSize = CGSizeMake(0.5, 0.5);
    
    image = [self imageWithImage:image convertToSize:(newSize)];
    
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.9);
    
    
    // Init the URLRequest
    
    [self.spinner startAnimating];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:[NSURL URLWithString:@"http://retailigence.info/pinterest/jiffi/getImage.php"]];
    
    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"uploadedfile\"; filename=\"screwYou.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    
    NSLog(@"Starting Connection");
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSLog(@"SERVER STATUS: %i: %@", httpResponse.statusCode, [NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode]);
        NSLog(@"RESPONSE BODY: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        self.response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [self.spinner stopAnimating];
        [self.CameraSPritzButton setTitle:@"Jiffi it!" forState:UIControlStateNormal];
    }];
    
    
    //[request r];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:87.0/255.0 blue:68.0/255.0 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker =
    [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType =
    UIImagePickerControllerSourceTypeCamera;
    imagePicker.mediaTypes =
    @[(NSString *) kUTTypeImage];
    
    imagePicker.allowsEditing = NO;
    [self presentViewController:imagePicker
                       animated:YES completion:nil];
}

- (void) viewDidAppear:(BOOL)animated {
    
}

-(void)imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Code here to work with media
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self uploadImage:image];
    self.picView.image = image;
    
}


-(void)imagePickerControllerDidCancel: (UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"camera"]) {
        if([[segue destinationViewController] isKindOfClass:[JiffiSpritzViewController class]]) {
            JiffiSpritzViewController *ctrl = [segue destinationViewController];
            ctrl.content = self.response;
        }
    }
}


@end

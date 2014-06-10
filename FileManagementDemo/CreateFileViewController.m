//
//  CreateFileViewController.m
//  FileManagementDemo
//
//  Created by TheAppGuruz-iOS-103 on 17/05/14.
//  Copyright (c) 2014 TheAppGuruz. All rights reserved.
//

#import "CreateFileViewController.h"

@interface CreateFileViewController ()
{
    NSFileManager *fileManager;
    NSString *documentDir;
    NSString *filePath;
    NSString *fileName;
}

@end

@implementation CreateFileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    fileManager = [NSFileManager defaultManager];
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentDir = [dirPaths objectAtIndex:0];
}

#pragma mark - Action Methods

- (IBAction)btnCreateFileTapped:(id)sender
{
    filePath = [documentDir stringByAppendingPathComponent:@"file1.txt"];
    [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    
    filePath = [documentDir stringByAppendingPathComponent:@"file2.txt"];
    [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    
    [self showSuccessAlert:@"File created successfully"];
}

- (IBAction)btnCreateDirectoryTapped:(id)sender
{
    filePath = [documentDir stringByAppendingPathComponent:@"folder1.txt"];
    [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    
    [self showSuccessAlert:@"Directory created successfully"];
}

- (IBAction)btnWriteFileTapped:(id)sender
{
    NSData *fileContent = [@"File content" dataUsingEncoding:NSUTF8StringEncoding];
    [fileContent writeToFile:[documentDir stringByAppendingPathComponent:@"file1.txt"] atomically:YES];
    [self showSuccessAlert:@"Content written successfully"];
}

- (IBAction)btnReadFileTapped:(id)sender
{
    filePath = [documentDir stringByAppendingPathComponent:@"file1.txt"];
    NSData *fileData = [fileManager contentsAtPath:filePath];
    [self showSuccessAlert:[NSString stringWithFormat:@"File content is : %@",[[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding]]];
}

- (IBAction)btnMoveFileTapped:(id)sender
{
    NSString *oldFilePath = [documentDir stringByAppendingPathComponent:@"file1.txt"];
    NSString *newFilePath = [documentDir stringByAppendingPathComponent:@"folder1/move.txt"];
    
    [fileManager moveItemAtPath:oldFilePath toPath:newFilePath error:nil];
    [self showSuccessAlert:@"File moved successfully"];
}

- (IBAction)btnCopyFileTapped:(id)sender
{
    NSString *originalFile = [documentDir stringByAppendingPathComponent: @"file1.txt"];
    NSString *copyFile = [documentDir stringByAppendingPathComponent:@"copy.txt"];
    [fileManager copyItemAtPath:originalFile toPath:copyFile error:nil];
    [self showSuccessAlert:@"File copied successfully"];
}

- (IBAction)btnFilePermissionsTapped:(id)sender {
    filePath = [documentDir stringByAppendingPathComponent:@"file1.txt"];
    NSString *filePermissions = @"";
    if([fileManager isWritableFileAtPath:filePath]) {
        filePermissions = [NSString stringWithFormat:@"%@ \n File is writable",filePermissions];
    }
    if ([fileManager isReadableFileAtPath:filePath]) {
        filePermissions = [NSString stringWithFormat:@"%@ \n File is readable",filePermissions];
    }
    if ([fileManager isExecutableFileAtPath:filePath]) {
        filePermissions = [NSString stringWithFormat:@"%@ \n File is executable",filePermissions];
    }
    [self showSuccessAlert:filePermissions];
}

- (IBAction)btnFileEqualityCheckTapped:(id)sender
{
    NSString *filePath1 = [documentDir stringByAppendingPathComponent:@"file1.txt"];
    NSString *filePath2 = [documentDir stringByAppendingPathComponent:@"file2.txt"];
    
    if ([fileManager contentsEqualAtPath:filePath1 andPath:filePath2]) {
        [self showSuccessAlert:@"Files are equal."];
    } else {
        [self showSuccessAlert:@"Files are not equal."];
    }
}

- (IBAction)btnDirectoryContentTapped:(id)sender {
    NSArray *arrDirContent = [fileManager contentsOfDirectoryAtPath:documentDir error:nil];
    [self showSuccessAlert:[NSString stringWithFormat:@"Content of directory is : %@",arrDirContent]];
}

- (IBAction)btnRemoveFileTapped:(id)sender {
    filePath = [documentDir stringByAppendingPathComponent:@"file1.txt"];
    [fileManager removeItemAtPath:filePath error:nil];
    [self showSuccessAlert:@"file removed successfully"];
}


#pragma  mark - Show Alert

-(void)showSuccessAlert:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end

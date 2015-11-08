#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>

#import <VoxQL-Swift.h>

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options);
void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview);

/* -----------------------------------------------------------------------------
 Generate a preview for file
 
 This function's job is to create preview for designated file
 ----------------------------------------------------------------------------- */

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
{
    @autoreleasepool {
        
        VoxLoader *voxLoader = [[VoxLoader alloc] init];
        NSData *data = [voxLoader loadVoxFileIntoScene:(__bridge NSURL*) url];
        
        QLPreviewRequestSetDataRepresentation(preview, (__bridge CFDataRef) data, kUTType3DContent, NULL);
        
        // To complete your generator please implement the function GeneratePreviewForURL in GeneratePreviewForURL.c
        return noErr;
    }
}

void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview)
{
    // Implement only if supported
}

# ARQuickPreview-cannot-close

ARQuickPreview-cannot-close on SwiftUI bug report

### Filed under:  FB9186633 

I reproduced the issue in this Github repo:
https://github.com/multitudes/ARQuickPreview-cannot-close

Running the code in main repo or in the branch called versionWithNavController (same) I cannot close the ARQuickLook preview. 
I tried without the NavigationController (does not show the top bar) and I tried with NavigationController as suggested in the forums, the NavigationBar appears with a X to close which is irresponsive. The other buttons AR/Object are working switching between AR and Object and the share button works (sometimes not) and I can press and take an image.


I am using Xcode 12.5 release and iPhone mini with beta software but this is not the issue. I see in forums that many people are looking for workarounds to this.

Also there is a navigation controller flashing shortly before showing the QLpreview in AR

I also get this in the console:

> 2021-06-17 12:25:15.051105+0200 ARQuickPreview-cannot-close[3315:1912939] [default] [self.extensionContext conformsToProtocol:auxHostProtocol.protocol] - /Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionKit-40.100/ExtensionFoundation/Source/NSExtension/NSExtensionSupport/EXExtensionContext.m:332: Class QLPreviewExtensionHostContext does not conform to aux host protocol: QLRemotePreviewHost



This is a screenshot
![IMG_A9D0204C057B-1](https://user-images.githubusercontent.com/29355828/122382453-39e93580-cf6a-11eb-9372-ede02e148493.jpeg)



# VoxQL
QuickLook generator for [MagicaVoxel](https://ephtracy.github.io) .vox files

Work in progress due to a known bug in [`SCNSceneSource initWithData`](https://developer.apple.com/library/prerelease/mac/documentation/SceneKit/Reference/SCNSceneSource_Class/index.html#//apple_ref/occ/instm/SCNSceneSource/initWithData:options:), which may cause timeouts for very large scenes

![](http://i.imgur.com/WNvUez3.gif)


## Installation
To install, either build the VoxQL target or download the [latest release](https://github.com/heptal/VoxQL/releases/download/0.1.0/VoxQL.qlgenerator.zip). Move `VoxQL.qlgenerator` into `~/Library/QuickLook/` or `/Library/QuickLook/` for all users. Reload QuickLook generators with `qlmanage -r` if necessary.

[VoxQL.qlgenerator.zip](https://github.com/heptal/VoxQL/releases/download/0.1.0/VoxQL.qlgenerator.zip)

## Todo
Homebrew cask  
Thumbnail generation  
Provide scene data directly once Apple releases bugfix  
Support more voxel file formats such as .qb?  

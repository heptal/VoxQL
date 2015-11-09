# VoxQL
QuickLook generator for [MagicaVoxel](https://ephtracy.github.io) .vox files

Work in progress due to a known bug in [`SCNSceneSource initWithData`](https://developer.apple.com/library/prerelease/mac/documentation/SceneKit/Reference/SCNSceneSource_Class/index.html#//apple_ref/occ/instm/SCNSceneSource/initWithData:options:), which may cause timeouts for very large scenes

![](http://i.imgur.com/WNvUez3.gif)


## Installation
If you have [Homebrew Cask](http://caskroom.io) installed (awaiting pull request):
```bash
$ brew update
$ brew cask install voxql
```

To uninstall:
```bash
$ brew cask uninstall voxql
```
Otherwise, either build the VoxQL target or download the [latest release](https://github.com/heptal/VoxQL/releases/download/0.1.0/VoxQL.qlgenerator.zip). Move `VoxQL.qlgenerator` into `~/Library/QuickLook/` or `/Library/QuickLook/` for all users. To uninstall, simply delete `VoxQL.qlgenerator`.  

Reload QuickLook generators with `qlmanage -r` if necessary.

## Todo
~~Homebrew cask~~  
Thumbnail generation  
Provide scene data directly once Apple releases bugfix  
Support more voxel file formats such as .qb?  

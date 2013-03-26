
picsort2
========


Use Case
---------

1. Download your pitures from camera onto computer, 
2. Run app to organize them into folders, 
3. Browse to picture you want and select it(click on it) to go post it online

When selecting(clicking) the picture it applies a photo enhancing photo filter (tipically curves + vignette) and prompts for a "save as".

Status
------

not finished, barelly(?) usable

- Automatically organizes images, by day into folders
  - while app is open it monitors for file changes in the pictures directory if finds an image automatically moves to folder
- Allows to apply an image filter and then save the image
- Uses localstorage, to memorize the last used picture directory
- Click on folders to browse into. use "back" to go back to root folder.
- Click on image to apply image filter and to save image.

### Issues

- image resize is messy (takes time to open a folde with many big images, because caman applies resize to each one at a time)
- does not scale to loads of big images inside a folder

### Run

	> cake run

Has some specific windows dependencies:
- 7zip for zipping a folder 
- Expects nw to be in path
- Expects exiftool.exe to be in vendor/bin folder

See the Cakefile, and adapt as needed.

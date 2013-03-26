
picsort2
========

not finished, barelly(?) usable

- Automatically organizes images, into day folder (monitors for file pidcir updates and if finds an image automatically moves to folder)
- Allows to apply an image filter and then save the image
- uses localstorage, to memorize the last used picdir

Why
---

- Think this is usefull to organize pictures
- Wanted to try out building a desktop app in javascript using node-webkit(has node-js bundled inside)


### Run

	> cake run

Has some specific windows dependencies:
- 7zip for zipping a folder 
- Expects nw to be in path
- Expects exiftool.exe to be in vendor/bin folder

See the Cakefile, and adapt as needed.

### Issues

- image resize is messy (takes time to open a folde with many big images, because caman applies resize to each one at a time)
- does not scale to loads of big images inside a folder

# rad1o_an1maker
Disclaimer: This is a really ugly bash script. It works though!
Bash scripts for creating an1 format animations form animated gifs for the rad1o badge using the original perl scripts
For simplicity the perl scripts from the original github repository of the rad1o software are included.
Usage: Clone the repository. Put a 130px * 130px animated gif in the directory. Then run:

gif2an1.sh animated.gif ms

where animated.gif should be replaced by your actual gif's filename and ms by a number representing the time in miliseconds between frames of the animation. You'll find your .an1 file in the same directory.

There's also prepan1.sh which only creates a script called makean1.sh that you can then edit too take out some unwanted frames for example.



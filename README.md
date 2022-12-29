# FPSGraphShader
FPS Graph intended to be used in VRChat.

Example Video from an older version of the shader:
[![IMAGE ALT TEXT](http://img.youtube.com/vi/UDOOOc-fYL0/0.jpg)](http://www.youtube.com/watch?v=UDOOOc-fYL0 "FPS Graph")

Example Image from current version of the shader:
![image](https://user-images.githubusercontent.com/118522423/209589999-09907fb6-a35f-4372-96b6-309b5e551ece.png)

To use, apply "FPS Display" to a quad or other shape. Feel free to change the shader of FPS Display, the only reason the FPS Display shader is included is I eventually may add extra options that would require customizing the display shader. But using the unity standard shader you can do stuff like transparency. Just make sure the main displayed texture is FPS CRT.

You can customize the output graph in the CRT Driver material (looks like a texture). Do Not Apply this material to your avatar. Bad things can happen. Do not change the texture on this material, it will break. Reapply the FPS CRT texture to fix.

To increase the max FPS of the graph, you can change the Y size in FPS CRT. It is currently set with 144fps as the top of the graph.

To change the update rate, change the update mode Period. Its a value in seconds, 0 runs as fast as possible. .1 has a pretty nice effect.

To change the starting color that shows when first loading it (the color that is pushed out by the graph as it goes) change the color under initialization mode in FPS CRT.

This shader displays local FPS. So others will see their FPS graph, not yours. 


~~This shader can be used to display arbitrary data, simply animate the "Debug FPS" float. As long as the value is not -1, it will use the value of the float as the value it adds to the graph.~~ (For now this may not be possible actually, If I find a way to get it working Ill update this).
update: Tholin to the rescue! Arbitrary data can be written in with his CRT input prefab and some minor edits to this shader. It has some limitations but its possible!

If you have any questions feel free to contact me on discord: Zekk#5814.

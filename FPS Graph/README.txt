Made by Zekk#5814, Most recent package can be found at https://github.com/ZekkVRC/FPSGraphShader

To use, apply "FPS Display" to a quad or other shape. Feel free to change the shader of FPS Display, the only reason the FPS Display shader is included is I eventually may add extra options that would require customizing the display shader. But using the unity standard shader you can do stuff like transparency. Just make sure the main displayed texture is FPS CRT.

You can customize the output graph in the CRT Driver material (looks like a texture). Do Not Apply this material to your avatar. Bad things can happen. Do not change the texture on this material, it will break. Reapply the FPS CRT texture to fix.

To increase the max FPS of the graph, you can change the Y size in FPS CRT. It is currently set with 144fps as the top of the graph.

To change the update rate, change the update mode Period. Its a value in seconds, 0 runs as fast as possible. .1 has a pretty nice effect.

To change the starting color that shows when first loading it (the color that is pushed out by the graph as it goes) change the color under initialization mode in FPS CRT.

This shader displays local FPS. So others will see their FPS graph, not yours. 


This shader can be used to display arbitrary data, simply animate the "Debug FPS" float. As long as the value is not -1, it will use the value of the float as the value it adds to the graph.

If you have any questions feel free to contact me on discord.

Licence:
MIT License

Copyright (c) 2022 ZekkVRC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

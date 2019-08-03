# Creating binaries

Hi!

I like using supervisord to manage multiple processes in containers. However, I wanted something lightweight, without needing to always install Python. This project seems like a good fit.

Therefore, my goal, with the provided Makefile, is to:

- Provide some bootstrap images that will rely on this supervisord by default
- Provide a binary that can be used as the entrypoint for containers based on existing images

Note#1: you need to install `upx` to compress the Linux image. This is quite a gain for containers, where we end up using ~2.5MB of space, rather than 50MB.

Note#2: you **will** have to modify the Makefile to suit your needs.

Or you can get the binaries directly from the releases link if that's all you need!

# The MIT License (MIT)

Copyright (c) <2019> <Chris F Ravenscroft>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

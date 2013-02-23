## Introduction
A handful of Hubot scripts I've written to make my life easier. Many of these
require AppleScript, so they won't help you if you're running Hubot on Heroku.

I run Hubot on my Mac so I can communicate with it via iMessage, giving me a
Siri-like tool I can use via text message instead of voice.
(see [hubot-imessage](http://github.com/lazerwalker/hubot-imessage))

I don't really expect anyone else will be interested in these, but feel free to
use or draw inspiration from them. Let me know if you do anything cool with 'em!


## Installation
Add the following dependency to your Hubot package.json file:

    "lazerwalker-hubot-scripts": "git://github.com/lazerwalker/lazerwalker-hubot-scripts"

Then, add `"lazerwalker-hubot-scripts"` to your external-scripts.json file.

If you don't have an external-scripts.json file, create a new file in your Hubot
base dir that contains `["lazerwalker-huubot-scripts"]`. You now have an
external-scripts.json file.

I suppose I could publish this on npm, but it doesn't really feel appropriate.


## License
All scripts in this repo are (C) Michael Walker and published under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
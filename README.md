## Introduction
A handful of Hubot scripts I've written to make my life easier.

I run Hubot on my Mac so I can communicate with it via iMessage, giving me a
Siri-like tool I can use via text message instead of voice.
(See my [blog post](http://blog.lazerwalker.com/blog/2013/02/24/speak-no-siri-hear-no-siri/) on the topic for more info.)

Feel free to either use these directly or just use them as inspiration for your own Hubot scripts. Let me know if you do anything cool with 'em!


## Installation
Add the following dependency to your Hubot package.json file:

    "lazerwalker-hubot-scripts": "git://github.com/lazerwalker/lazerwalker-hubot-scripts"

Then, add `"lazerwalker-hubot-scripts"` to your external-scripts.json file.

If you don't have an external-scripts.json file, create a new file in your Hubot
base dir that contains `["lazerwalker-huubot-scripts"]`. You now have an
external-scripts.json file.


## Scripts

### Productivity
* GCal: Add a calendar event to your [Google Calendar](https://www.omnigroup.com/products/omnifocus/) with a plain English string (e.g. `cal lunch at 2pm with Jack`)
* OmniFocus: Add an item to your [OmniFocus](https://www.omnigroup.com/products/omnifocus/) inbox (e.g. `of Take out the trash`)
* Remember The Milk: Add an item to your [Remember The Milk](http://rememberthemilk.com) inbox
* Buxfer: Add an expense to your [Buxfer](http://buxfer.com) account, with optional tags (e.g. `$6 pizza lunch`)

### Fun
* Beer: Returns a URL to the Beer Advocate page for a given beer (e.g. `beer Stone IPA` gives you http://beeradvocate.com/beer/profile/147/88)

## License
All scripts in this repo are (c) Michael Walker and published under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
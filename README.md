# _The Word Definer_
## _By: Antonio Cruz_
## Description

_This is a webpage that will allow uers to add words they may be unfamiliar with to a page, and include their corresponding definitions_

## Setup


1. If you would like to view this project locally... :

2. Visit this link https://github.com/assassin56/ruby-friday_project8
 
3. Clone this repo by selecting the "clone or download" button. This will allow you to copy the repo's link.

4. While on the command line in your terminal, enter "git clone" followed by the copied url.

5. Enter "ls" to show a list of files and documents. One of them will be labeled "ruby-friday_project8. Use "cd" followed by the project directory name to navigate there.

6. While in project directory, run the command "bundle"

7. Run "ruby app.rb" to open the server."

## Known Bugs
_No known bugs at this time_

## Technology

* _Git_
* _GitHub_
* _Gem_
* _Ruby_
* _Rspec_
* _Capybara_
* _Sinatra_
* _Sinatra-contrib_
* _Pry_


## Specs

* Behavior: Create a Dictionary for multiple word entries 
  * Input: New word, "Consistency"
  * Output: Post word to Dictionary

* Behavior: Allow inputs for new words
  * Input: "Consistency"
  * Output: The word is added to the dictionary

* Behavior: Allow a word to be deleted
  * Input: "Delete word"
  * Output: "Consistency" is deleted.

* Behavior: Allow an existing word to be edited.
  * Input: "Edit word"
  * Output: New word "Gold" is added to dictionary

* Behavior: Allow the user to add definitions to their inputted words
  * Input: Consistency: "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness."
  * Output: The definition is stored with the selected word.

* Behavior: Allow a definition to be deleted
  * Input: "Delete"
  * Output: "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness." is deleted.

* Behavior: Allow an existing definition to be edited.
  * Input: "Edit definition"
  * Output: New definition "Not Gold" is added to the word "Gold"

## Legal

#### MIT License

### Copyright (c) 2020 Antonio Cruz

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
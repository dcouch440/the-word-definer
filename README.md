# The Word definer
#### *Created By: David Couch*

#### *Makes learning definitions fun!*
* * *
<!-- ADD HEROKU LINK -->
## Description
This is an app to make learning fun for children or adults alike! The application can add words to a home page and be clicked on to add definitions to such word. This application fallows CRUD functionality.

## What is crud functionality?
From [Wikipedia](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)\
"In computer programming, create, read, update, and delete are the four basic functions of persistent storage. Alternate words are sometimes used when defining the four basic functions of CRUD, such as retrieve instead of read, modify instead of update, or destroy instead of delete."

## Concept
Data can be put in a location (area) of a storage. The fundamental feature of a storage location is that it has a readable and updatable content (state). These read and update operations are the two basic operations on a storage and are known as the load–update pair (LUP).

Before a storage location can be read or updated, it needs to be available. A storage location can be made either available or unavailable for usage. These create and delete operations are the two other basic operations on a storage.

Together they make up the four basic operations of storage management (direct manipulation of the contents of storage locations by users) known as CRUD: create, read, update, and delete. CRUD operations are idempotent, meaning that multiple applications of the same operation have the same effect on a storage as a single application.


* * *

## Technologies used

* Ruby
* Rspec
* Sinatra
* Heroku

### Want to see this webpage now? <a href="https://polar-ravine-97022.herokuapp.com/">Visit This Heroku Link</a>

# Load it yourself? Fallow these installation instructions

* Go to ( https://github.com/dcouch440/the-word-definer ).
* Navigate to the code button on the github website.

* Click on the code button to open the menu.

- Copy the HTTPS code by clicking the clipboard next to the link.

- Within your Bash terminal navigate to your desired location by using cd followed by your desired directory.
```bash
 cd Desktop
```

- Once you have chosen your desired directory use the command.
```bash
git clone https://github.com/dcouch440/the-word-definer.git
```

<div
  style="
    background-color: #d1ecf1;
    color: grey; padding: 6px;
    font-size: 9px;
    border-radius: 5px;
    border: 1px solid #d4ecf1;
    margin-bottom: 12px"
>
  <span
    style="
      font-size: 12px;
      font-weight: 600;
      color: #0c5460;"
  >
    ⓘ
  </span>
  <span
    style="
      font-size: 12px;
      font-weight: 900;
      color: #0c5460;
      margin-bottom: 24px"
  >
    Note :
  </span>
  If you have any problems make sure your HTTPS code is correct! The example above might not be the most recent HTTPS code!
</div>


* Then after the process is completed use the command.

``` bash
code .
```

* Then type

``` bash
gem install bundler
```
* then type

``` bash
bundle install
```
* Then from the terminal you can run logical code through the terminal by typing

```bash
ruby app.rb
```

## Testing
* This project was created using **test-driven development** (TDD).

* To view the test suite, open the spec folder and find a the named function you wish to look at.

* To run the test suite yourself and verify program functionality

```bash
rspec
```

* If there is a problem in the code the testing suite will read as such :

<div>
  <img src="public/img/rspec-f2.PNG" alt="Failing RSpec test">
</div>

* Follow the examples and read the English that describes what the function should do. If everything is in order you should receive back :
<div>
  <img src="public/img/rspec-p.PNG" alt="Passing RSpec test">
</div>

## Addition comments:
* Created on 3/5/21

* * *

## Contact Information
_David Couch: [Email](dcouch440@gmail.com)_
* * *

## License
> [GPLv3](https://choosealicense.com/licenses/gpl-3.0/)\
> David Couch &copy; 2021
* * *
